// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Aqsha';

  @override
  String get navDashboard => 'Дашборд';

  @override
  String get navTransactions => 'Операции';

  @override
  String get navBudgets => 'Бюджеты';

  @override
  String get navSettings => 'Настройки';

  @override
  String get save => 'Сохранить';

  @override
  String get cancel => 'Отмена';

  @override
  String get delete => 'Удалить';

  @override
  String get soon => 'Скоро';

  @override
  String get dashTotalBalance => 'Общий баланс';

  @override
  String get dashIncome => 'Доходы';

  @override
  String get dashExpense => 'Расходы';

  @override
  String get dashExpenseByCategory => 'Расходы по категориям';

  @override
  String get dashNoExpenses => 'Нет расходов за период';

  @override
  String get periodDay => 'День';

  @override
  String get periodWeek => 'Неделя';

  @override
  String get periodMonth => 'Месяц';

  @override
  String get txTitle => 'Операции';

  @override
  String get txAdd => 'Операция';

  @override
  String get txEmpty =>
      'Операций пока нет.\nНажмите «Операция», чтобы добавить первую.';

  @override
  String get txNew => 'Новая операция';

  @override
  String get txAmount => 'Сумма, ₸';

  @override
  String get txNote => 'Заметка (необязательно)';

  @override
  String get txNoCategoriesOfType => 'Нет категорий этого типа';

  @override
  String get txNeedAccount =>
      'Сначала нужен счёт.\nСоздайте его в «Настройки → Счета».';

  @override
  String get txCreateAccount => 'Создать счёт';

  @override
  String get txEnterAmount => 'Введите сумму больше нуля';

  @override
  String get entryExpense => 'Расход';

  @override
  String get entryIncome => 'Доход';

  @override
  String get fieldCategory => 'Категория';

  @override
  String get fieldAccount => 'Счёт';

  @override
  String get dayToday => 'Сегодня';

  @override
  String get dayYesterday => 'Вчера';

  @override
  String get accTitle => 'Счета';

  @override
  String get accEmpty => 'Пока нет счетов.\nНажмите + чтобы добавить первый.';

  @override
  String get accNew => 'Новый счёт';

  @override
  String get accName => 'Название';

  @override
  String get accNameHint => 'Например, Kaspi Gold';

  @override
  String get accType => 'Тип счёта';

  @override
  String get accInitialBalance => 'Начальный остаток, ₸';

  @override
  String get accEnterName => 'Введите название счёта';

  @override
  String get accTypeCash => 'Наличные';

  @override
  String get accTypeCard => 'Карта';

  @override
  String get accTypeSavings => 'Накопления';

  @override
  String get catTitle => 'Категории';

  @override
  String get catExpenses => 'Расходы';

  @override
  String get catIncomes => 'Доходы';

  @override
  String get catEmpty => 'Пока нет категорий';

  @override
  String get catNew => 'Новая категория';

  @override
  String get catNameRu => 'Название (рус)';

  @override
  String get catNameKk => 'Атауы (қаз)';

  @override
  String get catIcon => 'Иконка';

  @override
  String get catColor => 'Цвет';

  @override
  String get catEnterName => 'Введите название категории';

  @override
  String get catDeleteTitle => 'Удалить категорию?';

  @override
  String get budTitle => 'Бюджеты';

  @override
  String get budEmpty =>
      'Бюджетов пока нет.\nЗадайте лимит по категории, нажав +.';

  @override
  String get budNew => 'Новый бюджет';

  @override
  String get budLimit => 'Лимит, ₸';

  @override
  String get budEnterLimit => 'Введите лимит больше нуля';

  @override
  String get budChooseCategory => 'Выберите категорию';

  @override
  String get budNoExpenseCategories => 'Нет категорий расходов';

  @override
  String get budPeriodWeek => 'неделя';

  @override
  String get budPeriodMonth => 'месяц';

  @override
  String budSpentOfLimit(String spent, String limit) {
    return '$spent из $limit';
  }

  @override
  String budRemaining(String amount) {
    return 'Осталось $amount';
  }

  @override
  String budOverBy(String amount) {
    return 'Превышен на $amount';
  }

  @override
  String get setLanguage => 'Язык';

  @override
  String get setBackup => 'Резервная копия';

  @override
  String get langKazakh => 'Қазақша';

  @override
  String get langRussian => 'Русский';

  @override
  String get langSystem => 'Системный';

  @override
  String get onbWelcome => 'Добро пожаловать в Aqsha';

  @override
  String get onbSubtitle => 'Учитывайте деньги просто и на родном языке';

  @override
  String get onbFirstAccount => 'Ваш первый счёт';

  @override
  String get onbStart => 'Начать';

  @override
  String get impTitle => 'Импорт выписки';

  @override
  String get impHint => 'Выгрузите PDF-выписку из Kaspi и выберите её здесь';

  @override
  String get impPickFile => 'Выбрать PDF';

  @override
  String get impEmpty => 'Не удалось распознать операции в файле';

  @override
  String get impDuplicate => 'уже есть';

  @override
  String impImport(int count) {
    return 'Импортировать ($count)';
  }

  @override
  String impImported(int count) {
    return 'Импортировано операций: $count';
  }

  @override
  String get bkTitle => 'Резервная копия';

  @override
  String get bkExport => 'Экспорт данных';

  @override
  String get bkExportHint => 'Сохранить все данные в файл (.json)';

  @override
  String get bkImport => 'Восстановить из файла';

  @override
  String get bkImportHint => 'Заменит текущие данные данными из файла';

  @override
  String get bkExported => 'Данные сохранены';

  @override
  String get bkRestore => 'Восстановить';

  @override
  String get bkRestoreConfirm =>
      'Восстановление заменит все текущие данные. Продолжить?';

  @override
  String bkRestored(int count) {
    return 'Восстановлено записей: $count';
  }

  @override
  String get acTitle => 'Автозахват трат';

  @override
  String get acOnlyAndroid => 'Доступно только на Android';

  @override
  String get acPermissionHint =>
      'Разрешите доступ к уведомлениям, чтобы автоматически ловить траты из пушей Kaspi';

  @override
  String get acEnable => 'Включить';

  @override
  String get acEnabled => 'Доступ к уведомлениям включён';

  @override
  String get acBatteryNote =>
      'Чтобы не терять траты, отключите для приложения оптимизацию батареи (см. dontkillmyapp.com)';

  @override
  String get acDraftsTitle => 'Черновики';

  @override
  String get acNoDrafts =>
      'Черновиков нет. Они появятся после оплат через Kaspi.';

  @override
  String get acConfirm => 'Подтвердить';
}
