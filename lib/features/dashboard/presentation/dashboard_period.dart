enum DashboardPeriod { day, week, month }

extension DashboardPeriodX on DashboardPeriod {
  String get label => switch (this) {
        DashboardPeriod.day => 'День',
        DashboardPeriod.week => 'Неделя',
        DashboardPeriod.month => 'Месяц',
      };

  /// Полуинтервал [from, to) для текущего периода.
  ({DateTime from, DateTime to}) range([DateTime? now]) {
    final DateTime n = now ?? DateTime.now();
    final DateTime today = DateTime(n.year, n.month, n.day);
    return switch (this) {
      DashboardPeriod.day => (
          from: today,
          to: today.add(const Duration(days: 1)),
        ),
      DashboardPeriod.week => () {
          final DateTime start =
              today.subtract(Duration(days: today.weekday - 1));
          return (from: start, to: start.add(const Duration(days: 7)));
        }(),
      DashboardPeriod.month => (
          from: DateTime(n.year, n.month),
          to: DateTime(n.year, n.month + 1),
        ),
    };
  }
}
