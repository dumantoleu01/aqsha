/// Транспорт для обмена зашифрованными снимками семьи.
///
/// Сервер видит только зашифрованный блоб (E2E). Реализация на Supabase
/// подключается, когда будут URL + ключи; пока — [InMemorySyncService].
abstract interface class SyncService {
  /// Загружает зашифрованный снимок семьи (last-write-wins).
  Future<void> pushSnapshot({
    required String familyId,
    required String encryptedBlob,
  });

  /// Возвращает последний зашифрованный снимок семьи или null.
  Future<String?> pullSnapshot({required String familyId});
}
