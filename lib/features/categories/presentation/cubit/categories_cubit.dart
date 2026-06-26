import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/categories_repository.dart';
import '../../domain/category.dart';
import 'categories_state.dart';

@injectable
class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this._repo) : super(const CategoriesState.loading()) {
    _sub = _repo.watchCategories().listen(
          (List<Category> categories) =>
              emit(CategoriesState.loaded(categories)),
        );
  }

  final CategoriesRepository _repo;
  late final StreamSubscription<List<Category>> _sub;

  Future<void> archive(int id) => _repo.archiveCategory(id);

  @override
  Future<void> close() {
    _sub.cancel();
    return super.close();
  }
}
