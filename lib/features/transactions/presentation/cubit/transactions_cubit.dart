import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/transaction_list_item.dart';
import '../../domain/transactions_repository.dart';
import 'transactions_state.dart';

@injectable
class TransactionsCubit extends Cubit<TransactionsState> {
  TransactionsCubit(this._repo) : super(const TransactionsState.loading()) {
    _sub = _repo.watchTransactions().listen(
          (List<TransactionListItem> items) =>
              emit(TransactionsState.loaded(items)),
        );
  }

  final TransactionsRepository _repo;
  late final StreamSubscription<List<TransactionListItem>> _sub;

  Future<void> delete(int id) => _repo.deleteTransaction(id);

  @override
  Future<void> close() {
    _sub.cancel();
    return super.close();
  }
}
