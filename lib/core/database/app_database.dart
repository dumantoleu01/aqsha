import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart' hide Table, Column;
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../enums.dart';
import 'tables/accounts_table.dart';
import 'tables/budgets_table.dart';
import 'tables/categories_table.dart';
import 'tables/transactions_table.dart';

part 'app_database.g.dart';

/// Локальная БД приложения (SQLite через Drift).
@lazySingleton
@DriftDatabase(
  tables: <Type>[Accounts, Categories, Transactions, Budgets],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  /// Конструктор для тестов (in-memory БД).
  @visibleForTesting
  AppDatabase.forTesting(super.executor);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async {
          await m.createAll();
          await _seedDefaultCategories();
        },
        beforeOpen: (OpeningDetails details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
      );

  Future<void> _seedDefaultCategories() async {
    await batch((Batch b) => b.insertAll(categories, _defaultCategories));
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final Directory dir = await getApplicationDocumentsDirectory();
    final File file = File(p.join(dir.path, 'aqsha.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

/// Дефолтные категории (kk + ru), создаются при первом запуске.
List<CategoriesCompanion> get _defaultCategories => <CategoriesCompanion>[
      // --- Расходы ---
      _cat('Азық-түлік', 'Продукты', EntryType.expense,
          Icons.shopping_cart, 0xFF4CAF50, 0),
      _cat('Көлік', 'Транспорт', EntryType.expense,
          Icons.directions_bus, 0xFF3F51B5, 1),
      _cat('Кафе', 'Кафе и рестораны', EntryType.expense,
          Icons.restaurant, 0xFFFF9800, 2),
      _cat('Тұрғын үй', 'Жильё', EntryType.expense,
          Icons.home, 0xFF795548, 3),
      _cat('Денсаулық', 'Здоровье', EntryType.expense,
          Icons.local_hospital, 0xFFE91E63, 4),
      _cat('Киім', 'Одежда', EntryType.expense,
          Icons.checkroom, 0xFF9C27B0, 5),
      _cat('Ойын-сауық', 'Развлечения', EntryType.expense,
          Icons.movie, 0xFFF44336, 6),
      _cat('Байланыс', 'Связь', EntryType.expense,
          Icons.wifi, 0xFF00BCD4, 7),
      _cat('Білім', 'Образование', EntryType.expense,
          Icons.school, 0xFF009688, 8),
      _cat('Балалар', 'Дети', EntryType.expense,
          Icons.child_care, 0xFFFFC107, 9),
      _cat('Сыйлықтар', 'Подарки', EntryType.expense,
          Icons.card_giftcard, 0xFFCDDC39, 10),
      _cat('Басқа', 'Другое', EntryType.expense,
          Icons.category, 0xFF607D8B, 11),
      // --- Доходы ---
      _cat('Жалақы', 'Зарплата', EntryType.income,
          Icons.payments, 0xFF2E7D32, 0),
      _cat('Қосымша табыс', 'Подработка', EntryType.income,
          Icons.work, 0xFF1565C0, 1),
      _cat('Сыйлық', 'Подарок', EntryType.income,
          Icons.redeem, 0xFFAD1457, 2),
      _cat('Басқа', 'Другое', EntryType.income,
          Icons.category, 0xFF607D8B, 3),
    ];

CategoriesCompanion _cat(
  String nameKk,
  String nameRu,
  EntryType type,
  IconData icon,
  int color,
  int sortOrder,
) {
  return CategoriesCompanion.insert(
    nameKk: nameKk,
    nameRu: nameRu,
    type: type,
    iconCodePoint: Value<int?>(icon.codePoint),
    colorValue: Value<int?>(color),
    sortOrder: Value<int>(sortOrder),
  );
}
