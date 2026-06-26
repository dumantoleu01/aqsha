import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../../core/database/app_database.dart';
import '../../../core/enums.dart';
import '../domain/budget_progress.dart';
import '../domain/budgets_repository.dart';

@LazySingleton(as: BudgetsRepository)
class BudgetsRepositoryImpl implements BudgetsRepository {
  BudgetsRepositoryImpl(this._db);

  final AppDatabase _db;

  @override
  Stream<List<BudgetProgress>> watchBudgets() {
    final DateTime now = DateTime.now();
    final DateTime today = DateTime(now.year, now.month, now.day);
    final DateTime weekStart = today.subtract(Duration(days: today.weekday - 1));
    final DateTime monthStart = DateTime(now.year, now.month);
    int sec(DateTime d) => d.millisecondsSinceEpoch ~/ 1000;

    // spent = расходы по категории бюджета с начала его текущего периода.
    return _db.customSelect(
      'SELECT b.id AS id, b.category_id AS category_id, b.period AS period, '
      'b.limit_minor AS limit_minor, '
      'c.name_kk AS name_kk, c.name_ru AS name_ru, '
      'c.icon_code_point AS icon_code_point, c.color_value AS color_value, '
      'COALESCE(('
      '  SELECT SUM(t.amount_minor) FROM transactions t '
      '  WHERE t.category_id = b.category_id '
      '    AND t.type = ? AND t.status = ? '
      '    AND t.date >= (CASE WHEN b.period = ? THEN ? ELSE ? END)'
      '), 0) AS spent '
      'FROM budgets b '
      'INNER JOIN categories c ON c.id = b.category_id '
      'ORDER BY b.id',
      variables: <Variable<Object>>[
        Variable.withInt(EntryType.expense.index),
        Variable.withInt(TransactionStatus.confirmed.index),
        Variable.withInt(BudgetPeriod.week.index),
        Variable.withInt(sec(weekStart)),
        Variable.withInt(sec(monthStart)),
      ],
      readsFrom: <ResultSetImplementation<dynamic, dynamic>>{
        _db.budgets,
        _db.categories,
        _db.transactions,
      },
    ).watch().map(
          (List<QueryRow> rows) => rows.map(_mapRow).toList(),
        );
  }

  BudgetProgress _mapRow(QueryRow r) => BudgetProgress(
        id: r.read<int>('id'),
        categoryId: r.read<int>('category_id'),
        period: BudgetPeriod.values[r.read<int>('period')],
        limitMinor: r.read<int>('limit_minor'),
        spentMinor: r.read<int>('spent'),
        categoryNameKk: r.readNullable<String>('name_kk'),
        categoryNameRu: r.readNullable<String>('name_ru'),
        iconCodePoint: r.readNullable<int>('icon_code_point'),
        colorValue: r.readNullable<int>('color_value'),
      );

  @override
  Future<int> createBudget({
    required int categoryId,
    required BudgetPeriod period,
    required int limitMinor,
  }) {
    return _db.into(_db.budgets).insert(
          BudgetsCompanion.insert(
            categoryId: categoryId,
            period: Value<BudgetPeriod>(period),
            limitMinor: limitMinor,
          ),
        );
  }

  @override
  Future<void> deleteBudget(int id) async {
    await (_db.delete(_db.budgets)..where(($BudgetsTable t) => t.id.equals(id)))
        .go();
  }
}
