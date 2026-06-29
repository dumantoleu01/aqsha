import 'package:injectable/injectable.dart';

import '../domain/sync_service.dart';

/// Временная реализация синка в памяти (не персистится между запусками).
///
/// TODO: заменить на SupabaseSyncService, когда появятся URL + anon key.
/// Тогда снимок будет храниться в таблице `family_snapshots`
/// (family_id PK, blob text, updated_at) с RLS по членству в семье.
@LazySingleton(as: SyncService)
class InMemorySyncService implements SyncService {
  final Map<String, String> _store = <String, String>{};

  @override
  Future<void> pushSnapshot({
    required String familyId,
    required String encryptedBlob,
  }) async {
    _store[familyId] = encryptedBlob;
  }

  @override
  Future<String?> pullSnapshot({required String familyId}) async {
    return _store[familyId];
  }
}
