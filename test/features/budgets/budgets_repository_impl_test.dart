import 'package:aqsha/core/database/app_database.dart';
import 'package:aqsha/core/enums.dart';
import 'package:aqsha/features/budgets/data/budgets_repository_impl.dart';
import 'package:aqsha/features/budgets/domain/budget_progress.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase db;
  late BudgetsRepositoryImpl repo;

  setUp(() {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    repo = BudgetsRepositoryImpl(db);
  });
  tearDown(() => db.close());

  test('spent учитывает только нужную категорию и текущий период', () async {
    final List<CategoryRow> expenses = (await db.select(db.categories).get())
        .where((CategoryRow c) => c.type == EntryType.expense)
        .toList();
    final int catA = expenses[0].id;
    final int catB = expenses[1].id;

    final int accountId = await db.into(db.accounts).insert(
          AccountsCompanion.insert(name: 'Касса', type: AccountType.cash),
        );

    Future<void> addExpense(int categoryId, int amount, DateTime date) =>
        db.into(db.transactions).insert(
              TransactionsCompanion.insert(
                accountId: accountId,
                categoryId: Value<int?>(categoryId),
                amountMinor: amount,
                type: EntryType.expense,
                date: date,
              ),
            );

    final DateTime now = DateTime.now();
    final DateTime lastMonth = DateTime(now.year, now.month - 1, 15);

    await repo.createBudget(
      categoryId: catA,
      period: BudgetPeriod.month,
      limitMinor: 100000, // лимит 1000 ₸
    );
    await addExpense(catA, 30000, now); // в периоде, та категория → считается
    await addExpense(catB, 50000, now); // другая категория → нет
    await addExpense(catA, 99999, lastMonth); // прошлый месяц → нет

    final List<BudgetProgress> budgets = await repo.watchBudgets().first;
    expect(budgets, hasLength(1));
    expect(budgets.single.spentMinor, 30000);
    expect(budgets.single.isOver, isFalse);
    expect(budgets.single.ratio, closeTo(0.3, 0.001));
  });

  test('isOver когда расходы превышают лимит', () async {
    final int catId = (await db.select(db.categories).get())
        .firstWhere((CategoryRow c) => c.type == EntryType.expense)
        .id;
    final int accountId = await db.into(db.accounts).insert(
          AccountsCompanion.insert(name: 'Касса', type: AccountType.cash),
        );
    await repo.createBudget(
      categoryId: catId,
      period: BudgetPeriod.month,
      limitMinor: 10000,
    );
    await db.into(db.transactions).insert(
          TransactionsCompanion.insert(
            accountId: accountId,
            categoryId: Value<int?>(catId),
            amountMinor: 15000,
            type: EntryType.expense,
            date: DateTime.now(),
          ),
        );

    final List<BudgetProgress> budgets = await repo.watchBudgets().first;
    expect(budgets.single.isOver, isTrue);
  });
}
