import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/account.dart';

part 'accounts_state.freezed.dart';

@freezed
sealed class AccountsState with _$AccountsState {
  const factory AccountsState.loading() = AccountsLoading;
  const factory AccountsState.loaded(List<Account> accounts) = AccountsLoaded;
}
