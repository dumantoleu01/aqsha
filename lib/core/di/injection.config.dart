// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aqsha/core/database/app_database.dart' as _i633;
import 'package:aqsha/features/accounts/data/accounts_repository_impl.dart'
    as _i361;
import 'package:aqsha/features/accounts/domain/accounts_repository.dart'
    as _i1043;
import 'package:aqsha/features/accounts/presentation/cubit/accounts_cubit.dart'
    as _i980;
import 'package:aqsha/features/categories/data/categories_repository_impl.dart'
    as _i1029;
import 'package:aqsha/features/categories/domain/categories_repository.dart'
    as _i1041;
import 'package:aqsha/features/categories/presentation/cubit/categories_cubit.dart'
    as _i226;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i633.AppDatabase>(() => _i633.AppDatabase());
    gh.lazySingleton<_i1041.CategoriesRepository>(
      () => _i1029.CategoriesRepositoryImpl(gh<_i633.AppDatabase>()),
    );
    gh.factory<_i226.CategoriesCubit>(
      () => _i226.CategoriesCubit(gh<_i1041.CategoriesRepository>()),
    );
    gh.lazySingleton<_i1043.AccountsRepository>(
      () => _i361.AccountsRepositoryImpl(gh<_i633.AppDatabase>()),
    );
    gh.factory<_i980.AccountsCubit>(
      () => _i980.AccountsCubit(gh<_i1043.AccountsRepository>()),
    );
    return this;
  }
}
