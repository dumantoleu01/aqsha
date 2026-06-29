import 'package:injectable/injectable.dart';

import '../../../core/enums.dart';
import '../../import/domain/parsed_entry.dart';

/// Парсер пуш-уведомлений Kaspi/Halyk → черновик операции.
///
/// Захватывает только уведомления с явным признаком покупки/пополнения
/// и суммой, чтобы не плодить ложные черновики (баланс, акции и т.п.).
///
/// ⚠️ Реальный текст пушей может отличаться — ключевые слова/regex
/// настраиваются по живым уведомлениям (зависимость этапа 3).
@lazySingleton
class KaspiPushParser {
  static final RegExp _amount = RegExp(
    r'([\d\s]+(?:[.,]\d{1,2})?)\s*(?:₸|тг|тенге)',
    caseSensitive: false,
  );

  static const List<String> _incomeWords = <String>[
    'пополн',
    'поступл',
    'зачисл',
    'возврат',
  ];
  static const List<String> _expenseWords = <String>[
    'покупк',
    'оплат',
    'списан',
    'снятие',
    'перевод',
  ];

  ParsedEntry? parse({
    required String title,
    required String content,
    required DateTime timestamp,
  }) {
    final String text = '$title $content';
    final RegExpMatch? am = _amount.firstMatch(text);
    if (am == null) return null;

    final String numStr =
        am.group(1)!.replaceAll(RegExp(r'\s'), '').replaceAll(',', '.');
    final double? major = double.tryParse(numStr);
    if (major == null || major <= 0) return null;

    final String low = text.toLowerCase();
    final bool isIncome = _incomeWords.any(low.contains);
    final bool isExpense = _expenseWords.any(low.contains);
    if (!isIncome && !isExpense) return null; // не платёжный пуш — пропускаем

    final String desc =
        content.trim().isNotEmpty ? content.trim() : title.trim();
    return ParsedEntry(
      date: timestamp,
      amountMinor: (major * 100).round(),
      type: isIncome ? EntryType.income : EntryType.expense,
      description: desc.isEmpty ? 'Kaspi' : desc,
    );
  }
}
