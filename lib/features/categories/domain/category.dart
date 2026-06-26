import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/enums.dart';

part 'category.freezed.dart';

@freezed
abstract class Category with _$Category {
  const Category._();

  const factory Category({
    required int id,
    required String nameKk,
    required String nameRu,
    required EntryType type,
    int? iconCodePoint,
    int? colorValue,
    @Default(false) bool isArchived,
    @Default(0) int sortOrder,
  }) = _Category;

  /// Имя на языке интерфейса (`kk` → казахский, иначе русский).
  String localizedName(String languageCode) =>
      languageCode == 'kk' ? nameKk : nameRu;
}
