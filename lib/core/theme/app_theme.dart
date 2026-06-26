import 'package:flutter/material.dart';

/// Темы приложения. Material 3 включён по умолчанию во Flutter 3.x.
abstract final class AppTheme {
  /// Зелёный seed — ассоциация с деньгами.
  static const Color _seed = Color(0xFF1B8E5A);

  static ThemeData get light => _build(Brightness.light);
  static ThemeData get dark => _build(Brightness.dark);

  static ThemeData _build(Brightness brightness) {
    final ColorScheme scheme = ColorScheme.fromSeed(
      seedColor: _seed,
      brightness: brightness,
    );
    return ThemeData(
      colorScheme: scheme,
      scaffoldBackgroundColor: scheme.surface,
    );
  }
}
