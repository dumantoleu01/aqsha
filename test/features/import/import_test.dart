import 'package:aqsha/core/database/app_database.dart';
import 'package:aqsha/core/enums.dart';
import 'package:aqsha/features/import/data/kaspi_statement_parser.dart';
import 'package:aqsha/features/import/domain/parsed_entry.dart';
import 'package:aqsha/features/transactions/data/transactions_repository_impl.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('KaspiStatementParser', () {
    final KaspiStatementParser parser = KaspiStatementParser();

    test('распознаёт расходы и доходы', () {
      const String text = '''
Выписка по карте Kaspi Gold
26.06.26  -3 500,00 ₸  Покупка  Magnum
25.06.26  + 150 000,00 ₸  Пополнение  Зарплата
24.06.26  -1 200 ₸  Покупка  Wolt
Итого по выписке
''';
      final List<ParsedEntry> entries = parser.parse(text);
      expect(entries, hasLength(3));
      expect(entries[0].type, EntryType.expense);
      expect(entries[0].amountMinor, 350000);
      expect(entries[0].description.toLowerCase(), contains('magnum'));
      expect(entries[1].type, EntryType.income);
      expect(entries[1].amountMinor, 15000000);
      expect(entries[2].amountMinor, 120000);
    });

    test('строки без даты и суммы игнорируются', () {
      final List<ParsedEntry> entries =
          parser.parse('Просто текст\nОстаток: 1000 ₸');
      expect(entries, isEmpty);
    });

    test('importHash стабилен и различает операции', () {
      final ParsedEntry a = ParsedEntry(
          date: DateTime(2026, 6, 26),
          amountMinor: 350000,
          type: EntryType.expense,
          description: 'Magnum');
      final ParsedEntry b = ParsedEntry(
          date: DateTime(2026, 6, 26),
          amountMinor: 350000,
          type: EntryType.expense,
          description: 'Magnum');
      final ParsedEntry c = ParsedEntry(
          date: DateTime(2026, 6, 26),
          amountMinor: 350001,
          type: EntryType.expense,
          description: 'Magnum');
      expect(a.importHash, b.importHash);
      expect(a.importHash, isNot(c.importHash));
    });
  });

  test('findExistingHashes находит уже импортированные', () async {
    final AppDatabase db = AppDatabase.forTesting(NativeDatabase.memory());
    final TransactionsRepositoryImpl repo = TransactionsRepositoryImpl(db);
    final int accId = await db.into(db.accounts).insert(
          AccountsCompanion.insert(name: 'X', type: AccountType.cash),
        );
    await repo.createTransaction(
      accountId: accId,
      amountMinor: 1000,
      type: EntryType.expense,
      date: DateTime(2026, 6, 26),
      importHash: 'h1',
    );

    final Set<String> res =
        await repo.findExistingHashes(<String>['h1', 'h2']);
    expect(res, <String>{'h1'});
    await db.close();
  });
}
