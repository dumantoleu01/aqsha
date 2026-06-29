import '../../categories/domain/category.dart';

/// Подбор категории по ключевым словам в описании операции.
/// Сопоставляет ключ → название категории (рус), затем ищет её в списке.
const Map<String, String> _keywordToCategoryRu = <String, String>{
  'magnum': 'Продукты',
  'small': 'Продукты',
  'galmart': 'Продукты',
  'arbuz': 'Продукты',
  'clever': 'Продукты',
  'wolt': 'Кафе и рестораны',
  'glovo': 'Кафе и рестораны',
  'kfc': 'Кафе и рестораны',
  'burger': 'Кафе и рестораны',
  'coffee': 'Кафе и рестораны',
  'yandex': 'Транспорт',
  'indrive': 'Транспорт',
  'такси': 'Транспорт',
  'taxi': 'Транспорт',
  'bus': 'Транспорт',
  'apteka': 'Здоровье',
  'аптека': 'Здоровье',
  'pharm': 'Здоровье',
  'wildberries': 'Одежда',
  'lc waikiki': 'Одежда',
  'zara': 'Одежда',
  'beeline': 'Связь',
  'tele2': 'Связь',
  'activ': 'Связь',
  'izi': 'Связь',
  'kcell': 'Связь',
  'зарплата': 'Зарплата',
  'salary': 'Зарплата',
};

int? suggestCategoryId(String description, List<Category> categories) {
  final String d = description.toLowerCase();
  for (final MapEntry<String, String> rule in _keywordToCategoryRu.entries) {
    if (d.contains(rule.key)) {
      for (final Category c in categories) {
        if (c.nameRu == rule.value) return c.id;
      }
    }
  }
  return null;
}
