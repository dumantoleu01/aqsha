import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/di/injection.dart';
import 'core/locale/locale_cubit.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/onboarding/presentation/onboarding_screen.dart';
import 'l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  if (!getIt.isRegistered<SharedPreferences>()) {
    getIt.registerSingleton<SharedPreferences>(prefs);
  }
  onboardingCompleted = prefs.getBool(onboardedPrefKey) ?? false;
  runApp(AqshaApp(localeCubit: LocaleCubit(prefs)));
}

class AqshaApp extends StatelessWidget {
  const AqshaApp({super.key, required this.localeCubit});

  final LocaleCubit localeCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocaleCubit>.value(
      value: localeCubit,
      child: BlocBuilder<LocaleCubit, Locale?>(
        builder: (BuildContext context, Locale? locale) {
          return MaterialApp.router(
            title: 'Aqsha',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: ThemeMode.system,
            locale: locale,
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            routerConfig: appRouter,
          );
        },
      ),
    );
  }
}
