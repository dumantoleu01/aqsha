import 'package:injectable/injectable.dart';

import '../../../core/enums.dart';
import '../domain/parsed_entry.dart';
import '../domain/statement_parser.dart';

/// Парсер текста выписки Kaspi (Kaspi Gold).
///
/// Реальный формат — построчный блок из 4 строк на операцию:
/// ```
/// 29.06.26            ← дата (отдельная строка, ровно дата)
/// - 4 000,00 ₸        ← знак + сумма + ₸
/// Аударым             ← тип операции (kk)
///     Омиргуль М.     ← детали (мерчант/получатель)
/// ```
/// Строки баланса вида `29.05.26ж. қолжетімді:` НЕ являются операциями —
/// поэтому дата матчится строго целиком (`^дата$`), а сумма берётся
/// со следующей строки.
@LazySingleton(as: StatementParser)
class KaspiStatementParser implements StatementParser {
  /// Строка, целиком являющаяся датой dd.mm.yy(yy).
  static final RegExp _dateLine = RegExp(r'^(\d{2})\.(\d{2})\.(\d{2,4})$');

  /// Знак (+ / - / −), число с разделителями тысяч и опц. копейками, ₸/тг.
  static final RegExp _amount =
      RegExp(r'([+\-−])\s*([\d\s]+(?:[.,]\d{1,2})?)\s*(?:₸|тг|тенге)',
          caseSensitive: false);

  @override
  List<ParsedEntry> parse(String text) {
    final List<String> lines = text
        .split('\n')
        .map((String l) => l.trim())
        .where((String l) => l.isNotEmpty)
        .toList();

    final List<ParsedEntry> result = <ParsedEntry>[];
    for (int i = 0; i < lines.length; i++) {
      final RegExpMatch? dm = _dateLine.firstMatch(lines[i]);
      if (dm == null) continue;
      final DateTime? date = _parseDate(dm);
      if (date == null || i + 1 >= lines.length) continue;

      final RegExpMatch? am = _amount.firstMatch(lines[i + 1]);
      if (am == null) continue;
      final int? amountMinor = _amountToMinor(am);
      if (amountMinor == null) continue;

      final EntryType type =
          am.group(1) == '+' ? EntryType.income : EntryType.expense;

      final String op = _cleanField(lines, i + 2);
      final String detail = _cleanField(lines, i + 3);
      final String desc = detail.isNotEmpty
          ? detail
          : (op.isNotEmpty ? op : 'Kaspi');

      result.add(ParsedEntry(
        date: date,
        amountMinor: amountMinor,
        type: type,
        description: desc,
      ));
    }
    return result;
  }

  /// Возвращает строку [index], если она существует и не является
  /// датой/суммой (т.е. это текст операции или детали).
  String _cleanField(List<String> lines, int index) {
    if (index >= lines.length) return '';
    final String s = lines[index];
    if (_dateLine.hasMatch(s) || _amount.hasMatch(s)) return '';
    return s;
  }

  int? _amountToMinor(RegExpMatch am) {
    final String numStr =
        am.group(2)!.replaceAll(RegExp(r'\s'), '').replaceAll(',', '.');
    final double? major = double.tryParse(numStr);
    if (major == null) return null;
    final int minor = (major * 100).round();
    return minor == 0 ? null : minor;
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
