import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/di/injection.dart';
import '../../../core/enums.dart';
import '../../../core/money/money.dart';
import '../../../core/ui/category_visuals.dart';
import '../../categories/domain/categories_repository.dart';
import '../../categories/domain/category.dart';
import '../domain/budgets_repository.dart';

class BudgetFormScreen extends StatefulWidget {
  const BudgetFormScreen({super.key});

  @override
  State<BudgetFormScreen> createState() => _BudgetFormScreenState();
}

class _BudgetFormScreenState extends State<BudgetFormScreen> {
  final TextEditingController _limit = TextEditingController();
  List<Category>? _categories;
  Category? _category;
  BudgetPeriod _period = BudgetPeriod.month;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final List<Category> cats = await getIt<CategoriesRepository>()
        .watchCategories(type: EntryType.expense)
        .first;
    if (!mounted) return;
    setState(() {
      _categories = cats;
      _category = cats.isNotEmpty ? cats.first : null;
    });
  }

  @override
  void dispose() {
    _limit.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final double major =
        double.tryParse(_limit.text.replaceAll(',', '.').trim()) ?? 0;
    if (major <= 0) {
      _toast('Введите лимит больше нуля');
      return;
    }
    if (_category == null) {
      _toast('Выберите категорию');
      return;
    }
    setState(() => _saving = true);
    await getIt<BudgetsRepository>().createBudget(
      categoryId: _category!.id,
      period: _period,
      limitMinor: Money.fromMajor(major).minorUnits,
    );
    if (!mounted) return;
    if (context.canPop()) {
      context.pop();
    } else {
      context.go('/budgets');
    }
  }

  void _toast(String msg) => ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(msg)));

  @override
  Widget build(BuildContext context) {
    final List<Category>? cats = _categories;
    return Scaffold(
      appBar: AppBar(title: const Text('Новый бюджет')),
      body: cats == null
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16),
              children: <Widget>[
                SegmentedButton<BudgetPeriod>(
                  segments: const <ButtonSegment<BudgetPeriod>>[
                    ButtonSegment<BudgetPeriod>(
                      value: BudgetPeriod.week,
                      label: Text('Неделя'),
                    ),
                    ButtonSegment<BudgetPeriod>(
                      value: BudgetPeriod.month,
                      label: Text('Месяц'),
                    ),
                  ],
                  selected: <BudgetPeriod>{_period},
                  onSelectionChanged: (Set<BudgetPeriod> s) =>
                      setState(() => _period = s.first),
                ),
                const SizedBox(height: 20),
                Text('Категория',
                    style: Theme.of(context).textTheme.labelLarge),
                const SizedBox(height: 8),
                _CategoryChips(
                  categories: cats,
                  selected: _category,
                  onPick: (Category c) => setState(() => _category = c),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _limit,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                    labelText: 'Лимит, ₸',
                    hintText: '0',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 24),
                FilledButton.icon(
                  onPressed: _saving ? null : _save,
                  icon: const Icon(Icons.check),
                  label: const Text('Сохранить'),
                ),
              ],
            ),
    );
  }
}

class _CategoryChips extends StatelessWidget {
  const _CategoryChips({
    required this.categories,
    required this.selected,
    required this.onPick,
  });

  final List<Category> categories;
  final Category? selected;
  final ValueChanged<Category> onPick;

  @override
  Widget build(BuildContext context) {
    if (categories.isEmpty) {
      return const Text('Нет категорий расходов');
    }
    final String lang = Localizations.localeOf(context).languageCode;
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: <Widget>[
        for (final Category c in categories)
          ChoiceChip(
            selected: selected?.id == c.id,
            avatar: Icon(
              CategoryVisuals.iconFromCodePoint(c.iconCodePoint),
              size: 18,
            ),
            label: Text(c.localizedName(lang)),
            onSelected: (_) => onPick(c),
          ),
      ],
    );
  }
}
