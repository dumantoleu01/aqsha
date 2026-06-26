import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/money/money.dart';

part 'category_spending.freezed.dart';

@freezed
abstract class CategorySpending with _$CategorySpending {
  const CategorySpending._();

  const factory CategorySpending({
    int? categoryId,
    String? nameKk,
    String? nameRu,
    int? iconCodePoint,
    int? colorValue,
    required int totalMinor,
  }) = _CategorySpending;

  Money get total => Money(totalMinor);

  String name(String languageCode) =>
      (languageCode == 'kk' ? nameKk : nameRu) ?? 'Без категории';
}
