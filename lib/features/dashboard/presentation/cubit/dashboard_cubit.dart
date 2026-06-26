import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../accounts/domain/account.dart';
import '../../../accounts/domain/accounts_repository.dart';
import '../../domain/analytics_repository.dart';
import '../../domain/period_summary.dart';
import '../dashboard_period.dart';
import 'dashboard_state.dart';

@injectable
class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit(this._analytics, this._accounts)
      : super(const DashboardState.loading()) {
    _accountsSub = _accounts.watchAccounts().listen((List<Account> accounts) {
      _totalBalanceMinor = accounts.fold<int>(
        0,
        (int sum, Account a) => sum + a.balanceMinor,
      );
      _maybeEmit();
    });
    setPeriod(DashboardPeriod.month);
  }

  final AnalyticsRepository _analytics;
  final AccountsRepository _accounts;

  late final StreamSubscription<List<Account>> _accountsSub;
  StreamSubscription<PeriodSummary>? _periodSub;

  DashboardPeriod _period = DashboardPeriod.month;
  int _totalBalanceMinor = 0;
  PeriodSummary? _summary;

  void setPeriod(DashboardPeriod period) {
    _period = period;
    _periodSub?.cancel();
    final ({DateTime from, DateTime to}) r = period.range();
    _periodSub = _analytics.watchPeriod(r.from, r.to).listen((PeriodSummary s) {
      _summary = s;
      _maybeEmit();
    });
  }

  void _maybeEmit() {
    final PeriodSummary? summary = _summary;
    if (summary == null) return;
    emit(DashboardState.loaded(
      period: _period,
      totalBalanceMinor: _totalBalanceMinor,
      summary: summary,
    ));
  }

  @override
  Future<void> close() {
    _accountsSub.cancel();
    _periodSub?.cancel();
    return super.close();
  }
}
