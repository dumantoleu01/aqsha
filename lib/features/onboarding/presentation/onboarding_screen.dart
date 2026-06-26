import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/di/injection.dart';
import '../../../core/enums.dart';
import '../../../core/locale/locale_cubit.dart';
import '../../../core/money/money.dart';
import '../../../core/router/app_router.dart';
import '../../../l10n/app_localizations.dart';
import '../../accounts/domain/accounts_repository.dart';

const String onboardedPrefKey = 'onboarded';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _balance = TextEditingController();
  bool _saving = false;

  @override
  void dispose() {
    _name.dispose();
    _balance.dispose();
    super.dispose();
  }

  Future<void> _finish(AppLocalizations l) async {
    setState(() => _saving = true);
    final String name =
        _name.text.trim().isEmpty ? l.accTypeCash : _name.text.trim();
    final double major =
        double.tryParse(_balance.text.replaceAll(',', '.').trim()) ?? 0;

    await getIt<AccountsRepository>().createAccount(
      name: name,
      type: AccountType.cash,
      currency: 'KZT',
      initialBalanceMinor: Money.fromMajor(major).minorUnits,
    );
    await getIt<SharedPreferences>().setBool(onboardedPrefKey, true);
    onboardingCompleted = true;

    if (!mounted) return;
    context.go('/dashboard');
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l = AppLocalizations.of(context);
    final String? lang = context.watch<LocaleCubit>().state?.languageCode;
    final LocaleCubit localeCubit = context.read<LocaleCubit>();

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: <Widget>[
            const SizedBox(height: 24),
            Icon(Icons.account_balance_wallet,
                size: 72, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 16),
            Text(
              l.onbWelcome,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              l.onbSubtitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 32),
            Text(l.setLanguage, style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(height: 8),
            Row(
              children: <Widget>[
                Expanded(
                  child: _LangButton(
                    label: l.langKazakh,
                    selected: lang == 'kk',
                    onTap: () => localeCubit.setLocale(const Locale('kk')),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _LangButton(
                    label: l.langRussian,
                    selected: lang == 'ru',
                    onTap: () => localeCubit.setLocale(const Locale('ru')),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),
            Text(l.onbFirstAccount,
                style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(height: 8),
            TextField(
              controller: _name,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                labelText: l.accName,
                hintText: l.accNameHint,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _balance,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: l.accInitialBalance,
                hintText: '0',
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 32),
            FilledButton(
              onPressed: _saving ? null : () => _finish(l),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(l.onbStart),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LangButton extends StatelessWidget {
  const _LangButton({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return selected
        ? FilledButton(onPressed: onTap, child: Text(label))
        : OutlinedButton(onPressed: onTap, child: Text(label));
  }
}
