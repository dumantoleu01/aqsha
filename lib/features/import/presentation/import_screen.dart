import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../../core/di/injection.dart';
import '../../../core/ui/category_visuals.dart';
import '../../../l10n/app_localizations.dart';
import '../../accounts/domain/account.dart';
import '../../accounts/domain/accounts_repository.dart';
import '../../categories/domain/categories_repository.dart';
import '../../categories/domain/category.dart';
import '../../transactions/domain/transactions_repository.dart';
import '../data/category_matcher.dart';
import '../data/statement_text_extractor.dart';
import '../domain/parsed_entry.dart';
import '../domain/statement_parser.dart';

class _Row {
  _Row({
    required this.entry,
    required this.categoryId,
    required this.isDuplicate,
    required this.include,
  });

  final ParsedEntry entry;
  int? categoryId;
  final bool isDuplicate;
  bool include;
}

class ImportScreen extends StatefulWidget {
  const ImportScreen({super.key});

  @override
  State<ImportScreen> createState() => _ImportScreenState();
}

class _ImportScreenState extends State<ImportScreen> {
  List<Account> _accounts = <Account>[];
  List<Category> _categories = <Category>[];
  Account? _account;
  List<_Row>? _rows;
  bool _busy = false;
  String? _error;
  String? _rawText; // извлечённый текст PDF (для диагностики, если не распознали)

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

  Future<void> _pickAndParse(AppLocalizations l) async {
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      final FilePickerResult? picked = await FilePicker.pickFiles(
        type: FileType.custom,
        allowedExtensions: <String>['pdf'],
        withData: true,
      );
      if (picked == null || picked.files.isEmpty) {
        setState(() => _busy = false); // отмена выбора
        return;
      }
      final PlatformFile file = picked.files.single;
      List<int>? bytes = file.bytes;
      // на части платформ bytes пустой — читаем по пути
      if (bytes == null && file.path != null) {
        bytes = await File(file.path!).readAsBytes();
      }
      if (bytes == null) {
        setState(() {
          _busy = false;
          _error = l.impEmpty;
        });
        return;
      }
      final String text = getIt<StatementTextExtractor>()
          .extractFromPdf(Uint8List.fromList(bytes));
      final List<ParsedEntry> entries = getIt<StatementParser>().parse(text);
      final Set<String> existing = await getIt<TransactionsRepository>()
          .findExistingHashes(
              entries.map((ParsedEntry e) => e.importHash).toList());

      setState(() {
        _busy = false;
        _rawText = text;
        _rows = entries.map((ParsedEntry e) {
          final bool dup = existing.contains(e.importHash);
          return _Row(
            entry: e,
            categoryId: suggestCategoryId(e.description, _categories),
            isDuplicate: dup,
            include: !dup,
          );
        }).toList();
      });
    } catch (e) {
      setState(() {
        _busy = false;
        _error = e.toString();
      });
    }
  }

  Future<void> _import(AppLocalizations l) async {
    final Account? account = _account;
    final List<_Row>? rows = _rows;
    if (account == null || rows == null) return;
    setState(() => _busy = true);
    final TransactionsRepository repo = getIt<TransactionsRepository>();
    int count = 0;
    for (final _Row r in rows.where((_Row r) => r.include)) {
      await repo.createTransaction(
        accountId: account.id,
        categoryId: r.categoryId,
        amountMinor: r.entry.amountMinor,
        type: r.entry.type,
        date: r.entry.date,
        note: r.entry.description,
        importHash: r.entry.importHash,
      );
      count++;
    }
    if (!mounted) return;
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(l.impImported(count))));
    if (context.canPop()) {
      context.pop();
    } else {
      context.go('/dashboard');
    }
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l = AppLocalizations.of(context);
    final List<_Row>? rows = _rows;
    final int includeCount =
        rows?.where((_Row r) => r.include).length ?? 0;

    return Scaffold(
      appBar: AppBar(title: Text(l.impTitle)),
      body: Column(
        children: <Widget>[
          if (_accounts.isNotEmpty)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: DropdownButtonFormField<Account>(
                initialValue: _account,
                decoration: InputDecoration(
                  labelText: l.fieldAccount,
                  border: const OutlineInputBorder(),
                ),
                items: <DropdownMenuItem<Account>>[
                  for (final Account a in _accounts)
                    DropdownMenuItem<Account>(value: a, child: Text(a.name)),
                ],
                onChanged: (Account? a) => setState(() => _account = a),
              ),
            ),
          if (_error != null)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(_error!,
                  style: TextStyle(color: Theme.of(context).colorScheme.error)),
            ),
          Expanded(child: _body(l, rows)),
        ],
      ),
      bottomNavigationBar: rows != null && rows.isNotEmpty
          ? SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: FilledButton.icon(
                  onPressed: (_busy || _account == null || includeCount == 0)
                      ? null
                      : () => _import(l),
                  icon: const Icon(Icons.download_done),
                  label: Text(l.impImport(includeCount)),
                ),
              ),
            )
          : null,
    );
  }

  Widget _body(AppLocalizations l, List<_Row>? rows) {
    if (_busy && rows == null) {
      return const Center(child: CircularProgressIndicator());
    }
    if (rows == null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Icon(Icons.picture_as_pdf_outlined, size: 64),
              const SizedBox(height: 16),
              Text(l.impHint, textAlign: TextAlign.center),
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: _busy ? null : () => _pickAndParse(l),
                icon: const Icon(Icons.upload_file),
                label: Text(l.impPickFile),
              ),
            ],
          ),
        ),
      );
    }
    if (rows.isEmpty) {
      final String raw = (_rawText ?? '').trim();
      return ListView(
        padding: const EdgeInsets.all(24),
        children: <Widget>[
          Text(l.impEmpty, textAlign: TextAlign.center),
          const SizedBox(height: 16),
          Center(
            child: OutlinedButton(
              onPressed: () => _pickAndParse(l),
              child: Text(l.impPickFile),
            ),
          ),
          const SizedBox(height: 24),
          // Диагностика: показываем извлечённый текст, чтобы настроить парсер.
          Text(l.impRawHint, style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              onPressed: raw.isEmpty
                  ? null
                  : () {
                      Clipboard.setData(ClipboardData(text: raw));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(l.impCopied)),
                      );
                    },
              icon: const Icon(Icons.copy, size: 18),
              label: Text(l.impCopyText),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(12),
            ),
            child: SelectableText(
              raw.isEmpty
                  ? '— (PDF не содержит читаемого текста — возможно, это скан/картинка)'
                  : (raw.length > 4000 ? raw.substring(0, 4000) : raw),
              style: const TextStyle(fontFamily: 'monospace', fontSize: 12),
            ),
          ),
        ],
      );
    }
    final String lang = Localizations.localeOf(context).languageCode;
    return ListView.separated(
      itemCount: rows.length,
      separatorBuilder: (_, _) => const Divider(height: 1),
      itemBuilder: (BuildContext context, int i) =>
          _RowTile(row: rows[i], categories: _categories, lang: lang, l: l,
              onChanged: () => setState(() {})),
    );
  }
}

class _RowTile extends StatelessWidget {
  const _RowTile({
    required this.row,
    required this.categories,
    required this.lang,
    required this.l,
    required this.onChanged,
  });

  final _Row row;
  final List<Category> categories;
  final String lang;
  final AppLocalizations l;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final List<Category> ofType = categories
        .where((Category c) => c.type == row.entry.type)
        .toList();
    final String sign = row.entry.isExpense ? '− ' : '+ ';
    final Color amountColor =
        row.entry.isExpense ? scheme.error : const Color(0xFF2E7D32);

    return Opacity(
      opacity: row.include ? 1 : 0.5,
      child: ListTile(
        leading: Checkbox(
          value: row.include,
          onChanged: (bool? v) {
            row.include = v ?? false;
            onChanged();
          },
        ),
        title: Text(row.entry.description, maxLines: 1,
            overflow: TextOverflow.ellipsis),
        subtitle: Row(
          children: <Widget>[
            if (row.isDuplicate)
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Text('• ${l.impDuplicate}',
                    style: TextStyle(color: scheme.error)),
              ),
            Flexible(
              child: DropdownButton<int?>(
                value: row.categoryId,
                isDense: true,
                isExpanded: true,
                hint: Text(l.fieldCategory),
                items: <DropdownMenuItem<int?>>[
                  DropdownMenuItem<int?>(
                      value: null, child: Text('— ${l.fieldCategory}')),
                  for (final Category c in ofType)
                    DropdownMenuItem<int?>(
                      value: c.id,
                      child: Row(
                        children: <Widget>[
                          Icon(CategoryVisuals.iconFromCodePoint(c.iconCodePoint),
                              size: 16),
                          const SizedBox(width: 6),
                          Flexible(child: Text(c.localizedName(lang))),
                        ],
                      ),
                    ),
                ],
                onChanged: (int? v) {
                  row.categoryId = v;
                  onChanged();
                },
              ),
            ),
          ],
        ),
        trailing: Text(
          '$sign${row.entry.amount.format()}',
          style: TextStyle(color: amountColor, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
