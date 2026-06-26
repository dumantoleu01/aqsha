import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

/// Денежная сумма.
///
/// Хранится в **минорных единицах** (тиынах) как [int], чтобы исключить
/// ошибки округления double. 1 тенге = 100 тиын.
class Money extends Equatable {
  const Money(this.minorUnits, {this.currency = 'KZT'});

  /// Сумма из «больших» единиц (тенге): `Money.fromMajor(3500)`.
  factory Money.fromMajor(num major, {String currency = 'KZT'}) =>
      Money((major * 100).round(), currency: currency);

  static const Money zero = Money(0);

  final int minorUnits;
  final String currency;

  /// Значение в тенге (для форматирования/отображения).
  double get major => minorUnits / 100;

  bool get isNegative => minorUnits < 0;
  bool get isZero => minorUnits == 0;

  Money operator +(Money other) {
    _assertSameCurrency(other);
    return Money(minorUnits + other.minorUnits, currency: currency);
  }

  Money operator -(Money other) {
    _assertSameCurrency(other);
    return Money(minorUnits - other.minorUnits, currency: currency);
  }

  Money operator -() => Money(-minorUnits, currency: currency);

  /// Форматирует сумму с символом валюты, например `3 500 ₸`.
  String format({String locale = 'ru', String symbol = '₸'}) {
    final bool whole = minorUnits % 100 == 0;
    final NumberFormat formatter = NumberFormat.currency(
      locale: locale,
      symbol: symbol,
      decimalDigits: whole ? 0 : 2,
    );
    return formatter.format(major);
  }

  void _assertSameCurrency(Money other) {
    assert(
      currency == other.currency,
      'Нельзя складывать разные валюты: $currency и ${other.currency}',
    );
  }

  @override
  List<Object?> get props => <Object?>[minorUnits, currency];

  @override
  String toString() => format();
}
