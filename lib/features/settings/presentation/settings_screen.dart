import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/locale/locale_cubit.dart';
import '../../../core/theme/theme_cubit.dart';
import '../../../l10n/app_localizations.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  String _languageName(AppLocalizations l, Locale? locale) =>
      switch (locale?.languageCode) {
        'kk' => l.langKazakh,
        'ru' => l.langRussian,
        _ => l.langSystem,
      };

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l = AppLocalizations.of(context);
    final Locale? current = context.watch<LocaleCubit>().state;
    final ThemeMode themeMode = context.watch<ThemeCubit>().state;
    return Scaffold(
      appBar: AppBar(title: Text(l.navSettings)),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.account_balance_wallet_outlined),
            title: Text(l.accTitle),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.go('/settings/accounts'),
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.category_outlined),
            title: Text(l.catTitle),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.go('/settings/categories'),
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.upload_file_outlined),
            title: Text(l.impTitle),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.go('/settings/import'),
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.notifications_active_outlined),
            title: Text(l.acTitle),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.go('/settings/capture'),
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.language_outlined),
            title: Text(l.setLanguage),
            subtitle: Text(_languageName(l, current)),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _pickLanguage(context, l, current),
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.brightness_6_outlined),
            title: Text(l.setTheme),
            subtitle: Text(_themeName(l, themeMode)),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _pickTheme(context, l, themeMode),
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.backup_outlined),
            title: Text(l.bkTitle),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.go('/settings/backup'),
          ),
        ],
      ),
    );
  }

  String _themeName(AppLocalizations l, ThemeMode mode) => switch (mode) {
        ThemeMode.light => l.themeLight,
        ThemeMode.dark => l.themeDark,
        ThemeMode.system => l.themeSystem,
      };

  Future<void> _pickTheme(
      BuildContext context, AppLocalizations l, ThemeMode current) async {
    final ThemeCubit cubit = context.read<ThemeCubit>();
    await showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext ctx) {
        return SafeArea(
          child: RadioGroup<ThemeMode>(
            groupValue: current,
            onChanged: (ThemeMode? v) {
              if (v == null) return;
              cubit.setMode(v);
              Navigator.pop(ctx);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                RadioListTile<ThemeMode>(
                    value: ThemeMode.system, title: Text(l.themeSystem)),
                RadioListTile<ThemeMode>(
                    value: ThemeMode.light, title: Text(l.themeLight)),
                RadioListTile<ThemeMode>(
                    value: ThemeMode.dark, title: Text(l.themeDark)),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _pickLanguage(
      BuildContext context, AppLocalizations l, Locale? current) async {
    final LocaleCubit cubit = context.read<LocaleCubit>();
    final String selected = current?.languageCode ?? 'system';
    await showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext ctx) {
        return SafeArea(
          child: RadioGroup<String>(
            groupValue: selected,
            onChanged: (String? v) {
              if (v == null) return;
              cubit.setLocale(v == 'system' ? null : Locale(v));
              Navigator.pop(ctx);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                RadioListTile<String>(
                    value: 'kk', title: Text(l.langKazakh)),
                RadioListTile<String>(
                    value: 'ru', title: Text(l.langRussian)),
                RadioListTile<String>(
                    value: 'system', title: Text(l.langSystem)),
              ],
            ),
          ),
        );
      },
    );
  }
}
