import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/money/money.dart';
import 'category_spending.dart';

part 'period_summary.freezed.dart';

@freezed
abstract class PeriodSummary with _$PeriodSummary {
  const PeriodSummary._();

  const factory PeriodSummary({
    @Default(0) int incomeMinor,
    @Default(0) int expenseMinor,
    @Default(<CategorySpending>[]) List<CategorySpending> expenseByCategory,
  }) = _PeriodSummary;

  Money get income => Money(incomeMinor);
  Money get expense => Money(expenseMinor);
}
