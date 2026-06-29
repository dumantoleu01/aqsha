import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../../core/database/app_database.dart';

/// Экспорт/восстановление всех данных приложения в JSON.
/// Восстановление **полностью заменяет** текущие данные (снимок).
@lazySingleton
class BackupService {
  BackupService(this._db);

  final AppDatabase _db;
  static const int formatVersion = 1;

  Future<String> exportJson() async {
    final Map<String, dynamic> data = <String, dynamic>{
      'version': formatVersion,
      'exportedAt': DateTime.now().toIso8601String(),
      'accounts':
          (await _db.select(_db.accounts).get()).map((AccountRow e) => e.toJson()).toList(),
      'categories': (await _db.select(_db.categories).get())
          .map((CategoryRow e) => e.toJson())
          .toList(),
      'transactions': (await _db.select(_db.transactions).get())
          .map((TransactionRow e) => e.toJson())
          .toList(),
      'budgets':
          (await _db.select(_db.budgets).get()).map((BudgetRow e) => e.toJson()).toList(),
    };
    return const JsonEncoder.withIndent('  ').convert(data);
  }

  Future<BackupSummary> restoreJson(String jsonStr) async {
    final Map<String, dynamic> map =
        jsonDecode(jsonStr) as Map<String, dynamic>;

    List<Map<String, dynamic>> rows(String key) =>
        (map[key] as List<dynamic>? ?? <dynamic>[])
            .cast<Map<String, dynamic>>();

    final List<Map<String, dynamic>> accounts = rows('accounts');
    final List<Map<String, dynamic>> categories = rows('categories');
    final List<Map<String, dynamic>> transactions = rows('transactions');
    final List<Map<String, dynamic>> budgets = rows('budgets');

    await _db.transaction(() async {
      await _db.delete(_db.transactions).go();
      await _db.delete(_db.budgets).go();
      await _db.delete(_db.accounts).go();
      await _db.delete(_db.categories).go();

      for (final Map<String, dynamic> j in categories) {
        await _db.into(_db.categories).insert(
            CategoryRow.fromJson(j).toCompanion(true),
            mode: InsertMode.insertOrReplace);
      }
      for (final Map<String, dynamic> j in accounts) {
        await _db.into(_db.accounts).insert(
            AccountRow.fromJson(j).toCompanion(true),
            mode: InsertMode.insertOrReplace);
      }
      for (final Map<String, dynamic> j in transactions) {
        await _db.into(_db.transactions).insert(
            TransactionRow.fromJson(j).toCompanion(true),
            mode: InsertMode.insertOrReplace);
      }
      for (final Map<String, dynamic> j in budgets) {
        await _db.into(_db.budgets).insert(
            BudgetRow.fromJson(j).toCompanion(true),
            mode: InsertMode.insertOrReplace);
      }
    });

    return BackupSummary(
      accounts: accounts.length,
      categories: categories.length,
      transactions: transactions.length,
      budgets: budgets.length,
    );
  }
}

class BackupSummary {
  const BackupSummary({
    required this.accounts,
    required this.categories,
    required this.transactions,
    required this.budgets,
  });

  final int accounts;
  final int categories;
  final int transactions;
  final int budgets;

  int get total => accounts + categories + transactions + budgets;
}
