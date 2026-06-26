import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/transaction_list_item.dart';

part 'transactions_state.freezed.dart';

@freezed
sealed class TransactionsState with _$TransactionsState {
  const factory TransactionsState.loading() = TransactionsLoading;
  const factory TransactionsState.loaded(List<TransactionListItem> items) =
      TransactionsLoaded;
}
