import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection.dart';
import '../../../core/money/money.dart';
import '../../../core/ui/category_visuals.dart';
import '../domain/category_spending.dart';
import '../domain/period_summary.dart';
import 'cubit/dashboard_cubit.dart';
import 'cubit/dashboard_state.dart';
import 'dashboard_period.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DashboardCubit>(
      create: (_) => getIt<DashboardCubit>(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Aqsha')),
        body: BlocBuilder<DashboardCubit, DashboardState>(
          builder: (BuildContext context, DashboardState state) =>
              switch (state) {
            DashboardLoading() =>
              const Center(child: CircularProgressIndicator()),
            DashboardLoaded() => _DashboardBody(state: state),
          },
        ),
      ),
    );
  }
}

class _DashboardBody extends StatelessWidget {
  const _DashboardBody({required this.state});

  final DashboardLoaded state;

  @override
  Widget build(BuildContext context) {
    final String lang = Localizations.localeOf(context).languageCode;
    final PeriodSummary s = state.summary;
    return ListView(
      padding: const EdgeInsets.all(16),
      children: <Widget>[
        _BalanceCard(balance: Money(state.totalBalanceMinor)),
        const SizedBox(height: 16),
        SegmentedButton<DashboardPeriod>(
          segments: <ButtonSegment<DashboardPeriod>>[
            for (final DashboardPeriod p in DashboardPeriod.values)
              ButtonSegment<DashboardPeriod>(value: p, label: Text(p.label)),
          ],
          selected: <DashboardPeriod>{state.period},
          onSelectionChanged: (Set<DashboardPeriod> sel) =>
              context.read<DashboardCubit>().setPeriod(sel.first),
        ),
        const SizedBox(height: 16),
        Row(
          children: <Widget>[
            Expanded(
              child: _MiniCard(
                label: 'Доходы',
                amount: s.income,
                color: const Color(0xFF2E7D32),
                icon: Icons.north_east,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _MiniCard(
                label: 'Расходы',
                amount: s.expense,
                color: Theme.of(context).colorScheme.error,
                icon: Icons.south_west,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Text('Расходы по категориям',
            style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 12),
        if (s.expenseByCategory.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 32),
            child: Center(child: Text('Нет расходов за период')),
          )
        else
          _ExpensePie(summary: s, lang: lang),
      ],
    );
  }
}

class _BalanceCard extends StatelessWidget {
  const _BalanceCard({required this.balance});

  final Money balance;

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    return Card(
      color: scheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Общий баланс',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: scheme.onPrimaryContainer,
                    )),
            const SizedBox(height: 8),
            Text(
              balance.format(),
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: scheme.onPrimaryContainer,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MiniCard extends StatelessWidget {
  const _MiniCard({
    required this.label,
    required this.amount,
    required this.color,
    required this.icon,
  });

  final String label;
  final Money amount;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(icon, color: color, size: 18),
                const SizedBox(width: 6),
                Text(label, style: Theme.of(context).textTheme.labelMedium),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              amount.format(),
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: color, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}

class _ExpensePie extends StatelessWidget {
  const _ExpensePie({required this.summary, required this.lang});

  final PeriodSummary summary;
  final String lang;

  Color _colorFor(CategorySpending c, int index) {
    return CategoryVisuals.colorFrom(
      c.colorValue,
      fallback: Color(
        CategoryVisuals.colors[index % CategoryVisuals.colors.length],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final int total = summary.expenseMinor;
    final List<CategorySpending> items = summary.expenseByCategory;
    return Column(
      children: <Widget>[
        SizedBox(
          height: 200,
          child: PieChart(
            PieChartData(
              sectionsSpace: 2,
              centerSpaceRadius: 48,
              sections: <PieChartSectionData>[
                for (int i = 0; i < items.length; i++)
                  PieChartSectionData(
                    value: items[i].totalMinor.toDouble(),
                    color: _colorFor(items[i], i),
                    radius: 52,
                    showTitle: false,
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        for (int i = 0; i < items.length; i++)
          _LegendRow(
            color: _colorFor(items[i], i),
            name: items[i].name(lang),
            amount: items[i].total,
            percent: total == 0 ? 0 : items[i].totalMinor / total * 100,
          ),
      ],
    );
  }
}

class _LegendRow extends StatelessWidget {
  const _LegendRow({
    required this.color,
    required this.name,
    required this.amount,
    required this.percent,
  });

  final Color color;
  final String name;
  final Money amount;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: <Widget>[
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 10),
          Expanded(child: Text(name)),
          Text('${percent.toStringAsFixed(0)}%  ',
              style: Theme.of(context).textTheme.bodySmall),
          Text(amount.format(),
              style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
