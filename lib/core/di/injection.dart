import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

final GetIt getIt = GetIt.instance;

/// Регистрирует все зависимости, помеченные аннотациями injectable.
/// Реализация генерируется в injection.config.dart (build_runner).
@InjectableInit()
Future<void> configureDependencies() async => getIt.init();
