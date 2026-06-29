import 'package:injectable/injectable.dart';

import '../../../core/enums.dart';
import '../domain/parsed_entry.dart';
import '../domain/statement_parser.dart';

/// Парсер текста выписки Kaspi.
///
/// Работает построчно: ищет строки, где есть дата и сумма со знаком и ₸,
/// например: `26.06.26  -3 500,00 ₸  Покупка  Magnum`.
///
/// ⚠️ Формат выписки Kaspi может отличаться — регулярки настраиваются
/// по реальному файлу (зависимость этапа 2).
@LazySingleton(as: StatementParser)
class KaspiStatementParser implements StatementParser {
  static final RegExp _date = RegExp(r'(\d{2})\.(\d{2})\.(\d{2,4})');

  /// Знак (+ / - / −), число с разделителями тысяч и опц. копейками, ₸.
  /// `\s` в Dart покрывает и неразрывные пробелы (U+00A0), которые ставит Kaspi.
  static final RegExp _amount =
      RegExp(r'([+\-−])\s?([\d\s]+(?:[.,]\d{1,2})?)\s*₸');

  @override
  List<ParsedEntry> parse(String text) {
    final List<ParsedEntry> result = <ParsedEntry>[];
    for (final String raw in text.split(RegExp(r'[\r\n]+'))) {
      final String line = raw.trim();
      if (line.isEmpty) continue;

      final RegExpMatch? dm = _date.firstMatch(line);
      final RegExpMatch? am = _amount.firstMatch(line);
      if (dm == null || am == null) continue;

      final DateTime? date = _parseDate(dm);
      if (date == null) continue;

      final String numStr =
          am.group(2)!.replaceAll(RegExp(r'\s'), '').replaceAll(',', '.');
      final double? major = double.tryParse(numStr);
      if (major == null) continue;
      final int amountMinor = (major * 100).round();
      if (amountMinor == 0) continue;

      final EntryType type =
          am.group(1) == '+' ? EntryType.income : EntryType.expense;

      String desc = line
          .replaceFirst(_date, ' ')
          .replaceFirst(_amount, ' ')
          .replaceAll(RegExp(r'\s+'), ' ')
          .trim();
      if (desc.isEmpty) {
        desc = type == EntryType.income ? 'Пополнение' : 'Покупка';
      }

      result.add(ParsedEntry(
        date: date,
        amountMinor: amountMinor,
        type: type,
        description: desc,
      ));
    }
    return result;
  }

  DateTime? _parseDate(RegExpMatch m) {
    final int d = int.parse(m.group(1)!);
    final int mo = int.parse(m.group(2)!);
    int y = int.parse(m.group(3)!);
    if (y < 100) y += 2000;
    if (mo < 1 || mo > 12 || d < 1 || d > 31) return null;
    return DateTime(y, mo, d);
  }
}
