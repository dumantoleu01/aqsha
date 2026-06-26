import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/enums.dart';
import '../../../core/money/money.dart';

part 'account.freezed.dart';

@freezed
abstract class Account with _$Account {
  const Account._();

  const factory Account({
    required int id,
    required String name,
    required AccountType type,
    @Default('KZT') String currency,
    @Default(0) int initialBalanceMinor,
    @Default(0) int balanceMinor,
    int? iconCodePoint,
    int? colorValue,
    @Default(false) bool isArchived,
    @Default(0) int sortOrder,
  }) = _Account;

  /// Текущий баланс (стартовый + операции).
  Money get balance => Money(balanceMinor, currency: currency);

  /// Стартовый остаток.
  Money get initialBalance => Money(initialBalanceMinor, currency: currency);
}
