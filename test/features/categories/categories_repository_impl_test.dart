import 'package:aqsha/core/database/app_database.dart';
import 'package:aqsha/core/enums.dart';
import 'package:aqsha/features/categories/data/categories_repository_impl.dart';
import 'package:aqsha/features/categories/domain/category.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase db;
  late CategoriesRepositoryImpl repo;

  setUp(() {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    repo = CategoriesRepositoryImpl(db);
  });
  tearDown(() => db.close());

  test('watchCategories фильтрует по типу', () async {
    final List<Category> expense =
        await repo.watchCategories(type: EntryType.expense).first;
    final List<Category> income =
        await repo.watchCategories(type: EntryType.income).first;

    expect(expense, isNotEmpty);
    expect(income, isNotEmpty);
    expect(expense.every((Category c) => c.type == EntryType.expense), isTrue);
    expect(income.every((Category c) => c.type == EntryType.income), isTrue);
  });

  test('создание и архивация кастомной категории', () async {
    final int id = await repo.createCategory(
      nameKk: 'Тест',
      nameRu: 'Тест',
      type: EntryType.expense,
    );

    List<Category> all = await repo.watchCategories().first;
    expect(all.any((Category c) => c.id == id), isTrue);

    await repo.archiveCategory(id);
    all = await repo.watchCategories().first;
    expect(all.any((Category c) => c.id == id), isFalse);
  });
}
