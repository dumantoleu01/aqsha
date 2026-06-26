import 'period_summary.dart';

abstract interface class AnalyticsRepository {
  /// Сводка за период [from, to) (доходы, расходы, разбивка расходов).
  Stream<PeriodSummary> watchPeriod(DateTime from, DateTime to);
}
