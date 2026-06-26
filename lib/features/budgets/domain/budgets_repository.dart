import '../../../core/enums.dart';
import 'budget_progress.dart';

abstract interface class BudgetsRepository {
  /// Бюджеты с уже посчитанной потраченной суммой за текущий период.
  Stream<List<BudgetProgress>> watchBudgets();

  Future<int> createBudget({
    required int categoryId,
    required BudgetPeriod period,
    required int limitMinor,
  });

  Future<void> deleteBudget(int id);
}
