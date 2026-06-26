import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/budget_progress.dart';

part 'budgets_state.freezed.dart';

@freezed
sealed class BudgetsState with _$BudgetsState {
  const factory BudgetsState.loading() = BudgetsLoading;
  const factory BudgetsState.loaded(List<BudgetProgress> budgets) =
      BudgetsLoaded;
}
