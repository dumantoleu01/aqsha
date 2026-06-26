import 'package:aqsha/core/database/app_database.dart';
import 'package:aqsha/core/enums.dart';
import 'package:aqsha/features/transactions/data/transactions_repository_impl.dart';
import 'package:aqsha/features/transactions/domain/transaction_list_item.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase db;
  late TransactionsRepositoryImpl repo;

  setUp(() {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    repo = TransactionsRepositoryImpl(db);
  });
  tearDown(() => db.close());

  Future<int> seedAccount() => db.into(db.accounts).insert(
        AccountsCompanion.insert(name: 'Касса', type: AccountType.cash),
      );

  Future<int> firstExpenseCategoryId() async {
    final List<CategoryRow> cats = await db.select(db.categories).get();
    return cats.firstWhere((CategoryRow c) => c.type == EntryType.expense).id;
  }

  test('создание + лента с присоединёнными данными', () async {
    final int accountId = await seedAccount();
    final int categoryId = await firstExpenseCategoryId();

    await repo.createTransaction(
      accountId: accountId,
      categoryId: categoryId,
      amountMinor: 350000,
      type: EntryType.expense,
      date: DateTime(2026, 6, 26),
      note: 'обед',
    );

    final List<TransactionListItem> items = await repo.watchTransactions().first;
    expect(items, hasLength(1));
    expect(items.single.accountName, 'Касса');
    expect(items.single.amountMinor, 350000);
    expect(items.single.isExpense, isTrue);
    expect(items.single.categoryNameRu, isNotNull);
  });

  test('удаление операции', () async {
    final int accountId = await seedAccount();
    final int id = await repo.createTransaction(
      accountId: accountId,
      amountMinor: 1000,
      type: EntryType.income,
      date: DateTime(2026, 6, 26),
    );

    expect(await repo.watchTransactions().first, hasLength(1));
    await repo.deleteTransaction(id);
    expect(await repo.watchTransactions().first, isEmpty);
  });
}
