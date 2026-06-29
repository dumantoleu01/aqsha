import 'package:aqsha/core/enums.dart';
import 'package:aqsha/features/capture/data/kaspi_push_parser.dart';
import 'package:aqsha/features/import/domain/parsed_entry.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final KaspiPushParser parser = KaspiPushParser();
  final DateTime ts = DateTime(2026, 6, 29, 12);

  test('покупка → расход с суммой и мерчантом', () {
    final ParsedEntry? e = parser.parse(
      title: 'Kaspi Gold',
      content: 'Покупка 3 500 ₸ в Magnum',
      timestamp: ts,
    );
    expect(e, isNotNull);
    expect(e!.type, EntryType.expense);
    expect(e.amountMinor, 350000);
    expect(e.description.toLowerCase(), contains('magnum'));
  });

  test('пополнение → доход', () {
    final ParsedEntry? e = parser.parse(
      title: 'Kaspi',
      content: 'Пополнение 150 000 ₸',
      timestamp: ts,
    );
    expect(e, isNotNull);
    expect(e!.type, EntryType.income);
    expect(e.amountMinor, 15000000);
  });

  test('не платёжный пуш (баланс) игнорируется', () {
    expect(
      parser.parse(title: 'Kaspi', content: 'Ваш баланс 1 000 ₸', timestamp: ts),
      isNull,
    );
  });

  test('пуш без суммы игнорируется', () {
    expect(
      parser.parse(title: 'Kaspi', content: 'Скидки в Magnum!', timestamp: ts),
      isNull,
    );
  });
}
