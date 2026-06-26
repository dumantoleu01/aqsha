import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/di/injection.dart';
import '../../../core/enums.dart';
import '../../../core/ui/category_visuals.dart';
import '../domain/category.dart';
import 'cubit/categories_cubit.dart';
import 'cubit/categories_state.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoriesCubit>(
      create: (_) => getIt<CategoriesCubit>(),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Категории'),
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(text: 'Расходы'),
                Tab(text: 'Доходы'),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => context.go('/settings/categories/new'),
            child: const Icon(Icons.add),
          ),
          body: BlocBuilder<CategoriesCubit, CategoriesState>(
            builder: (BuildContext context, CategoriesState state) =>
                switch (state) {
              CategoriesLoading() =>
                const Center(child: CircularProgressIndicator()),
              CategoriesLoaded(:final List<Category> categories) => TabBarView(
                  children: <Widget>[
                    _CategoryList(
                      items: categories
                          .where((Category c) => c.type == EntryType.expense)
                          .toList(),
                    ),
                    _CategoryList(
                      items: categories
                          .where((Category c) => c.type == EntryType.income)
                          .toList(),
                    ),
                  ],
                ),
            },
          ),
        ),
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList({required this.items});

  final List<Category> items;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const Center(child: Text('Пока нет категорий'));
    }
    final String lang = Localizations.localeOf(context).languageCode;
    return ListView.separated(
      itemCount: items.length,
      separatorBuilder: (_, _) => const Divider(height: 1),
      itemBuilder: (BuildContext context, int i) {
        final Category c = items[i];
        final Color color = CategoryVisuals.colorFrom(
          c.colorValue,
          fallback: Theme.of(context).colorScheme.primary,
        );
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: color.withValues(alpha: 0.18),
            foregroundColor: color,
            child: Icon(CategoryVisuals.iconFromCodePoint(c.iconCodePoint)),
          ),
          title: Text(c.localizedName(lang)),
          trailing: IconButton(
            icon: const Icon(Icons.delete_outline),
            tooltip: 'Удалить',
            onPressed: () => _confirmArchive(context, c),
          ),
        );
      },
    );
  }

  Future<void> _confirmArchive(BuildContext context, Category c) async {
    final CategoriesCubit cubit = context.read<CategoriesCubit>();
    final bool? ok = await showDialog<bool>(
      context: context,
      builder: (BuildContext ctx) => AlertDialog(
        title: const Text('Удалить категорию?'),
        content: Text(c.localizedName(
            Localizations.localeOf(context).languageCode)),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Отмена'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Удалить'),
          ),
        ],
      ),
    );
    if (ok ?? false) {
      await cubit.archive(c.id);
    }
  }
}
