import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/budget_progress.dart';
import '../../domain/budgets_repository.dart';
import 'budgets_state.dart';

@injectable
class BudgetsCubit extends Cubit<BudgetsState> {
  BudgetsCubit(this._repo) : super(const BudgetsState.loading()) {
    _sub = _repo.watchBudgets().listen(
          (List<BudgetProgress> budgets) =>
              emit(BudgetsState.loaded(budgets)),
        );
  }

  final BudgetsRepository _repo;
  late final StreamSubscription<List<BudgetProgress>> _sub;

  Future<void> delete(int id) => _repo.deleteBudget(id);

  @override
  Future<void> close() {
    _sub.cancel();
    return super.close();
  }
}
