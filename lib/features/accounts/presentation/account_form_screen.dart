import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/di/injection.dart';
import '../../../core/enums.dart';
import '../../../core/money/money.dart';
import '../../../core/ui/enum_labels.dart';
import '../../../l10n/app_localizations.dart';
import '../domain/accounts_repository.dart';
import 'accounts_screen.dart' show accountTypeIcon;

class AccountFormScreen extends StatefulWidget {
  const AccountFormScreen({super.key});

  @override
  State<AccountFormScreen> createState() => _AccountFormScreenState();
}

class _AccountFormScreenState extends State<AccountFormScreen> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _balance = TextEditingController();
  AccountType _type = AccountType.cash;
  bool _saving = false;

  @override
  void dispose() {
    _name.dispose();
    _balance.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final AppLocalizations l = AppLocalizations.of(context);
    final String name = _name.text.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(l.accEnterName)));
      return;
    }
    setState(() => _saving = true);

    final double major =
        double.tryParse(_balance.text.replaceAll(',', '.')) ?? 0;
    await getIt<AccountsRepository>().createAccount(
      name: name,
      type: _type,
      currency: 'KZT',
      initialBalanceMinor: Money.fromMajor(major).minorUnits,
    );

    if (!mounted) return;
    if (context.canPop()) {
      context.pop();
    } else {
      context.go('/settings/accounts');
    }
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(l.accNew)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          TextField(
            controller: _name,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              labelText: l.accName,
              hintText: l.accNameHint,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<AccountType>(
            initialValue: _type,
            decoration: InputDecoration(
              labelText: l.accType,
              border: const OutlineInputBorder(),
            ),
            items: <DropdownMenuItem<AccountType>>[
              for (final AccountType t in AccountType.values)
                DropdownMenuItem<AccountType>(
                  value: t,
                  child: Row(
                    children: <Widget>[
                      Icon(accountTypeIcon(t), size: 20),
                      const SizedBox(width: 8),
                      Text(accountTypeLabel(l, t)),
                    ],
                  ),
                ),
            ],
            onChanged: (AccountType? v) =>
                setState(() => _type = v ?? AccountType.cash),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _balance,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: l.accInitialBalance,
              hintText: '0',
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
      ),
    );
  }
}
