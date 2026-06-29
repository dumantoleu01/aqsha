import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import '../../../core/database/app_database.dart';
import '../../../core/enums.dart';
import '../domain/transaction_list_item.dart';
import '../domain/transactions_repository.dart';

@LazySingleton(as: TransactionsRepository)
class TransactionsRepositoryImpl implements TransactionsRepository {
  TransactionsRepositoryImpl(this._db);

  final AppDatabase _db;

  @override
  Stream<List<TransactionListItem>> watchTransactions() {
    final JoinedSelectStatement<HasResultSet, dynamic> query =
        (_db.select(_db.transactions)
              ..where(($TransactionsTable t) =>
                  t.status.equalsValue(TransactionStatus.confirmed))
              ..orderBy(<OrderClauseGenerator<$TransactionsTable>>[
                ($TransactionsTable t) =>
                    OrderingTerm(expression: t.date, mode: OrderingMode.desc),
                ($TransactionsTable t) =>
                    OrderingTerm(expression: t.id, mode: OrderingMode.desc),
              ]))
            .join(<Join<HasResultSet, dynamic>>[
      innerJoin(
        _db.accounts,
        _db.accounts.id.equalsExp(_db.transactions.accountId),
      ),
      leftOuterJoin(
        _db.categories,
        _db.categories.id.equalsExp(_db.transactions.categoryId),
      ),
    ]);

    return query.watch().map(
          (List<TypedResult> rows) => rows.map(_mapRow).toList(),
        );
  }

  TransactionListItem _mapRow(TypedResult row) {
    final TransactionRow t = row.readTable(_db.transactions);
    final AccountRow a = row.readTable(_db.accounts);
    final CategoryRow? c = row.readTableOrNull(_db.categories);
    return TransactionListItem(
      id: t.id,
      amountMinor: t.amountMinor,
      type: t.type,
      date: t.date,
      accountName: a.name,
      currency: a.currency,
      note: t.note,
      merchant: t.merchant,
      categoryNameKk: c?.nameKk,
      categoryNameRu: c?.nameRu,
      categoryIconCodePoint: c?.iconCodePoint,
      categoryColorValue: c?.colorValue,
    );
  }

  @override
  Future<int> createTransaction({
    required int accountId,
    int? categoryId,
    required int amountMinor,
    required EntryType type,
    required DateTime date,
    String? note,
    String? merchant,
    String? importHash,
  }) {
    return _db.into(_db.transactions).insert(
          TransactionsCompanion.insert(
            accountId: accountId,
            categoryId: Value<int?>(categoryId),
            amountMinor: amountMinor,
            type: type,
            date: date,
            note: Value<String?>(note),
            merchant: Value<String?>(merchant),
            importHash: Value<String?>(importHash),
          ),
        );
  }

  @override
  Future<void> deleteTransaction(int id) async {
    await (_db.delete(_db.transactions)
          ..where(($TransactionsTable t) => t.id.equals(id)))
        .go();
  }

  @override
  Future<Set<String>> findExistingHashes(List<String> hashes) async {
    if (hashes.isEmpty) return <String>{};
    final List<TransactionRow> rows = await (_db.select(_db.transactions)
          ..where(($TransactionsTable t) => t.importHash.isIn(hashes)))
        .get();
    return rows
        .map((TransactionRow r) => r.importHash)
        .whereType<String>()
        .toSet();
  }
}
