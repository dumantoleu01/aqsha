import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/enums.dart';
import '../../../core/money/money.dart';

part 'budget_progress.freezed.dart';

/// Бюджет вместе с потраченной суммой за его текущий период.
@freezed
abstract class BudgetProgress with _$BudgetProgress {
  const BudgetProgress._();

  const factory BudgetProgress({
    required int id,
    required int categoryId,
    required BudgetPeriod period,
    required int limitMinor,
    required int spentMinor,
    String? categoryNameKk,
    String? categoryNameRu,
    int? iconCodePoint,
    int? colorValue,
  }) = _BudgetProgress;

  Money get limit => Money(limitMinor);
  Money get spent => Money(spentMinor);
  Money get remaining => Money(limitMinor - spentMinor);

  double get ratio => limitMinor == 0 ? 0 : spentMinor / limitMinor;
  bool get isOver => spentMinor > limitMinor;

  String categoryName(String languageCode) =>
      (languageCode == 'kk' ? categoryNameKk : categoryNameRu) ?? '—';
}
