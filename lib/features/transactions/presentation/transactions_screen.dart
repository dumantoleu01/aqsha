import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/di/injection.dart';
import '../../../core/ui/category_visuals.dart';
import '../../../core/ui/date_labels.dart';
import '../../../l10n/app_localizations.dart';
import '../domain/transaction_list_item.dart';
import 'cubit/transactions_cubit.dart';
import 'cubit/transactions_state.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l = AppLocalizations.of(context);
    return BlocProvider<TransactionsCubit>(
      create: (_) => getIt<TransactionsCubit>(),
      child: Scaffold(
        appBar: AppBar(title: Text(l.txTitle)),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => context.go('/transactions/new'),
          icon: const Icon(Icons.add),
          label: Text(l.txAdd),
        ),
        body: BlocBuilder<TransactionsCubit, TransactionsState>(
          builder: (BuildContext context, TransactionsState state) =>
              switch (state) {
            TransactionsLoading() =>
              const Center(child: CircularProgressIndicator()),
            TransactionsLoaded(:final List<TransactionListItem> items) =>
              items.isEmpty
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Text(l.txEmpty, textAlign: TextAlign.center),
                      ),
                    )
                  : _Ledger(items: items),
          },
        ),
      ),
    );
  }
}

class _Ledger extends StatelessWidget {
  const _Ledger({required this.items});

  final List<TransactionListItem> items;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l = AppLocalizations.of(context);
    final String lang = Localizations.localeOf(context).languageCode;
    final List<Widget> children = <Widget>[];
    DateTime? currentDay;
    for (final TransactionListItem item in items) {
      final DateTime day = DateUtils.dateOnly(item.date);
      if (currentDay == null || day != currentDay) {
        currentDay = day;
        children.add(_DayHeader(
          label: formatDayHeader(
            item.date,
            today: l.dayToday,
            yesterday: l.dayYesterday,
            locale: lang,
          ),
        ));
      }
      children.add(_TxTile(item: item, lang: lang));
    }
    return ListView(
      padding: const EdgeInsets.only(bottom: 96),
      children: children,
    );
  }
}

class _DayHeader extends StatelessWidget {
  const _DayHeader({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
      ),
    );
  }
}

class _TxTile extends StatelessWidget {
  const _TxTile({required this.item, required this.lang});

  final TransactionListItem item;
  final String lang;

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final Color catColor = CategoryVisuals.colorFrom(
      item.categoryColorValue,
      fallback: scheme.primary,
    );
    final Color amountColor =
        item.isExpense ? scheme.error : const Color(0xFF2E7D32);
    final String sign = item.isExpense ? '− ' : '+ ';

    return Dismissible(
      key: ValueKey<int>(item.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        color: scheme.errorContainer,
        padding: const EdgeInsets.only(right: 20),
        child: Icon(Icons.delete, color: scheme.onErrorContainer),
      ),
      confirmDismiss: (_) async {
        await context.read<TransactionsCubit>().delete(item.id);
        return true;
      },
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: catColor.withValues(alpha: 0.18),
          foregroundColor: catColor,
          child: Icon(
            CategoryVisuals.iconFromCodePoint(item.categoryIconCodePoint),
          ),
        ),
        title: Text(item.title(lang)),
        subtitle: Text(item.accountName),
        trailing: Text(
          '$sign${item.amount.format()}',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: amountColor,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
    );
  }
}
