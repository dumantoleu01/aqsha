import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/enums.dart';

part 'transaction.freezed.dart';

@freezed
abstract class Transaction with _$Transaction {
  const factory Transaction({
    required int id,
    required int accountId,
    int? categoryId,
    required int amountMinor,
    required EntryType type,
    required DateTime date,
    String? note,
    String? merchant,
    @Default(TransactionSource.manual) TransactionSource source,
    @Default(TransactionStatus.confirmed) TransactionStatus status,
  }) = _Transaction;
}
