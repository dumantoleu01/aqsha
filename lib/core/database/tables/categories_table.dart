import 'package:drift/drift.dart';

import '../../enums.dart';

@DataClassName('CategoryRow')
class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nameKk => text()();
  TextColumn get nameRu => text()();
  IntColumn get type => intEnum<EntryType>()();
  IntColumn get iconCodePoint => integer().nullable()();
  IntColumn get colorValue => integer().nullable()();
  BoolColumn get isArchived => boolean().withDefault(const Constant(false))();
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();
}
