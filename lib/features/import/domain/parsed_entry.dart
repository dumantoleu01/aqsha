import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/enums.dart';
import '../../../core/money/money.dart';

part 'parsed_entry.freezed.dart';

/// Операция, распознанная из выписки (ещё не сохранённая).
@freezed
abstract class ParsedEntry with _$ParsedEntry {
  const ParsedEntry._();

  const factory ParsedEntry({
    required DateTime date,
    required int amountMinor,
    required EntryType type,
    required String description,
  }) = _ParsedEntry;

  Money get amount => Money(amountMinor);
  bool get isExpense => type == EntryType.expense;

  /// Стабильная сигнатура для защиты от повторного импорта
  /// (день + сумма + тип + нормализованное описание).
  String get importHash {
    final int day = date.millisecondsSinceEpoch ~/ Duration.millisecondsPerDay;
    return '$day|$amountMinor|${type.index}|${description.toLowerCase().trim()}';
  }
}
