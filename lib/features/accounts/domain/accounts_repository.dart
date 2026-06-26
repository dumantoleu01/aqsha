import '../../../core/enums.dart';
import 'account.dart';

/// Контракт доступа к счетам (реализация — в слое data).
abstract interface class AccountsRepository {
  /// Поток активных счетов с уже посчитанным текущим балансом.
  Stream<List<Account>> watchAccounts();

  Future<int> createAccount({
    required String name,
    required AccountType type,
    required String currency,
    required int initialBalanceMinor,
    int? iconCodePoint,
    int? colorValue,
  });

  Future<void> updateAccount(Account account);

  Future<void> archiveAccount(int id);
}
