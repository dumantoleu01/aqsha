import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/di/injection.dart';
import 'core/locale/locale_cubit.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_cubit.dart';
import 'features/capture/data/notification_capture_service.dart';
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

  // Android: если доступ к уведомлениям уже выдан — запускаем автозахват.
  final NotificationCaptureService capture = getIt<NotificationCaptureService>();
  if (await capture.isEnabled()) {
    capture.start();
  }

  runApp(AqshaApp(
    localeCubit: LocaleCubit(prefs),
    themeCubit: ThemeCubit(prefs),
  ));
}

class AqshaApp extends StatelessWidget {
  const AqshaApp({
    super.key,
    required this.localeCubit,
    required this.themeCubit,
  });

  final LocaleCubit localeCubit;
  final ThemeCubit themeCubit;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        BlocProvider<LocaleCubit>.value(value: localeCubit),
        BlocProvider<ThemeCubit>.value(value: themeCubit),
      ],
      child: Builder(
        builder: (BuildContext context) {
          final Locale? locale = context.watch<LocaleCubit>().state;
          final ThemeMode mode = context.watch<ThemeCubit>().state;
          return MaterialApp.router(
            title: 'Aqsha',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: mode,
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
