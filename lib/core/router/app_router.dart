import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/accounts/presentation/account_form_screen.dart';
import '../../features/accounts/presentation/accounts_screen.dart';
import '../../features/budgets/presentation/budget_form_screen.dart';
import '../../features/budgets/presentation/budgets_screen.dart';
import '../../features/categories/presentation/categories_screen.dart';
import '../../features/categories/presentation/category_form_screen.dart';
import '../../features/dashboard/presentation/dashboard_screen.dart';
import '../../features/settings/presentation/settings_screen.dart';
import '../../features/transactions/presentation/transaction_form_screen.dart';
import '../../features/transactions/presentation/transactions_screen.dart';
import 'app_shell.dart';

/// Корневой роутер: ShellRoute с нижней навигацией на 4 ветки.
final GoRouter appRouter = GoRouter(
  initialLocation: '/dashboard',
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder: (BuildContext context, GoRouterState state,
              StatefulNavigationShell navigationShell) =>
          AppShell(navigationShell: navigationShell),
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/dashboard',
              builder: (BuildContext context, GoRouterState state) =>
                  const DashboardScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/transactions',
              builder: (BuildContext context, GoRouterState state) =>
                  const TransactionsScreen(),
              routes: <RouteBase>[
                GoRoute(
                  path: 'new',
                  builder: (BuildContext context, GoRouterState state) =>
                      const TransactionFormScreen(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/budgets',
              builder: (BuildContext context, GoRouterState state) =>
                  const BudgetsScreen(),
              routes: <RouteBase>[
                GoRoute(
                  path: 'new',
                  builder: (BuildContext context, GoRouterState state) =>
                      const BudgetFormScreen(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/settings',
              builder: (BuildContext context, GoRouterState state) =>
                  const SettingsScreen(),
              routes: <RouteBase>[
                GoRoute(
                  path: 'accounts',
                  builder: (BuildContext context, GoRouterState state) =>
                      const AccountsScreen(),
                  routes: <RouteBase>[
                    GoRoute(
                      path: 'new',
                      builder: (BuildContext context, GoRouterState state) =>
                          const AccountFormScreen(),
                    ),
                  ],
                ),
                GoRoute(
                  path: 'categories',
                  builder: (BuildContext context, GoRouterState state) =>
                      const CategoriesScreen(),
                  routes: <RouteBase>[
                    GoRoute(
                      path: 'new',
                      builder: (BuildContext context, GoRouterState state) =>
                          const CategoryFormScreen(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
