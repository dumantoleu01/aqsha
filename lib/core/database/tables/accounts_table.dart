import 'package:drift/drift.dart';

import '../../enums.dart';

@DataClassName('AccountRow')
class Accounts extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 60)();
  IntColumn get type => intEnum<AccountType>()();
  TextColumn get currency => text().withDefault(const Constant('KZT'))();

  /// Стартовый остаток в тиынах. Текущий баланс = стартовый + сумма операций.
  IntColumn get initialBalanceMinor =>
      integer().withDefault(const Constant(0))();

  IntColumn get iconCodePoint => integer().nullable()();
  IntColumn get colorValue => integer().nullable()();
  BoolColumn get isArchived => boolean().withDefault(const Constant(false))();
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();
}
