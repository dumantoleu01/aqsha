import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/di/injection.dart';
import '../../../core/enums.dart';
import '../../../core/ui/category_visuals.dart';
import '../domain/budget_progress.dart';
import 'cubit/budgets_cubit.dart';
import 'cubit/budgets_state.dart';

class BudgetsScreen extends StatelessWidget {
  const BudgetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BudgetsCubit>(
      create: (_) => getIt<BudgetsCubit>(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Бюджеты')),
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.go('/budgets/new'),
          child: const Icon(Icons.add),
        ),
        body: BlocBuilder<BudgetsCubit, BudgetsState>(
          builder: (BuildContext context, BudgetsState state) =>
              switch (state) {
            BudgetsLoading() =>
              const Center(child: CircularProgressIndicator()),
            BudgetsLoaded(:final List<BudgetProgress> budgets) =>
              budgets.isEmpty
                  ? const _Empty()
                  : ListView(
                      padding: const EdgeInsets.fromLTRB(12, 12, 12, 96),
                      children: <Widget>[
                        for (final BudgetProgress b in budgets)
                          _BudgetCard(budget: b),
                      ],
                    ),
          },
        ),
      ),
    );
  }
}

class _Empty extends StatelessWidget {
  const _Empty();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Text(
          'Бюджетов пока нет.\nЗадайте лимит по категории, нажав +.',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class _BudgetCard extends StatelessWidget {
  const _BudgetCard({required this.budget});

  final BudgetProgress budget;

  String get _periodLabel =>
      budget.period == BudgetPeriod.week ? 'неделя' : 'месяц';

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final String lang = Localizations.localeOf(context).languageCode;
    final Color catColor = CategoryVisuals.colorFrom(
      budget.colorValue,
      fallback: scheme.primary,
    );
    final Color barColor = budget.isOver ? scheme.error : catColor;

    return Dismissible(
      key: ValueKey<int>(budget.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        color: scheme.errorContainer,
        padding: const EdgeInsets.only(right: 20),
        child: Icon(Icons.delete, color: scheme.onErrorContainer),
      ),
      confirmDismiss: (_) async {
        await context.read<BudgetsCubit>().delete(budget.id);
        return true;
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: catColor.withValues(alpha: 0.18),
                    foregroundColor: catColor,
                    child: Icon(
                      CategoryVisuals.iconFromCodePoint(budget.iconCodePoint),
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      '${budget.categoryName(lang)} · $_periodLabel',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: LinearProgressIndicator(
                  value: budget.ratio.clamp(0.0, 1.0),
                  minHeight: 10,
                  backgroundColor: scheme.surfaceContainerHighest,
                  color: barColor,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('${budget.spent.format()} из ${budget.limit.format()}'),
                  Text(
                    budget.isOver
                        ? 'Превышен на ${(-budget.remaining.minorUnits / 100).abs().toStringAsFixed(0)} ₸'
                        : 'Осталось ${budget.remaining.format()}',
                    style: TextStyle(
                      color: budget.isOver ? scheme.error : null,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
