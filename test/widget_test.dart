// Интеграционный smoke-тест: приложение запускается на in-memory БД,
// строится стартовый экран с нижней навигацией (локаль ru).
import 'package:aqsha/core/database/app_database.dart';
import 'package:aqsha/core/di/injection.dart';
import 'package:aqsha/core/locale/locale_cubit.dart';
import 'package:aqsha/core/router/app_router.dart';
import 'package:aqsha/core/theme/theme_cubit.dart';
import 'package:aqsha/features/accounts/data/accounts_repository_impl.dart';
import 'package:aqsha/features/accounts/domain/accounts_repository.dart';
import 'package:aqsha/features/accounts/presentation/cubit/accounts_cubit.dart';
import 'package:aqsha/features/budgets/data/budgets_repository_impl.dart';
import 'package:aqsha/features/budgets/domain/budgets_repository.dart';
import 'package:aqsha/features/budgets/presentation/cubit/budgets_cubit.dart';
import 'package:aqsha/features/categories/data/categories_repository_impl.dart';
import 'package:aqsha/features/categories/domain/categories_repository.dart';
import 'package:aqsha/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:aqsha/features/dashboard/data/analytics_repository_impl.dart';
import 'package:aqsha/features/dashboard/domain/analytics_repository.dart';
import 'package:aqsha/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:aqsha/features/transactions/data/transactions_repository_impl.dart';
import 'package:aqsha/features/transactions/domain/transactions_repository.dart';
import 'package:aqsha/features/transactions/presentation/cubit/transactions_cubit.dart';
import 'package:aqsha/main.dart';
import 'package:drift/native.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() async {
    SharedPreferences.setMockInitialValues(<String, Object>{'locale_code': 'ru'});
    await getIt.reset();
    getIt
      ..registerSingleton<AppDatabase>(
          AppDatabase.forTesting(NativeDatabase.memory()))
      ..registerLazySingleton<AccountsRepository>(
          () => AccountsRepositoryImpl(getIt()))
      ..registerLazySingleton<CategoriesRepository>(
          () => CategoriesRepositoryImpl(getIt()))
      ..registerLazySingleton<TransactionsRepository>(
          () => TransactionsRepositoryImpl(getIt()))
      ..registerLazySingleton<AnalyticsRepository>(
          () => AnalyticsRepositoryImpl(getIt()))
      ..registerLazySingleton<BudgetsRepository>(
          () => BudgetsRepositoryImpl(getIt()))
      ..registerFactory<AccountsCubit>(() => AccountsCubit(getIt()))
      ..registerFactory<CategoriesCubit>(() => CategoriesCubit(getIt()))
      ..registerFactory<TransactionsCubit>(() => TransactionsCubit(getIt()))
      ..registerFactory<BudgetsCubit>(() => BudgetsCubit(getIt()))
      ..registerFactory<DashboardCubit>(() => DashboardCubit(getIt(), getIt()));
    onboardingCompleted = true;
  });

  tearDown(() async {
    if (getIt.isRegistered<AppDatabase>()) {
      await getIt<AppDatabase>().close();
    }
    await getIt.reset();
  });

  testWidgets('Приложение запускается с нижней навигацией (ru)',
      (WidgetTester tester) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await tester.pumpWidget(AqshaApp(
      localeCubit: LocaleCubit(prefs),
      themeCubit: ThemeCubit(prefs),
    ));
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.text('Дашборд'), findsWidgets);
    expect(find.text('Операции'), findsOneWidget);
    expect(find.text('Настройки'), findsOneWidget);

    await tester.pumpWidget(const SizedBox());
    await tester.pump(const Duration(seconds: 1));
  });

  testWidgets('Онбординг показывается при первом запуске',
      (WidgetTester tester) async {
    onboardingCompleted = false;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await tester.pumpWidget(AqshaApp(
      localeCubit: LocaleCubit(prefs),
      themeCubit: ThemeCubit(prefs),
    ));
    await tester.pump(const Duration(milliseconds: 300));

    expect(find.text('Добро пожаловать в Aqsha'), findsOneWidget);

    await tester.pumpWidget(const SizedBox());
    await tester.pump(const Duration(seconds: 1));
  });
}
