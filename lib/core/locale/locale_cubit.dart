import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Хранит выбранный язык. `null` — следовать системному.
class LocaleCubit extends Cubit<Locale?> {
  LocaleCubit(this._prefs) : super(_read(_prefs));

  final SharedPreferences _prefs;
  static const String _key = 'locale_code';

  static Locale? _read(SharedPreferences prefs) {
    final String? code = prefs.getString(_key);
    return code == null ? null : Locale(code);
  }

  Future<void> setLocale(Locale? locale) async {
    if (locale == null) {
      await _prefs.remove(_key);
    } else {
      await _prefs.setString(_key, locale.languageCode);
    }
    emit(locale);
  }
}
