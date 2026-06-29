import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:notification_listener_service/notification_event.dart';
import 'package:notification_listener_service/notification_listener_service.dart';

import '../../../core/enums.dart';
import '../../accounts/domain/account.dart';
import '../../accounts/domain/accounts_repository.dart';
import '../../import/domain/parsed_entry.dart';
import '../../transactions/domain/transactions_repository.dart';
import 'kaspi_push_parser.dart';

/// Ловит пуш-уведомления банков (Android) и создаёт черновики операций.
/// На не-Android платформах все методы — no-op.
@lazySingleton
class NotificationCaptureService {
  NotificationCaptureService(this._parser, this._txRepo, this._accountsRepo);

  final KaspiPushParser _parser;
  final TransactionsRepository _txRepo;
  final AccountsRepository _accountsRepo;

  StreamSubscription<ServiceNotificationEvent>? _sub;

  bool get isSupported => !kIsWeb && Platform.isAndroid;

  Future<bool> isEnabled() async =>
      isSupported && await NotificationListenerService.isPermissionGranted();

  Future<bool> requestPermission() async =>
      isSupported && await NotificationListenerService.requestPermission();

  void start() {
    if (!isSupported || _sub != null) return;
    _sub = NotificationListenerService.notificationsStream.listen(_onEvent);
  }

  void stop() {
    _sub?.cancel();
    _sub = null;
  }

  Future<void> _onEvent(ServiceNotificationEvent e) async {
    if (e.hasRemoved) return;
    final String pkg = e.packageName.toLowerCase();
    if (!pkg.contains('kaspi') && !pkg.contains('halyk')) return;

    final ParsedEntry? entry = _parser.parse(
      title: e.title,
      content: e.content,
      timestamp: e.humanTime,
    );
    if (entry == null) return;

    final Set<String> existing =
        await _txRepo.findExistingHashes(<String>[entry.importHash]);
    if (existing.isNotEmpty) return;

    final List<Account> accounts = await _accountsRepo.watchAccounts().first;
    if (accounts.isEmpty) return;

    await _txRepo.createTransaction(
      accountId: accounts.first.id,
      amountMinor: entry.amountMinor,
      type: entry.type,
      date: entry.date,
      merchant: entry.description,
      note: entry.description,
      importHash: entry.importHash,
      status: TransactionStatus.draft,
      source: TransactionSource.autoPush,
    );
  }
}
