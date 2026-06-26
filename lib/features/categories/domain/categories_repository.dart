import '../../../core/enums.dart';
import 'category.dart';

abstract interface class CategoriesRepository {
  /// Активные категории, опционально только нужного типа (доход/расход).
  Stream<List<Category>> watchCategories({EntryType? type});

  Future<int> createCategory({
    required String nameKk,
    required String nameRu,
    required EntryType type,
    int? iconCodePoint,
    int? colorValue,
  });

  Future<void> archiveCategory(int id);
}
