import 'package:drift/drift.dart';

import '../../enums.dart';
import 'categories_table.dart';

@DataClassName('BudgetRow')
class Budgets extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get categoryId =>
      integer().references(Categories, #id, onDelete: KeyAction.cascade)();
  IntColumn get period => intEnum<BudgetPeriod>()
      .withDefault(Constant(BudgetPeriod.month.index))();

  /// Лимит в тиынах.
  IntColumn get limitMinor => integer()();
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();
}
