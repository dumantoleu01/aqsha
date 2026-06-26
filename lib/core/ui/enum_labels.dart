import '../../l10n/app_localizations.dart';
import '../enums.dart';

String accountTypeLabel(AppLocalizations l, AccountType type) => switch (type) {
      AccountType.cash => l.accTypeCash,
      AccountType.card => l.accTypeCard,
      AccountType.savings => l.accTypeSavings,
    };

String entryTypeLabel(AppLocalizations l, EntryType type) =>
    type == EntryType.expense ? l.entryExpense : l.entryIncome;

String budgetPeriodLabel(AppLocalizations l, BudgetPeriod period) =>
    period == BudgetPeriod.week ? l.budPeriodWeek : l.budPeriodMonth;
