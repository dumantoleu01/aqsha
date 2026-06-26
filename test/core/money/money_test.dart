import 'package:aqsha/core/money/money.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('fromMajor конвертирует тенге в тиыны', () {
    expect(Money.fromMajor(3500).minorUnits, 350000);
    expect(Money.fromMajor(12.34).minorUnits, 1234);
  });

  test('операторы +/− и знак', () {
    expect((const Money(100000) + const Money(50000)).minorUnits, 150000);
    expect((const Money(100000) - const Money(150000)).minorUnits, -50000);
    expect(const Money(-1).isNegative, isTrue);
    expect(Money.zero.isZero, isTrue);
  });

  test('format содержит сумму и символ ₸', () {
    final String s = Money.fromMajor(1200).format();
    expect(s.contains('1'), isTrue);
    expect(s.contains('200'), isTrue);
    expect(s.contains('₸'), isTrue);
  });
}
