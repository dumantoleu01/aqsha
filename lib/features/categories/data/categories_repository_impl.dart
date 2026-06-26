import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../../core/database/app_database.dart';
import '../../../core/enums.dart';
import '../domain/categories_repository.dart';
import '../domain/category.dart';

@LazySingleton(as: CategoriesRepository)
class CategoriesRepositoryImpl implements CategoriesRepository {
  CategoriesRepositoryImpl(this._db);

  final AppDatabase _db;

  @override
  Stream<List<Category>> watchCategories({EntryType? type}) {
    final SimpleSelectStatement<$CategoriesTable, CategoryRow> query =
        _db.select(_db.categories)
          ..where(($CategoriesTable t) => t.isArchived.equals(false));
    if (type != null) {
      query.where(($CategoriesTable t) => t.type.equalsValue(type));
    }
    query.orderBy(<OrderClauseGenerator<$CategoriesTable>>[
      ($CategoriesTable t) => OrderingTerm(expression: t.sortOrder),
      ($CategoriesTable t) => OrderingTerm(expression: t.id),
    ]);
    return query.watch().map(
          (List<CategoryRow> rows) => rows.map(_map).toList(),
        );
  }

  Category _map(CategoryRow r) => Category(
        id: r.id,
        nameKk: r.nameKk,
        nameRu: r.nameRu,
        type: r.type,
        iconCodePoint: r.iconCodePoint,
        colorValue: r.colorValue,
        isArchived: r.isArchived,
        sortOrder: r.sortOrder,
      );

  @override
  Future<int> createCategory({
    required String nameKk,
    required String nameRu,
    required EntryType type,
    int? iconCodePoint,
    int? colorValue,
  }) {
    return _db.into(_db.categories).insert(
          CategoriesCompanion.insert(
            nameKk: nameKk,
            nameRu: nameRu,
            type: type,
            iconCodePoint: Value<int?>(iconCodePoint),
            colorValue: Value<int?>(colorValue),
          ),
        );
  }

  @override
  Future<void> archiveCategory(int id) async {
    await (_db.update(_db.categories)
          ..where(($CategoriesTable t) => t.id.equals(id)))
        .write(const CategoriesCompanion(isArchived: Value<bool>(true)));
  }
}
