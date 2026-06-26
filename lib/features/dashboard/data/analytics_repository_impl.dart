import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../../core/database/app_database.dart';
import '../../../core/enums.dart';
import '../domain/analytics_repository.dart';
import '../domain/category_spending.dart';
import '../domain/period_summary.dart';

@LazySingleton(as: AnalyticsRepository)
class AnalyticsRepositoryImpl implements AnalyticsRepository {
  AnalyticsRepositoryImpl(this._db);

  final AppDatabase _db;

  @override
  Stream<PeriodSummary> watchPeriod(DateTime from, DateTime to) {
    final JoinedSelectStatement<HasResultSet, dynamic> query =
        (_db.select(_db.transactions)
              ..where(($TransactionsTable t) =>
                  t.status.equalsValue(TransactionStatus.confirmed) &
                  t.date.isBiggerOrEqualValue(from) &
                  t.date.isSmallerThanValue(to)))
            .join(<Join<HasResultSet, dynamic>>[
      leftOuterJoin(
        _db.categories,
        _db.categories.id.equalsExp(_db.transactions.categoryId),
      ),
    ]);

    return query.watch().map(_aggregate);
  }

  PeriodSummary _aggregate(List<TypedResult> rows) {
    int income = 0;
    int expense = 0;
    final Map<int?, CategorySpending> byCategory = <int?, CategorySpending>{};

    for (final TypedResult row in rows) {
      final TransactionRow t = row.readTable(_db.transactions);
      if (t.type == EntryType.income) {
        income += t.amountMinor;
        continue;
      }
      expense += t.amountMinor;
      final CategoryRow? c = row.readTableOrNull(_db.categories);
      final int? key = t.categoryId;
      final CategorySpending? prev = byCategory[key];
      byCategory[key] = CategorySpending(
        categoryId: key,
        nameKk: c?.nameKk,
        nameRu: c?.nameRu,
        iconCodePoint: c?.iconCodePoint,
        colorValue: c?.colorValue,
        totalMinor: (prev?.totalMinor ?? 0) + t.amountMinor,
      );
    }

    final List<CategorySpending> list = byCategory.values.toList()
      ..sort((CategorySpending a, CategorySpending b) =>
          b.totalMinor.compareTo(a.totalMinor));

    return PeriodSummary(
      incomeMinor: income,
      expenseMinor: expense,
      expenseByCategory: list,
    );
  }
}
