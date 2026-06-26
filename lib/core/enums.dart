// Общие перечисления (хранятся в БД как индекс — НЕ переставлять значения!).

/// Доход или расход. Используется и категориями, и операциями.
enum EntryType { income, expense }

/// Тип счёта.
enum AccountType { cash, card, savings }

/// Период бюджета.
enum BudgetPeriod { week, month }

/// Откуда появилась операция.
enum TransactionSource { manual, autoPush, import }

/// Статус операции (черновик из автозахвата ждёт подтверждения).
enum TransactionStatus { confirmed, draft }
