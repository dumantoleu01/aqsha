import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/account.dart';
import '../../domain/accounts_repository.dart';
import 'accounts_state.dart';

@injectable
class AccountsCubit extends Cubit<AccountsState> {
  AccountsCubit(this._repo) : super(const AccountsState.loading()) {
    _sub = _repo.watchAccounts().listen(
          (List<Account> accounts) => emit(AccountsState.loaded(accounts)),
        );
  }

  final AccountsRepository _repo;
  late final StreamSubscription<List<Account>> _sub;

  Future<void> archive(int id) => _repo.archiveAccount(id);

  @override
  Future<void> close() {
    _sub.cancel();
    return super.close();
  }
}
