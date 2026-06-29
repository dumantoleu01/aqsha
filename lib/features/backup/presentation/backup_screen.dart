import 'dart:convert';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/di/injection.dart';
import '../../../l10n/app_localizations.dart';
import '../data/backup_service.dart';

class BackupScreen extends StatefulWidget {
  const BackupScreen({super.key});

  @override
  State<BackupScreen> createState() => _BackupScreenState();
}

class _BackupScreenState extends State<BackupScreen> {
  bool _busy = false;

  Future<void> _export(AppLocalizations l) async {
    setState(() => _busy = true);
    try {
      final String json = await getIt<BackupService>().exportJson();
      final Uint8List bytes = Uint8List.fromList(utf8.encode(json));
      final String stamp = DateTime.now().toIso8601String().split('T').first;
      final String? path = await FilePicker.saveFile(
        fileName: 'aqsha-backup-$stamp.json',
        bytes: bytes,
        type: FileType.custom,
        allowedExtensions: <String>['json'],
      );
      if (!mounted) return;
      if (path != null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(l.bkExported)));
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _import(AppLocalizations l) async {
    final FilePickerResult? picked = await FilePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: <String>['json'],
      withData: true,
    );
    final List<int>? bytes = picked?.files.single.bytes;
    if (bytes == null || !mounted) return;

    final bool ok = await showDialog<bool>(
          context: context,
          builder: (BuildContext ctx) => AlertDialog(
            title: Text(l.bkImport),
            content: Text(l.bkRestoreConfirm),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(ctx, false),
                child: Text(l.cancel),
              ),
              FilledButton(
                onPressed: () => Navigator.pop(ctx, true),
                child: Text(l.bkRestore),
              ),
            ],
          ),
        ) ??
        false;
    if (!ok) return;

    setState(() => _busy = true);
    try {
      final BackupSummary summary =
          await getIt<BackupService>().restoreJson(utf8.decode(bytes));
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l.bkRestored(summary.total))),
      );
      context.go('/dashboard');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(l.bkTitle)),
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.ios_share),
                title: Text(l.bkExport),
                subtitle: Text(l.bkExportHint),
                onTap: _busy ? null : () => _export(l),
              ),
              const Divider(height: 1),
              ListTile(
                leading: const Icon(Icons.restore),
                title: Text(l.bkImport),
                subtitle: Text(l.bkImportHint),
                onTap: _busy ? null : () => _import(l),
              ),
            ],
          ),
          if (_busy)
            const ColoredBox(
              color: Color(0x55000000),
              child: Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }
}
