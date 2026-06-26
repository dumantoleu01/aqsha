import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Настройки')),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.account_balance_wallet_outlined),
            title: const Text('Счета'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.go('/settings/accounts'),
          ),
          const Divider(height: 1),
          const ListTile(
            leading: Icon(Icons.language_outlined),
            title: Text('Язык'),
            subtitle: Text('Скоро: қазақша / русский'),
            enabled: false,
          ),
          const ListTile(
            leading: Icon(Icons.backup_outlined),
            title: Text('Резервная копия'),
            subtitle: Text('Скоро'),
            enabled: false,
          ),
        ],
      ),
    );
  }
}
