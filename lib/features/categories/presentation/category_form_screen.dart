import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/di/injection.dart';
import '../../../core/enums.dart';
import '../../../core/ui/category_visuals.dart';
import '../domain/categories_repository.dart';

class CategoryFormScreen extends StatefulWidget {
  const CategoryFormScreen({super.key});

  @override
  State<CategoryFormScreen> createState() => _CategoryFormScreenState();
}

class _CategoryFormScreenState extends State<CategoryFormScreen> {
  final TextEditingController _nameRu = TextEditingController();
  final TextEditingController _nameKk = TextEditingController();
  EntryType _type = EntryType.expense;
  int _iconIndex = 0;
  int _colorIndex = 0;
  bool _saving = false;

  @override
  void dispose() {
    _nameRu.dispose();
    _nameKk.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    String ru = _nameRu.text.trim();
    String kk = _nameKk.text.trim();
    if (ru.isEmpty && kk.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Введите название категории')),
      );
      return;
    }
    // если одно из названий пустое — копируем другое
    if (ru.isEmpty) ru = kk;
    if (kk.isEmpty) kk = ru;

    setState(() => _saving = true);
    await getIt<CategoriesRepository>().createCategory(
      nameKk: kk,
      nameRu: ru,
      type: _type,
      iconCodePoint: CategoryVisuals.icons[_iconIndex].codePoint,
      colorValue: CategoryVisuals.colors[_colorIndex],
    );

    if (!mounted) return;
    if (context.canPop()) {
      context.pop();
    } else {
      context.go('/settings/categories');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color selectedColor = Color(CategoryVisuals.colors[_colorIndex]);
    return Scaffold(
      appBar: AppBar(title: const Text('Новая категория')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          SegmentedButton<EntryType>(
            segments: const <ButtonSegment<EntryType>>[
              ButtonSegment<EntryType>(
                value: EntryType.expense,
                label: Text('Расход'),
                icon: Icon(Icons.south_west),
              ),
              ButtonSegment<EntryType>(
                value: EntryType.income,
                label: Text('Доход'),
                icon: Icon(Icons.north_east),
              ),
            ],
            selected: <EntryType>{_type},
            onSelectionChanged: (Set<EntryType> s) =>
                setState(() => _type = s.first),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _nameRu,
            textCapitalization: TextCapitalization.sentences,
            decoration: const InputDecoration(
              labelText: 'Название (рус)',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _nameKk,
            textCapitalization: TextCapitalization.sentences,
            decoration: const InputDecoration(
              labelText: 'Атауы (қаз)',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          Text('Иконка', style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: 8),
          _IconPicker(
            selected: _iconIndex,
            color: selectedColor,
            onPick: (int i) => setState(() => _iconIndex = i),
          ),
          const SizedBox(height: 20),
          Text('Цвет', style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: 8),
          _ColorPicker(
            selected: _colorIndex,
            onPick: (int i) => setState(() => _colorIndex = i),
          ),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: _saving ? null : _save,
            icon: const Icon(Icons.check),
            label: const Text('Сохранить'),
          ),
        ],
      ),
    );
  }
}

class _IconPicker extends StatelessWidget {
  const _IconPicker({
    required this.selected,
    required this.color,
    required this.onPick,
  });

  final int selected;
  final Color color;
  final ValueChanged<int> onPick;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: <Widget>[
        for (int i = 0; i < CategoryVisuals.icons.length; i++)
          InkWell(
            onTap: () => onPick(i),
            borderRadius: BorderRadius.circular(24),
            child: CircleAvatar(
              radius: 24,
              backgroundColor: i == selected
                  ? color.withValues(alpha: 0.25)
                  : Theme.of(context).colorScheme.surfaceContainerHighest,
              foregroundColor: i == selected
                  ? color
                  : Theme.of(context).colorScheme.onSurfaceVariant,
              child: Icon(CategoryVisuals.icons[i]),
            ),
          ),
      ],
    );
  }
}

class _ColorPicker extends StatelessWidget {
  const _ColorPicker({required this.selected, required this.onPick});

  final int selected;
  final ValueChanged<int> onPick;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: <Widget>[
        for (int i = 0; i < CategoryVisuals.colors.length; i++)
          GestureDetector(
            onTap: () => onPick(i),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Color(CategoryVisuals.colors[i]),
                shape: BoxShape.circle,
                border: i == selected
                    ? Border.all(
                        color: Theme.of(context).colorScheme.onSurface,
                        width: 3,
                      )
                    : null,
              ),
              child: i == selected
                  ? const Icon(Icons.check, color: Colors.white, size: 20)
                  : null,
            ),
          ),
      ],
    );
  }
}
