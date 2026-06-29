import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_kk.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('kk'),
    Locale('ru'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In ru, this message translates to:
  /// **'Aqsha'**
  String get appTitle;

  /// No description provided for @navDashboard.
  ///
  /// In ru, this message translates to:
  /// **'Дашборд'**
  String get navDashboard;

  /// No description provided for @navTransactions.
  ///
  /// In ru, this message translates to:
  /// **'Операции'**
  String get navTransactions;

  /// No description provided for @navBudgets.
  ///
  /// In ru, this message translates to:
  /// **'Бюджеты'**
  String get navBudgets;

  /// No description provided for @navSettings.
  ///
  /// In ru, this message translates to:
  /// **'Настройки'**
  String get navSettings;

  /// No description provided for @save.
  ///
  /// In ru, this message translates to:
  /// **'Сохранить'**
  String get save;

  /// No description provided for @cancel.
  ///
  /// In ru, this message translates to:
  /// **'Отмена'**
  String get cancel;

  /// No description provided for @delete.
  ///
  /// In ru, this message translates to:
  /// **'Удалить'**
  String get delete;

  /// No description provided for @soon.
  ///
  /// In ru, this message translates to:
  /// **'Скоро'**
  String get soon;

  /// No description provided for @dashTotalBalance.
  ///
  /// In ru, this message translates to:
  /// **'Общий баланс'**
  String get dashTotalBalance;

  /// No description provided for @dashIncome.
  ///
  /// In ru, this message translates to:
  /// **'Доходы'**
  String get dashIncome;

  /// No description provided for @dashExpense.
  ///
  /// In ru, this message translates to:
  /// **'Расходы'**
  String get dashExpense;

  /// No description provided for @dashExpenseByCategory.
  ///
  /// In ru, this message translates to:
  /// **'Расходы по категориям'**
  String get dashExpenseByCategory;

  /// No description provided for @dashNoExpenses.
  ///
  /// In ru, this message translates to:
  /// **'Нет расходов за период'**
  String get dashNoExpenses;

  /// No description provided for @periodDay.
  ///
  /// In ru, this message translates to:
  /// **'День'**
  String get periodDay;

  /// No description provided for @periodWeek.
  ///
  /// In ru, this message translates to:
  /// **'Неделя'**
  String get periodWeek;

  /// No description provided for @periodMonth.
  ///
  /// In ru, this message translates to:
  /// **'Месяц'**
  String get periodMonth;

  /// No description provided for @txTitle.
  ///
  /// In ru, this message translates to:
  /// **'Операции'**
  String get txTitle;

  /// No description provided for @txAdd.
  ///
  /// In ru, this message translates to:
  /// **'Операция'**
  String get txAdd;

  /// No description provided for @txEmpty.
  ///
  /// In ru, this message translates to:
  /// **'Операций пока нет.\nНажмите «Операция», чтобы добавить первую.'**
  String get txEmpty;

  /// No description provided for @txNew.
  ///
  /// In ru, this message translates to:
  /// **'Новая операция'**
  String get txNew;

  /// No description provided for @txAmount.
  ///
  /// In ru, this message translates to:
  /// **'Сумма, ₸'**
  String get txAmount;

  /// No description provided for @txNote.
  ///
  /// In ru, this message translates to:
  /// **'Заметка (необязательно)'**
  String get txNote;

  /// No description provided for @txNoCategoriesOfType.
  ///
  /// In ru, this message translates to:
  /// **'Нет категорий этого типа'**
  String get txNoCategoriesOfType;

  /// No description provided for @txNeedAccount.
  ///
  /// In ru, this message translates to:
  /// **'Сначала нужен счёт.\nСоздайте его в «Настройки → Счета».'**
  String get txNeedAccount;

  /// No description provided for @txCreateAccount.
  ///
  /// In ru, this message translates to:
  /// **'Создать счёт'**
  String get txCreateAccount;

  /// No description provided for @txEnterAmount.
  ///
  /// In ru, this message translates to:
  /// **'Введите сумму больше нуля'**
  String get txEnterAmount;

  /// No description provided for @entryExpense.
  ///
  /// In ru, this message translates to:
  /// **'Расход'**
  String get entryExpense;

  /// No description provided for @entryIncome.
  ///
  /// In ru, this message translates to:
  /// **'Доход'**
  String get entryIncome;

  /// No description provided for @fieldCategory.
  ///
  /// In ru, this message translates to:
  /// **'Категория'**
  String get fieldCategory;

  /// No description provided for @fieldAccount.
  ///
  /// In ru, this message translates to:
  /// **'Счёт'**
  String get fieldAccount;

  /// No description provided for @dayToday.
  ///
  /// In ru, this message translates to:
  /// **'Сегодня'**
  String get dayToday;

  /// No description provided for @dayYesterday.
  ///
  /// In ru, this message translates to:
  /// **'Вчера'**
  String get dayYesterday;

  /// No description provided for @accTitle.
  ///
  /// In ru, this message translates to:
  /// **'Счета'**
  String get accTitle;

  /// No description provided for @accEmpty.
  ///
  /// In ru, this message translates to:
  /// **'Пока нет счетов.\nНажмите + чтобы добавить первый.'**
  String get accEmpty;

  /// No description provided for @accNew.
  ///
  /// In ru, this message translates to:
  /// **'Новый счёт'**
  String get accNew;

  /// No description provided for @accName.
  ///
  /// In ru, this message translates to:
  /// **'Название'**
  String get accName;

  /// No description provided for @accNameHint.
  ///
  /// In ru, this message translates to:
  /// **'Например, Kaspi Gold'**
  String get accNameHint;

  /// No description provided for @accType.
  ///
  /// In ru, this message translates to:
  /// **'Тип счёта'**
  String get accType;

  /// No description provided for @accInitialBalance.
  ///
  /// In ru, this message translates to:
  /// **'Начальный остаток, ₸'**
  String get accInitialBalance;

  /// No description provided for @accEnterName.
  ///
  /// In ru, this message translates to:
  /// **'Введите название счёта'**
  String get accEnterName;

  /// No description provided for @accTypeCash.
  ///
  /// In ru, this message translates to:
  /// **'Наличные'**
  String get accTypeCash;

  /// No description provided for @accTypeCard.
  ///
  /// In ru, this message translates to:
  /// **'Карта'**
  String get accTypeCard;

  /// No description provided for @accTypeSavings.
  ///
  /// In ru, this message translates to:
  /// **'Накопления'**
  String get accTypeSavings;

  /// No description provided for @catTitle.
  ///
  /// In ru, this message translates to:
  /// **'Категории'**
  String get catTitle;

  /// No description provided for @catExpenses.
  ///
  /// In ru, this message translates to:
  /// **'Расходы'**
  String get catExpenses;

  /// No description provided for @catIncomes.
  ///
  /// In ru, this message translates to:
  /// **'Доходы'**
  String get catIncomes;

  /// No description provided for @catEmpty.
  ///
  /// In ru, this message translates to:
  /// **'Пока нет категорий'**
  String get catEmpty;

  /// No description provided for @catNew.
  ///
  /// In ru, this message translates to:
  /// **'Новая категория'**
  String get catNew;

  /// No description provided for @catNameRu.
  ///
  /// In ru, this message translates to:
  /// **'Название (рус)'**
  String get catNameRu;

  /// No description provided for @catNameKk.
  ///
  /// In ru, this message translates to:
  /// **'Атауы (қаз)'**
  String get catNameKk;

  /// No description provided for @catIcon.
  ///
  /// In ru, this message translates to:
  /// **'Иконка'**
  String get catIcon;

  /// No description provided for @catColor.
  ///
  /// In ru, this message translates to:
  /// **'Цвет'**
  String get catColor;

  /// No description provided for @catEnterName.
  ///
  /// In ru, this message translates to:
  /// **'Введите название категории'**
  String get catEnterName;

  /// No description provided for @catDeleteTitle.
  ///
  /// In ru, this message translates to:
  /// **'Удалить категорию?'**
  String get catDeleteTitle;

  /// No description provided for @budTitle.
  ///
  /// In ru, this message translates to:
  /// **'Бюджеты'**
  String get budTitle;

  /// No description provided for @budEmpty.
  ///
  /// In ru, this message translates to:
  /// **'Бюджетов пока нет.\nЗадайте лимит по категории, нажав +.'**
  String get budEmpty;

  /// No description provided for @budNew.
  ///
  /// In ru, this message translates to:
  /// **'Новый бюджет'**
  String get budNew;

  /// No description provided for @budLimit.
  ///
  /// In ru, this message translates to:
  /// **'Лимит, ₸'**
  String get budLimit;

  /// No description provided for @budEnterLimit.
  ///
  /// In ru, this message translates to:
  /// **'Введите лимит больше нуля'**
  String get budEnterLimit;

  /// No description provided for @budChooseCategory.
  ///
  /// In ru, this message translates to:
  /// **'Выберите категорию'**
  String get budChooseCategory;

  /// No description provided for @budNoExpenseCategories.
  ///
  /// In ru, this message translates to:
  /// **'Нет категорий расходов'**
  String get budNoExpenseCategories;

  /// No description provided for @budPeriodWeek.
  ///
  /// In ru, this message translates to:
  /// **'неделя'**
  String get budPeriodWeek;

  /// No description provided for @budPeriodMonth.
  ///
  /// In ru, this message translates to:
  /// **'месяц'**
  String get budPeriodMonth;

  /// No description provided for @budSpentOfLimit.
  ///
  /// In ru, this message translates to:
  /// **'{spent} из {limit}'**
  String budSpentOfLimit(String spent, String limit);

  /// No description provided for @budRemaining.
  ///
  /// In ru, this message translates to:
  /// **'Осталось {amount}'**
  String budRemaining(String amount);

  /// No description provided for @budOverBy.
  ///
  /// In ru, this message translates to:
  /// **'Превышен на {amount}'**
  String budOverBy(String amount);

  /// No description provided for @setLanguage.
  ///
  /// In ru, this message translates to:
  /// **'Язык'**
  String get setLanguage;

  /// No description provided for @setBackup.
  ///
  /// In ru, this message translates to:
  /// **'Резервная копия'**
  String get setBackup;

  /// No description provided for @langKazakh.
  ///
  /// In ru, this message translates to:
  /// **'Қазақша'**
  String get langKazakh;

  /// No description provided for @langRussian.
  ///
  /// In ru, this message translates to:
  /// **'Русский'**
  String get langRussian;

  /// No description provided for @langSystem.
  ///
  /// In ru, this message translates to:
  /// **'Системный'**
  String get langSystem;

  /// No description provided for @onbWelcome.
  ///
  /// In ru, this message translates to:
  /// **'Добро пожаловать в Aqsha'**
  String get onbWelcome;

  /// No description provided for @onbSubtitle.
  ///
  /// In ru, this message translates to:
  /// **'Учитывайте деньги просто и на родном языке'**
  String get onbSubtitle;

  /// No description provided for @onbFirstAccount.
  ///
  /// In ru, this message translates to:
  /// **'Ваш первый счёт'**
  String get onbFirstAccount;

  /// No description provided for @onbStart.
  ///
  /// In ru, this message translates to:
  /// **'Начать'**
  String get onbStart;

  /// No description provided for @impTitle.
  ///
  /// In ru, this message translates to:
  /// **'Импорт выписки'**
  String get impTitle;

  /// No description provided for @impHint.
  ///
  /// In ru, this message translates to:
  /// **'Выгрузите PDF-выписку из Kaspi и выберите её здесь'**
  String get impHint;

  /// No description provided for @impPickFile.
  ///
  /// In ru, this message translates to:
  /// **'Выбрать PDF'**
  String get impPickFile;

  /// No description provided for @impEmpty.
  ///
  /// In ru, this message translates to:
  /// **'Не удалось распознать операции в файле'**
  String get impEmpty;

  /// No description provided for @impDuplicate.
  ///
  /// In ru, this message translates to:
  /// **'уже есть'**
  String get impDuplicate;

  /// No description provided for @impImport.
  ///
  /// In ru, this message translates to:
  /// **'Импортировать ({count})'**
  String impImport(int count);

  /// No description provided for @impImported.
  ///
  /// In ru, this message translates to:
  /// **'Импортировано операций: {count}'**
  String impImported(int count);

  /// No description provided for @bkTitle.
  ///
  /// In ru, this message translates to:
  /// **'Резервная копия'**
  String get bkTitle;

  /// No description provided for @bkExport.
  ///
  /// In ru, this message translates to:
  /// **'Экспорт данных'**
  String get bkExport;

  /// No description provided for @bkExportHint.
  ///
  /// In ru, this message translates to:
  /// **'Сохранить все данные в файл (.json)'**
  String get bkExportHint;

  /// No description provided for @bkImport.
  ///
  /// In ru, this message translates to:
  /// **'Восстановить из файла'**
  String get bkImport;

  /// No description provided for @bkImportHint.
  ///
  /// In ru, this message translates to:
  /// **'Заменит текущие данные данными из файла'**
  String get bkImportHint;

  /// No description provided for @bkExported.
  ///
  /// In ru, this message translates to:
  /// **'Данные сохранены'**
  String get bkExported;

  /// No description provided for @bkRestore.
  ///
  /// In ru, this message translates to:
  /// **'Восстановить'**
  String get bkRestore;

  /// No description provided for @bkRestoreConfirm.
  ///
  /// In ru, this message translates to:
  /// **'Восстановление заменит все текущие данные. Продолжить?'**
  String get bkRestoreConfirm;

  /// No description provided for @bkRestored.
  ///
  /// In ru, this message translates to:
  /// **'Восстановлено записей: {count}'**
  String bkRestored(int count);

  /// No description provided for @acTitle.
  ///
  /// In ru, this message translates to:
  /// **'Автозахват трат'**
  String get acTitle;

  /// No description provided for @acOnlyAndroid.
  ///
  /// In ru, this message translates to:
  /// **'Доступно только на Android'**
  String get acOnlyAndroid;

  /// No description provided for @acPermissionHint.
  ///
  /// In ru, this message translates to:
  /// **'Разрешите доступ к уведомлениям, чтобы автоматически ловить траты из пушей Kaspi'**
  String get acPermissionHint;

  /// No description provided for @acEnable.
  ///
  /// In ru, this message translates to:
  /// **'Включить'**
  String get acEnable;

  /// No description provided for @acEnabled.
  ///
  /// In ru, this message translates to:
  /// **'Доступ к уведомлениям включён'**
  String get acEnabled;

  /// No description provided for @acBatteryNote.
  ///
  /// In ru, this message translates to:
  /// **'Чтобы не терять траты, отключите для приложения оптимизацию батареи (см. dontkillmyapp.com)'**
  String get acBatteryNote;

  /// No description provided for @acDraftsTitle.
  ///
  /// In ru, this message translates to:
  /// **'Черновики'**
  String get acDraftsTitle;

  /// No description provided for @acNoDrafts.
  ///
  /// In ru, this message translates to:
  /// **'Черновиков нет. Они появятся после оплат через Kaspi.'**
  String get acNoDrafts;

  /// No description provided for @acConfirm.
  ///
  /// In ru, this message translates to:
  /// **'Подтвердить'**
  String get acConfirm;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['kk', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'kk':
      return AppLocalizationsKk();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
