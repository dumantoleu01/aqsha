import '../../../core/enums.dart';
import 'transaction_list_item.dart';

abstract interface class TransactionsRepository {
  /// Лента подтверждённых операций (свежие сверху) с данными счёта/категории.
  Stream<List<TransactionListItem>> watchTransactions();

  Future<int> createTransaction({
    required int accountId,
    int? categoryId,
    required int amountMinor,
    required EntryType type,
    required DateTime date,
    String? note,
    String? merchant,
  });

  Future<void> deleteTransaction(int id);
}
