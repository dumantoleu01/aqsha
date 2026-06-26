import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/di/injection.dart';
import '../../../core/enums.dart';
import '../../../core/ui/category_visuals.dart';
import '../../../l10n/app_localizations.dart';
import '../domain/category.dart';
import 'cubit/categories_cubit.dart';
import 'cubit/categories_state.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l = AppLocalizations.of(context);
    return BlocProvider<CategoriesCubit>(
      create: (_) => getIt<CategoriesCubit>(),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(l.catTitle),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(text: l.catExpenses),
                Tab(text: l.catIncomes),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => context.go('/settings/categories/new'),
            child: const Icon(Icons.add),
          ),
          body: BlocBuilder<CategoriesCubit, CategoriesState>(
            builder: (BuildContext context, CategoriesState state) =>
                switch (state) {
              CategoriesLoading() =>
                const Center(child: CircularProgressIndicator()),
              CategoriesLoaded(:final List<Category> categories) => TabBarView(
                  children: <Widget>[
                    _CategoryList(
                      items: categories
                          .where((Category c) => c.type == EntryType.expense)
                          .toList(),
                    ),
                    _CategoryList(
                      items: categories
                          .where((Category c) => c.type == EntryType.income)
                          .toList(),
                    ),
                  ],
                ),
            },
          ),
        ),
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList({required this.items});

  final List<Category> items;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l = AppLocalizations.of(context);
    if (items.isEmpty) {
      return Center(child: Text(l.catEmpty));
    }
    final String lang = Localizations.localeOf(context).languageCode;
    return ListView.separated(
      itemCount: items.length,
      separatorBuilder: (_, _) => const Divider(height: 1),
      itemBuilder: (BuildContext context, int i) {
        final Category c = items[i];
        final Color color = CategoryVisuals.colorFrom(
          c.colorValue,
          fallback: Theme.of(context).colorScheme.primary,
        );
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: color.withValues(alpha: 0.18),
            foregroundColor: color,
            child: Icon(CategoryVisuals.iconFromCodePoint(c.iconCodePoint)),
          ),
          title: Text(c.localizedName(lang)),
          trailing: IconButton(
            icon: const Icon(Icons.delete_outline),
            tooltip: l.delete,
            onPressed: () => _confirmArchive(context, c, lang),
          ),
        );
      },
    );
  }

  Future<void> _confirmArchive(
      BuildContext context, Category c, String lang) async {
    final AppLocalizations l = AppLocalizations.of(context);
    final CategoriesCubit cubit = context.read<CategoriesCubit>();
    final bool? ok = await showDialog<bool>(
      context: context,
      builder: (BuildContext ctx) => AlertDialog(
        title: Text(l.catDeleteTitle),
        content: Text(c.localizedName(lang)),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l.delete),
          ),
        ],
      ),
    );
    if (ok ?? false) {
      await cubit.archive(c.id);
    }
  }
}
