import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../transactions/domain/transaction_list_item.dart';
import '../../../transactions/domain/transactions_repository.dart';
import 'drafts_state.dart';

@injectable
class DraftsCubit extends Cubit<DraftsState> {
  DraftsCubit(this._repo) : super(const DraftsState.loading()) {
    _sub = _repo.watchDrafts().listen(
          (List<TransactionListItem> drafts) =>
              emit(DraftsState.loaded(drafts)),
        );
  }

  final TransactionsRepository _repo;
  late final StreamSubscription<List<TransactionListItem>> _sub;

  Future<void> confirm(int id, {int? categoryId}) =>
      _repo.confirmDraft(id, categoryId: categoryId);

  Future<void> discard(int id) => _repo.deleteTransaction(id);

  @override
  Future<void> close() {
    _sub.cancel();
    return super.close();
  }
}
