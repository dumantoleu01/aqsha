import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/di/injection.dart';
import '../../../core/enums.dart';
import '../domain/account.dart';
import 'cubit/accounts_cubit.dart';
import 'cubit/accounts_state.dart';

class AccountsScreen extends StatelessWidget {
  const AccountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AccountsCubit>(
      create: (_) => getIt<AccountsCubit>(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Счета')),
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.go('/settings/accounts/new'),
          child: const Icon(Icons.add),
        ),
        body: BlocBuilder<AccountsCubit, AccountsState>(
          builder: (BuildContext context, AccountsState state) => switch (state) {
            AccountsLoading() =>
              const Center(child: CircularProgressIndicator()),
            AccountsLoaded(:final List<Account> accounts) => accounts.isEmpty
                ? const _EmptyAccounts()
                : ListView.separated(
                    itemCount: accounts.length,
                    separatorBuilder: (_, _) => const Divider(height: 1),
                    itemBuilder: (BuildContext context, int i) =>
                        _AccountTile(account: accounts[i]),
                  ),
          },
        ),
      ),
    );
  }
}

class _AccountTile extends StatelessWidget {
  const _AccountTile({required this.account});

  final Account account;

  @override
  Widget build(BuildContext context) {
    final Color color = account.balance.isNegative
        ? Theme.of(context).colorScheme.error
        : Theme.of(context).colorScheme.onSurface;
    return ListTile(
      leading: CircleAvatar(child: Icon(accountTypeIcon(account.type))),
      title: Text(account.name),
      subtitle: Text(accountTypeLabel(account.type)),
      trailing: Text(
        account.balance.format(),
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(color: color, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _EmptyAccounts extends StatelessWidget {
  const _EmptyAccounts();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Text(
          'Пока нет счетов.\nНажмите + чтобы добавить первый.',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

IconData accountTypeIcon(AccountType type) => switch (type) {
      AccountType.cash => Icons.payments,
      AccountType.card => Icons.credit_card,
      AccountType.savings => Icons.savings,
    };

String accountTypeLabel(AccountType type) => switch (type) {
      AccountType.cash => 'Наличные',
      AccountType.card => 'Карта',
      AccountType.savings => 'Накопления',
    };
