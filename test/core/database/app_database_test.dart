import 'package:aqsha/core/database/app_database.dart';
import 'package:aqsha/core/enums.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase db;

  setUp(() => db = AppDatabase.forTesting(NativeDatabase.memory()));
  tearDown(() => db.close());

  test('создаётся с дефолтными категориями (kk + ru)', () async {
    final List<CategoryRow> cats = await db.select(db.categories).get();
    expect(cats.length, greaterThan(10));
    expect(cats.any((CategoryRow c) => c.type == EntryType.income), isTrue);
    expect(cats.any((CategoryRow c) => c.type == EntryType.expense), isTrue);
    expect(cats.first.nameKk, isNotEmpty);
    expect(cats.first.nameRu, isNotEmpty);
  });

  test('CRUD: счёт + операция с дефолтами', () async {
    final int accountId = await db.into(db.accounts).insert(
          AccountsCompanion.insert(name: 'Наличные', type: AccountType.cash),
        );
    await db.into(db.transactions).insert(
          TransactionsCompanion.insert(
            accountId: accountId,
            amountMinor: 350000, // 3 500 ₸
            type: EntryType.expense,
            date: DateTime(2026, 6, 26),
          ),
        );

    final List<TransactionRow> txs = await db.select(db.transactions).get();
    expect(txs.single.amountMinor, 350000);
    expect(txs.single.source, TransactionSource.manual);
    expect(txs.single.status, TransactionStatus.confirmed);
  });

  test('foreign key: операция с несуществующим счётом отклоняется', () async {
    expect(
      () => db.into(db.transactions).insert(
            TransactionsCompanion.insert(
              accountId: 999,
              amountMinor: 1000,
              type: EntryType.expense,
              date: DateTime(2026, 6, 26),
            ),
          ),
      throwsA(isA<Exception>()),
    );
  });
}
