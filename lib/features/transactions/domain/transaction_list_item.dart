import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/enums.dart';
import '../../../core/money/money.dart';

part 'transaction_list_item.freezed.dart';

/// Read-модель для ленты операций (с присоединёнными данными счёта/категории).
@freezed
abstract class TransactionListItem with _$TransactionListItem {
  const TransactionListItem._();

  const factory TransactionListItem({
    required int id,
    required int amountMinor,
    required EntryType type,
    required DateTime date,
    required String accountName,
    @Default('KZT') String currency,
    String? note,
    String? merchant,
    String? categoryNameKk,
    String? categoryNameRu,
    int? categoryIconCodePoint,
    int? categoryColorValue,
  }) = _TransactionListItem;

  Money get amount => Money(amountMinor, currency: currency);

  bool get isExpense => type == EntryType.expense;

  String? categoryName(String languageCode) =>
      languageCode == 'kk' ? categoryNameKk : categoryNameRu;

  /// Что показать заголовком строки: категория → мерчант → заметка → «—».
  String title(String languageCode) =>
      categoryName(languageCode) ?? merchant ?? note ?? '—';
}
