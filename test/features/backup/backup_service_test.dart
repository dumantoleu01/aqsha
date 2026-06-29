import 'package:aqsha/core/database/app_database.dart';
import 'package:aqsha/core/enums.dart';
import 'package:aqsha/features/backup/data/backup_service.dart';
import 'package:drift/drift.dart' show Value;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('экспорт и восстановление переносят данные на другое устройство',
      () async {
    final AppDatabase src = AppDatabase.forTesting(NativeDatabase.memory());
    final int accId = await src.into(src.accounts).insert(
          AccountsCompanion.insert(
            name: 'Касса',
            type: AccountType.cash,
            initialBalanceMinor: const Value<int>(100000),
          ),
        );
    await src.into(src.transactions).insert(
          TransactionsCompanion.insert(
            accountId: accId,
            amountMinor: 5000,
            type: EntryType.expense,
            date: DateTime(2026, 6, 26),
          ),
        );
    final String json = await BackupService(src).exportJson();
    await src.close();

    final AppDatabase dst = AppDatabase.forTesting(NativeDatabase.memory());
    final BackupSummary summary = await BackupService(dst).restoreJson(json);

    final List<AccountRow> accs = await dst.select(dst.accounts).get();
    final List<TransactionRow> txs = await dst.select(dst.transactions).get();
    expect(
      accs.any((AccountRow a) =>
          a.name == 'Касса' && a.initialBalanceMinor == 100000),
      isTrue,
    );
    expect(txs, hasLength(1));
    expect(txs.single.amountMinor, 5000);
    expect(summary.transactions, 1);
    await dst.close();
  });
}
