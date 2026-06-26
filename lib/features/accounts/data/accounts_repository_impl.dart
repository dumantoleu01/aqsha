import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../../core/database/app_database.dart';
import '../../../core/enums.dart';
import '../domain/account.dart';
import '../domain/accounts_repository.dart';

@LazySingleton(as: AccountsRepository)
class AccountsRepositoryImpl implements AccountsRepository {
  AccountsRepositoryImpl(this._db);

  final AppDatabase _db;

  @override
  Stream<List<Account>> watchAccounts() {
    // Текущий баланс = стартовый остаток + сумма подтверждённых операций
    // (доход «+», расход «−»).
    return _db.customSelect(
      'SELECT a.*, '
      '(a.initial_balance_minor + COALESCE(SUM('
      'CASE WHEN t.type = ? THEN t.amount_minor ELSE -t.amount_minor END'
      '), 0)) AS balance '
      'FROM accounts a '
      'LEFT JOIN transactions t '
      '  ON t.account_id = a.id AND t.status = ? '
      'WHERE a.is_archived = 0 '
      'GROUP BY a.id '
      'ORDER BY a.sort_order, a.id',
      variables: <Variable<Object>>[
        Variable.withInt(EntryType.income.index),
        Variable.withInt(TransactionStatus.confirmed.index),
      ],
      readsFrom: <ResultSetImplementation<dynamic, dynamic>>{
        _db.accounts,
        _db.transactions,
      },
    ).watch().map(
          (List<QueryRow> rows) => rows.map(_mapRow).toList(),
        );
  }

  Account _mapRow(QueryRow r) => Account(
        id: r.read<int>('id'),
        name: r.read<String>('name'),
        type: AccountType.values[r.read<int>('type')],
        currency: r.read<String>('currency'),
        initialBalanceMinor: r.read<int>('initial_balance_minor'),
        balanceMinor: r.read<int>('balance'),
        iconCodePoint: r.readNullable<int>('icon_code_point'),
        colorValue: r.readNullable<int>('color_value'),
        sortOrder: r.read<int>('sort_order'),
      );

  @override
  Future<int> createAccount({
    required String name,
    required AccountType type,
    required String currency,
    required int initialBalanceMinor,
    int? iconCodePoint,
    int? colorValue,
  }) {
    return _db.into(_db.accounts).insert(
          AccountsCompanion.insert(
            name: name,
            type: type,
            currency: Value<String>(currency),
            initialBalanceMinor: Value<int>(initialBalanceMinor),
            iconCodePoint: Value<int?>(iconCodePoint),
            colorValue: Value<int?>(colorValue),
          ),
        );
  }

  @override
  Future<void> updateAccount(Account account) async {
    await (_db.update(_db.accounts)
          ..where(($AccountsTable t) => t.id.equals(account.id)))
        .write(
      AccountsCompanion(
        name: Value<String>(account.name),
        type: Value<AccountType>(account.type),
        currency: Value<String>(account.currency),
        initialBalanceMinor: Value<int>(account.initialBalanceMinor),
        iconCodePoint: Value<int?>(account.iconCodePoint),
        colorValue: Value<int?>(account.colorValue),
        sortOrder: Value<int>(account.sortOrder),
      ),
    );
  }

  @override
  Future<void> archiveAccount(int id) async {
    await (_db.update(_db.accounts)..where(($AccountsTable t) => t.id.equals(id)))
        .write(const AccountsCompanion(isArchived: Value<bool>(true)));
  }
}
