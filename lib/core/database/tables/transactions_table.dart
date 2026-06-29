import 'package:drift/drift.dart';

import '../../enums.dart';
import 'accounts_table.dart';
import 'categories_table.dart';

@DataClassName('TransactionRow')
class Transactions extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get accountId =>
      integer().references(Accounts, #id, onDelete: KeyAction.cascade)();
  IntColumn get categoryId =>
      integer().nullable().references(Categories, #id, onDelete: KeyAction.setNull)();

  /// Сумма в тиынах, всегда положительная. Знак определяется полем [type].
  IntColumn get amountMinor => integer()();
  IntColumn get type => intEnum<EntryType>()();
  DateTimeColumn get date => dateTime()();
  TextColumn get note => text().nullable()();
  TextColumn get merchant => text().nullable()();
  IntColumn get source => intEnum<TransactionSource>()
      .withDefault(Constant(TransactionSource.manual.index))();
  IntColumn get status => intEnum<TransactionStatus>()
      .withDefault(Constant(TransactionStatus.confirmed.index))();
  DateTimeColumn get createdAt =>
      dateTime().withDefault(currentDateAndTime)();

  /// Сигнатура операции из импорта выписки — для защиты от дублей.
  TextColumn get importHash => text().nullable()();
}
