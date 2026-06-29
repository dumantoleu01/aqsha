// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kazakh (`kk`).
class AppLocalizationsKk extends AppLocalizations {
  AppLocalizationsKk([String locale = 'kk']) : super(locale);

  @override
  String get appTitle => 'Aqsha';

  @override
  String get navDashboard => 'Басты бет';

  @override
  String get navTransactions => 'Операциялар';

  @override
  String get navBudgets => 'Бюджеттер';

  @override
  String get navSettings => 'Баптаулар';

  @override
  String get save => 'Сақтау';

  @override
  String get cancel => 'Болдырмау';

  @override
  String get delete => 'Жою';

  @override
  String get soon => 'Жақында';

  @override
  String get dashTotalBalance => 'Жалпы баланс';

  @override
  String get dashIncome => 'Кірістер';

  @override
  String get dashExpense => 'Шығыстар';

  @override
  String get dashExpenseByCategory => 'Санаттар бойынша шығыстар';

  @override
  String get dashNoExpenses => 'Кезеңде шығыс жоқ';

  @override
  String get periodDay => 'Күн';

  @override
  String get periodWeek => 'Апта';

  @override
  String get periodMonth => 'Ай';

  @override
  String get txTitle => 'Операциялар';

  @override
  String get txAdd => 'Операция';

  @override
  String get txEmpty =>
      'Әзірге операция жоқ.\nБіріншісін қосу үшін «Операция» басыңыз.';

  @override
  String get txNew => 'Жаңа операция';

  @override
  String get txAmount => 'Сома, ₸';

  @override
  String get txNote => 'Ескертпе (міндетті емес)';

  @override
  String get txNoCategoriesOfType => 'Бұл түрдегі санат жоқ';

  @override
  String get txNeedAccount =>
      'Алдымен шот қажет.\n«Баптаулар → Шоттар» бөлімінде құрыңыз.';

  @override
  String get txCreateAccount => 'Шот құру';

  @override
  String get txEnterAmount => 'Нөлден үлкен сома енгізіңіз';

  @override
  String get entryExpense => 'Шығыс';

  @override
  String get entryIncome => 'Кіріс';

  @override
  String get fieldCategory => 'Санат';

  @override
  String get fieldAccount => 'Шот';

  @override
  String get dayToday => 'Бүгін';

  @override
  String get dayYesterday => 'Кеше';

  @override
  String get accTitle => 'Шоттар';

  @override
  String get accEmpty => 'Әзірге шот жоқ.\nБіріншісін қосу үшін + басыңыз.';

  @override
  String get accNew => 'Жаңа шот';

  @override
  String get accName => 'Атауы';

  @override
  String get accNameHint => 'Мысалы, Kaspi Gold';

  @override
  String get accType => 'Шот түрі';

  @override
  String get accInitialBalance => 'Бастапқы қалдық, ₸';

  @override
  String get accEnterName => 'Шот атауын енгізіңіз';

  @override
  String get accTypeCash => 'Қолма-қол';

  @override
  String get accTypeCard => 'Карта';

  @override
  String get accTypeSavings => 'Жинақ';

  @override
  String get catTitle => 'Санаттар';

  @override
  String get catExpenses => 'Шығыстар';

  @override
  String get catIncomes => 'Кірістер';

  @override
  String get catEmpty => 'Әзірге санат жоқ';

  @override
  String get catNew => 'Жаңа санат';

  @override
  String get catNameRu => 'Атауы (орыс)';

  @override
  String get catNameKk => 'Атауы (қаз)';

  @override
  String get catIcon => 'Белгіше';

  @override
  String get catColor => 'Түс';

  @override
  String get catEnterName => 'Санат атауын енгізіңіз';

  @override
  String get catDeleteTitle => 'Санатты жою керек пе?';

  @override
  String get budTitle => 'Бюджеттер';

  @override
  String get budEmpty => 'Әзірге бюджет жоқ.\n+ басып, санатқа лимит қойыңыз.';

  @override
  String get budNew => 'Жаңа бюджет';

  @override
  String get budLimit => 'Лимит, ₸';

  @override
  String get budEnterLimit => 'Нөлден үлкен лимит енгізіңіз';

  @override
  String get budChooseCategory => 'Санатты таңдаңыз';

  @override
  String get budNoExpenseCategories => 'Шығыс санаттары жоқ';

  @override
  String get budPeriodWeek => 'апта';

  @override
  String get budPeriodMonth => 'ай';

  @override
  String budSpentOfLimit(String spent, String limit) {
    return '$limit ішінен $spent';
  }

  @override
  String budRemaining(String amount) {
    return 'Қалды $amount';
  }

  @override
  String budOverBy(String amount) {
    return '$amount асып кетті';
  }

  @override
  String get setLanguage => 'Тіл';

  @override
  String get setBackup => 'Сақтық көшірме';

  @override
  String get langKazakh => 'Қазақша';

  @override
  String get langRussian => 'Русский';

  @override
  String get langSystem => 'Жүйелік';

  @override
  String get onbWelcome => 'Aqsha-ға қош келдіңіз';

  @override
  String get onbSubtitle => 'Ақшаңызды оңай әрі ана тіліңізде есептеңіз';

  @override
  String get onbFirstAccount => 'Алғашқы шотыңыз';

  @override
  String get onbStart => 'Бастау';

  @override
  String get impTitle => 'Үзінді импорты';

  @override
  String get impHint => 'Kaspi-ден PDF үзінді жүктеп, осында таңдаңыз';

  @override
  String get impPickFile => 'PDF таңдау';

  @override
  String get impEmpty => 'Файлдан операциялар табылмады';

  @override
  String get impDuplicate => 'бар';

  @override
  String impImport(int count) {
    return 'Импорттау ($count)';
  }

  @override
  String impImported(int count) {
    return 'Импортталған операциялар: $count';
  }

  @override
  String get bkTitle => 'Сақтық көшірме';

  @override
  String get bkExport => 'Деректерді экспорттау';

  @override
  String get bkExportHint => 'Барлық деректерді файлға (.json) сақтау';

  @override
  String get bkImport => 'Файлдан қалпына келтіру';

  @override
  String get bkImportHint => 'Ағымдағы деректерді файлдағыға ауыстырады';

  @override
  String get bkExported => 'Деректер сақталды';

  @override
  String get bkRestore => 'Қалпына келтіру';

  @override
  String get bkRestoreConfirm =>
      'Қалпына келтіру барлық ағымдағы деректерді ауыстырады. Жалғастырамыз ба?';

  @override
  String bkRestored(int count) {
    return 'Қалпына келтірілді: $count';
  }

  @override
  String get acTitle => 'Шығысты автоматты түсіру';

  @override
  String get acOnlyAndroid => 'Тек Android-та қолжетімді';

  @override
  String get acPermissionHint =>
      'Kaspi push-хабарландыруларынан шығыстарды автоматты түсіру үшін хабарландыруларға рұқсат беріңіз';

  @override
  String get acEnable => 'Қосу';

  @override
  String get acEnabled => 'Хабарландыруларға рұқсат қосылған';

  @override
  String get acBatteryNote =>
      'Шығыстарды жоғалтпау үшін қолданба үшін батарея оптимизациясын өшіріңіз (dontkillmyapp.com)';

  @override
  String get acDraftsTitle => 'Жобалар';

  @override
  String get acNoDrafts =>
      'Жоба жоқ. Олар Kaspi арқылы төлемдерден кейін пайда болады.';

  @override
  String get acConfirm => 'Растау';
}
