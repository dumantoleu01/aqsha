import 'package:aqsha/core/database/app_database.dart';
import 'package:aqsha/core/enums.dart';
import 'package:aqsha/features/accounts/data/accounts_repository_impl.dart';
import 'package:aqsha/features/accounts/domain/account.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase db;
  late AccountsRepositoryImpl repo;

  setUp(() {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    repo = AccountsRepositoryImpl(db);
  });
  tearDown(() => db.close());

  test('баланс = стартовый остаток + доходы − расходы', () async {
    final int accountId = await repo.createAccount(
      name: 'Kaspi Gold',
      type: AccountType.card,
      currency: 'KZT',
      initialBalanceMinor: 100000, // 1 000 ₸
    );

    await db.into(db.transactions).insert(
          TransactionsCompanion.insert(
            accountId: accountId,
            amountMinor: 30000, // расход 300 ₸
            type: EntryType.expense,
            date: DateTime(2026, 6, 26),
          ),
        );
    await db.into(db.transactions).insert(
          TransactionsCompanion.insert(
            accountId: accountId,
            amountMinor: 50000, // доход 500 ₸
            type: EntryType.income,
            date: DateTime(2026, 6, 26),
          ),
        );

    final List<Account> accounts = await repo.watchAccounts().first;
    expect(accounts.single.balanceMinor, 120000); // 1000 − 300 + 500 = 1200 ₸
  });

  test('архивный счёт не попадает в список', () async {
    final int id = await repo.createAccount(
      name: 'Старый',
      type: AccountType.cash,
      currency: 'KZT',
      initialBalanceMinor: 0,
    );
    await repo.archiveAccount(id);

    final List<Account> accounts = await repo.watchAccounts().first;
    expect(accounts, isEmpty);
  });
}
