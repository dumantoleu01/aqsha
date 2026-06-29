import 'package:aqsha/core/crypto/family_crypto.dart';
import 'package:aqsha/core/database/app_database.dart';
import 'package:aqsha/core/enums.dart';
import 'package:aqsha/features/backup/data/backup_service.dart';
import 'package:aqsha/features/sync/data/in_memory_sync_service.dart';
import 'package:drift/drift.dart' show Value;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final FamilyCrypto crypto = FamilyCrypto();

  group('FamilyCrypto', () {
    test('шифрование и расшифровка возвращают исходный текст', () async {
      final String enc = await crypto.encrypt('секретные данные', 'mypass');
      expect(enc.contains('секрет'), isFalse); // реально зашифровано
      final String dec = await crypto.decrypt(enc, 'mypass');
      expect(dec, 'секретные данные');
    });

    test('неверная парольная фраза не расшифрует', () async {
      final String enc = await crypto.encrypt('данные', 'right');
      expect(() => crypto.decrypt(enc, 'wrong'), throwsA(anything));
    });
  });

  test('E2E семейный снимок: зашифровать → push → pull → расшифровать → restore',
      () async {
    // Устройство A: данные → снимок → шифр → отправка
    final AppDatabase dbA = AppDatabase.forTesting(NativeDatabase.memory());
    final int accId = await dbA.into(dbA.accounts).insert(
          AccountsCompanion.insert(
            name: 'Семейный',
            type: AccountType.cash,
            initialBalanceMinor: const Value<int>(200000),
          ),
        );
    await dbA.into(dbA.transactions).insert(
          TransactionsCompanion.insert(
            accountId: accId,
            amountMinor: 7000,
            type: EntryType.expense,
            date: DateTime(2026, 6, 26),
          ),
        );
    final String snapshot = await BackupService(dbA).exportJson();
    final String encrypted = await crypto.encrypt(snapshot, 'family-pass');

    final InMemorySyncService sync = InMemorySyncService();
    await sync.pushSnapshot(familyId: 'fam1', encryptedBlob: encrypted);

    // Устройство B: получить → расшифровать → восстановить
    final String? pulled = await sync.pullSnapshot(familyId: 'fam1');
    expect(pulled, isNotNull);
    final String decrypted = await crypto.decrypt(pulled!, 'family-pass');

    final AppDatabase dbB = AppDatabase.forTesting(NativeDatabase.memory());
    await BackupService(dbB).restoreJson(decrypted);

    final List<AccountRow> accs = await dbB.select(dbB.accounts).get();
    final List<TransactionRow> txs = await dbB.select(dbB.transactions).get();
    expect(accs.any((AccountRow a) => a.name == 'Семейный'), isTrue);
    expect(txs.single.amountMinor, 7000);

    await dbA.close();
    await dbB.close();
  });
}
