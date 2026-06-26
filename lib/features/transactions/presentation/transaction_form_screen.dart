import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/di/injection.dart';
import '../../../core/enums.dart';
import '../../../core/money/money.dart';
import '../../../core/ui/category_visuals.dart';
import '../../../core/ui/date_labels.dart';
import '../../../l10n/app_localizations.dart';
import '../../accounts/domain/account.dart';
import '../../accounts/domain/accounts_repository.dart';
import '../../categories/domain/categories_repository.dart';
import '../../categories/domain/category.dart';
import '../domain/transactions_repository.dart';

class TransactionFormScreen extends StatefulWidget {
  const TransactionFormScreen({super.key});

  @override
  State<TransactionFormScreen> createState() => _TransactionFormScreenState();
}

class _TransactionFormScreenState extends State<TransactionFormScreen> {
  final TextEditingController _amount = TextEditingController();
  final TextEditingController _note = TextEditingController();

  List<Account>? _accounts;
  List<Category>? _categories;
  Account? _account;
  Category? _category;
  EntryType _type = EntryType.expense;
  DateTime _date = DateTime.now();
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final List<Account> accounts =
        await getIt<AccountsRepository>().watchAccounts().first;
    final List<Category> categories =
        await getIt<CategoriesRepository>().watchCategories().first;
    if (!mounted) return;
    setState(() {
      _accounts = accounts;
      _categories = categories;
      _account = accounts.isNotEmpty ? accounts.first : null;
    });
  }

  @override
  void dispose() {
    _amount.dispose();
    _note.dispose();
    super.dispose();
  }

  List<Category> get _visibleCategories => (_categories ?? <Category>[])
      .where((Category c) => c.type == _type)
      .toList();

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2020),
      lastDate: DateTime.now().add(const Duration(days: 1)),
    );
    if (picked != null) setState(() => _date = picked);
  }

  Future<void> _save() async {
    final AppLocalizations l = AppLocalizations.of(context);
    final double major =
        double.tryParse(_amount.text.replaceAll(',', '.').trim()) ?? 0;
    if (major <= 0) {
      _toast(l.txEnterAmount);
      return;
    }
    if (_account == null) {
      _toast(l.txCreateAccount);
      return;
    }
    setState(() => _saving = true);
    await getIt<TransactionsRepository>().createTransaction(
      accountId: _account!.id,
      categoryId: _category?.id,
      amountMinor: Money.fromMajor(major).minorUnits,
      type: _type,
      date: _date,
      note: _note.text.trim().isEmpty ? null : _note.text.trim(),
    );
    if (!mounted) return;
    if (context.canPop()) {
      context.pop();
    } else {
      context.go('/transactions');
    }
  }

  void _toast(String msg) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l = AppLocalizations.of(context);
    final List<Account>? accounts = _accounts;
    return Scaffold(
      appBar: AppBar(title: Text(l.txNew)),
      body: accounts == null
          ? const Center(child: CircularProgressIndicator())
          : accounts.isEmpty
              ? _NoAccounts()
              : _form(l, accounts),
    );
  }

  Widget _form(AppLocalizations l, List<Account> accounts) {
    final String lang = Localizations.localeOf(context).languageCode;
    return ListView(
      padding: const EdgeInsets.all(16),
      children: <Widget>[
        SegmentedButton<EntryType>(
          segments: <ButtonSegment<EntryType>>[
            ButtonSegment<EntryType>(
              value: EntryType.expense,
              label: Text(l.entryExpense),
              icon: const Icon(Icons.south_west),
            ),
            ButtonSegment<EntryType>(
              value: EntryType.income,
              label: Text(l.entryIncome),
              icon: const Icon(Icons.north_east),
            ),
          ],
          selected: <EntryType>{_type},
          onSelectionChanged: (Set<EntryType> s) => setState(() {
            _type = s.first;
            _category = null;
          }),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: _amount,
          autofocus: true,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          style: Theme.of(context).textTheme.headlineMedium,
          decoration: InputDecoration(
            labelText: l.txAmount,
            hintText: '0',
            border: const OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 20),
        Text(l.fieldCategory, style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(height: 8),
        _CategoryChips(
          categories: _visibleCategories,
          selected: _category,
          onPick: (Category c) => setState(() => _category = c),
        ),
        const SizedBox(height: 20),
        DropdownButtonFormField<Account>(
          initialValue: _account,
          decoration: InputDecoration(
            labelText: l.fieldAccount,
            border: const OutlineInputBorder(),
          ),
          items: <DropdownMenuItem<Account>>[
            for (final Account a in accounts)
              DropdownMenuItem<Account>(value: a, child: Text(a.name)),
          ],
          onChanged: (Account? a) => setState(() => _account = a),
        ),
        const SizedBox(height: 16),
        OutlinedButton.icon(
          onPressed: _pickDate,
          icon: const Icon(Icons.calendar_today),
          label: Text(formatFullDate(_date, lang)),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: _note,
          decoration: InputDecoration(
            labelText: l.txNote,
            border: const OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 24),
        FilledButton.icon(
          onPressed: _saving ? null : _save,
          icon: const Icon(Icons.check),
          label: Text(l.save),
        ),
      ],
    );
  }
}

class _CategoryChips extends StatelessWidget {
  const _CategoryChips({
    required this.categories,
    required this.selected,
    required this.onPick,
  });

  final List<Category> categories;
  final Category? selected;
  final ValueChanged<Category> onPick;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l = AppLocalizations.of(context);
    if (categories.isEmpty) {
      return Text(l.txNoCategoriesOfType);
    }
    final String lang = Localizations.localeOf(context).languageCode;
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: <Widget>[
        for (final Category c in categories)
          ChoiceChip(
            selected: selected?.id == c.id,
            avatar: Icon(
              CategoryVisuals.iconFromCodePoint(c.iconCodePoint),
              size: 18,
            ),
            label: Text(c.localizedName(lang)),
            onSelected: (_) => onPick(c),
          ),
      ],
    );
  }
}

class _NoAccounts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppLocalizations l = AppLocalizations.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(l.txNeedAccount, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () => context.go('/settings/accounts/new'),
              child: Text(l.txCreateAccount),
            ),
          ],
        ),
      ),
    );
  }
}
