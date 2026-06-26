import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/category.dart';

part 'categories_state.freezed.dart';

@freezed
sealed class CategoriesState with _$CategoriesState {
  const factory CategoriesState.loading() = CategoriesLoading;
  const factory CategoriesState.loaded(List<Category> categories) =
      CategoriesLoaded;
}
