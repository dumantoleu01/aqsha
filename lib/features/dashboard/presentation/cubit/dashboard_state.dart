import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/money/money.dart';
import '../../domain/period_summary.dart';
import '../dashboard_period.dart';

part 'dashboard_state.freezed.dart';

@freezed
sealed class DashboardState with _$DashboardState {
  const DashboardState._();

  const factory DashboardState.loading() = DashboardLoading;
  const factory DashboardState.loaded({
    required DashboardPeriod period,
    required int totalBalanceMinor,
    required PeriodSummary summary,
  }) = DashboardLoaded;

  Money? get totalBalance => switch (this) {
        DashboardLoaded(:final int totalBalanceMinor) => Money(totalBalanceMinor),
        _ => null,
      };
}
