import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection.dart';
import '../../../core/ui/category_visuals.dart';
import '../../../l10n/app_localizations.dart';
import '../../categories/domain/categories_repository.dart';
import '../../categories/domain/category.dart';
import '../../transactions/domain/transaction_list_item.dart';
import '../data/notification_capture_service.dart';
import 'cubit/drafts_cubit.dart';
import 'cubit/drafts_state.dart';

class AutoCaptureScreen extends StatefulWidget {
  const AutoCaptureScreen({super.key});

  @override
  State<AutoCaptureScreen> createState() => _AutoCaptureScreenState();
}

class _AutoCaptureScreenState extends State<AutoCaptureScreen> {
  final NotificationCaptureService _capture =
      getIt<NotificationCaptureService>();
  List<Category> _categories = <Category>[];
  final Map<int, int?> _selected = <int, int?>{};
  bool _enabled = false;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    final List<Category> cats =
        await getIt<CategoriesRepository>().watchCategories().first;
    final bool enabled = await _capture.isEnabled();
    if (!mounted) return;
    setState(() {
      _categories = cats;
      _enabled = enabled;
    });
  }

  Future<void> _enable() async {
    await _capture.requestPermission();
    _capture.start();
    final bool enabled = await _capture.isEnabled();
    if (!mounted) return;
    setState(() => _enabled = enabled);
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l = AppLocalizations.of(context);
    if (!_capture.isSupported) {
      return Scaffold(
        appBar: AppBar(title: Text(l.acTitle)),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text(l.acOnlyAndroid, textAlign: TextAlign.center),
          ),
        ),
      );
    }

    return BlocProvider<DraftsCubit>(
      create: (_) => getIt<DraftsCubit>(),
      child: Scaffold(
        appBar: AppBar(title: Text(l.acTitle)),
        body: Column(
          children: <Widget>[
            _PermissionCard(enabled: _enabled, onEnable: _enable, l: l),
            const Divider(height: 1),
            Expanded(child: _drafts(l)),
          ],
        ),
      ),
    );
  }

  Widget _drafts(AppLocalizations l) {
    return BlocBuilder<DraftsCubit, DraftsState>(
      builder: (BuildContext context, DraftsState state) => switch (state) {
        DraftsLoading() => const Center(child: CircularProgressIndicator()),
        DraftsLoaded(:final List<TransactionListItem> drafts) => drafts.isEmpty
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(l.acNoDrafts, textAlign: TextAlign.center),
                ),
              )
            : ListView.separated(
                itemCount: drafts.length,
                separatorBuilder: (_, _) => const Divider(height: 1),
                itemBuilder: (BuildContext context, int i) => _DraftTile(
                  draft: drafts[i],
                  categories: _categories,
                  selectedCategoryId: _selected[drafts[i].id],
                  onCategory: (int? v) =>
                      setState(() => _selected[drafts[i].id] = v),
                  l: l,
                ),
              ),
      },
    );
  }
}

class _PermissionCard extends StatelessWidget {
  const _PermissionCard(
      {required this.enabled, required this.onEnable, required this.l});

  final bool enabled;
  final VoidCallback onEnable;
  final AppLocalizations l;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(enabled ? Icons.check_circle : Icons.notifications_active,
                  color: enabled
                      ? const Color(0xFF2E7D32)
                      : Theme.of(context).colorScheme.primary),
              const SizedBox(width: 8),
              Expanded(
                child: Text(enabled ? l.acEnabled : l.acPermissionHint),
              ),
            ],
          ),
          if (!enabled) ...<Widget>[
            const SizedBox(height: 12),
            FilledButton.icon(
              onPressed: onEnable,
              icon: const Icon(Icons.notifications),
              label: Text(l.acEnable),
            ),
          ],
          const SizedBox(height: 12),
          Text(
            l.acBatteryNote,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}

class _DraftTile extends StatelessWidget {
  const _DraftTile({
    required this.draft,
    required this.categories,
    required this.selectedCategoryId,
    required this.onCategory,
    required this.l,
  });

  final TransactionListItem draft;
  final List<Category> categories;
  final int? selectedCategoryId;
  final ValueChanged<int?> onCategory;
  final AppLocalizations l;

  @override
  Widget build(BuildContext context) {
    final String lang = Localizations.localeOf(context).languageCode;
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final List<Category> ofType =
        categories.where((Category c) => c.type == draft.type).toList();
    final String sign = draft.isExpense ? '− ' : '+ ';

    return Dismissible(
      key: ValueKey<int>(draft.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        color: scheme.errorContainer,
        padding: const EdgeInsets.only(right: 20),
        child: Icon(Icons.delete, color: scheme.onErrorContainer),
      ),
      confirmDismiss: (_) async {
        await context.read<DraftsCubit>().discard(draft.id);
        return true;
      },
      child: ListTile(
        title: Text(draft.title(lang),
            maxLines: 1, overflow: TextOverflow.ellipsis),
        subtitle: DropdownButton<int?>(
          value: selectedCategoryId,
          isExpanded: true,
          isDense: true,
          hint: Text(l.fieldCategory),
          items: <DropdownMenuItem<int?>>[
            DropdownMenuItem<int?>(
                value: null, child: Text('— ${l.fieldCategory}')),
            for (final Category c in ofType)
              DropdownMenuItem<int?>(
                value: c.id,
                child: Row(
                  children: <Widget>[
                    Icon(CategoryVisuals.iconFromCodePoint(c.iconCodePoint),
                        size: 16),
                    const SizedBox(width: 6),
                    Flexible(child: Text(c.localizedName(lang))),
                  ],
                ),
              ),
          ],
          onChanged: onCategory,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('$sign${draft.amount.format()}',
                style: const TextStyle(fontWeight: FontWeight.w600)),
            IconButton(
              icon: const Icon(Icons.check_circle_outline),
              tooltip: l.acConfirm,
              onPressed: () => context
                  .read<DraftsCubit>()
                  .confirm(draft.id, categoryId: selectedCategoryId),
            ),
          ],
        ),
      ),
    );
  }
}
