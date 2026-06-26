// Базовый smoke-тест: приложение собирается и показывает стартовый экран.
import 'package:flutter_test/flutter_test.dart';

import 'package:aqsha/main.dart';

void main() {
  testWidgets('Стартовый экран — Дашборд с нижней навигацией',
      (WidgetTester tester) async {
    await tester.pumpWidget(const AqshaApp());
    await tester.pumpAndSettle();

    // На старте открыта вкладка «Дашборд» (есть в AppBar и в навигации).
    expect(find.text('Дашборд'), findsWidgets);
    expect(find.text('Операции'), findsOneWidget);
    expect(find.text('Настройки'), findsOneWidget);
  });
}
