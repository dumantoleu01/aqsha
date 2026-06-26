import 'package:flutter/material.dart';

/// Палитра иконок и цветов для категорий + хелперы восстановления из БД.
///
/// ⚠️ Иконки восстанавливаются динамически по codePoint, поэтому для
/// релизной сборки нужен флаг `flutter build --no-tree-shake-icons`.
abstract final class CategoryVisuals {
  static const List<IconData> icons = <IconData>[
    Icons.shopping_cart,
    Icons.restaurant,
    Icons.directions_bus,
    Icons.directions_car,
    Icons.home,
    Icons.local_hospital,
    Icons.checkroom,
    Icons.movie,
    Icons.wifi,
    Icons.school,
    Icons.child_care,
    Icons.card_giftcard,
    Icons.payments,
    Icons.work,
    Icons.redeem,
    Icons.fitness_center,
    Icons.pets,
    Icons.flight,
    Icons.local_cafe,
    Icons.local_grocery_store,
    Icons.phone_android,
    Icons.sports_esports,
    Icons.savings,
    Icons.category,
  ];

  static const List<int> colors = <int>[
    0xFF4CAF50,
    0xFF3F51B5,
    0xFFFF9800,
    0xFF795548,
    0xFFE91E63,
    0xFF9C27B0,
    0xFFF44336,
    0xFF00BCD4,
    0xFF009688,
    0xFFFFC107,
    0xFFCDDC39,
    0xFF607D8B,
    0xFF2E7D32,
    0xFF1565C0,
  ];

  static IconData iconFromCodePoint(int? codePoint) {
    if (codePoint == null) return Icons.category;
    return IconData(codePoint, fontFamily: 'MaterialIcons');
  }

  static Color colorFrom(int? value, {required Color fallback}) {
    return value == null ? fallback : Color(value);
  }
}
