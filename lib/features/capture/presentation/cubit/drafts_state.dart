import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../transactions/domain/transaction_list_item.dart';

part 'drafts_state.freezed.dart';

@freezed
sealed class DraftsState with _$DraftsState {
  const factory DraftsState.loading() = DraftsLoading;
  const factory DraftsState.loaded(List<TransactionListItem> drafts) =
      DraftsLoaded;
}
