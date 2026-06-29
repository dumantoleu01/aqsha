import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:cryptography/cryptography.dart';
import 'package:injectable/injectable.dart';

/// E2E-шифрование данных семьи.
///
/// Ключ выводится из парольной фразы (PBKDF2-HMAC-SHA256), данные шифруются
/// AES-GCM-256. Сервер хранит только результат [encrypt] — расшифровать без
/// парольной фразы нельзя.
@lazySingleton
class FamilyCrypto {
  final AesGcm _aes = AesGcm.with256bits();
  static const int _iterations = 100000;

  Future<String> encrypt(String plaintext, String passphrase) async {
    final Uint8List salt = _randomBytes(16);
    final SecretKey key = await _deriveKey(passphrase, salt);
    final SecretBox box = await _aes.encrypt(
      utf8.encode(plaintext),
      secretKey: key,
    );
    return jsonEncode(<String, dynamic>{
      'v': 1,
      'salt': base64Encode(salt),
      'nonce': base64Encode(box.nonce),
      'mac': base64Encode(box.mac.bytes),
      'ct': base64Encode(box.cipherText),
    });
  }

  /// Бросает исключение, если парольная фраза неверна (проверка MAC).
  Future<String> decrypt(String envelope, String passphrase) async {
    final Map<String, dynamic> env =
        jsonDecode(envelope) as Map<String, dynamic>;
    final List<int> salt = base64Decode(env['salt'] as String);
    final SecretKey key = await _deriveKey(passphrase, salt);
    final SecretBox box = SecretBox(
      base64Decode(env['ct'] as String),
      nonce: base64Decode(env['nonce'] as String),
      mac: Mac(base64Decode(env['mac'] as String)),
    );
    final List<int> clear = await _aes.decrypt(box, secretKey: key);
    return utf8.decode(clear);
  }

  Future<SecretKey> _deriveKey(String passphrase, List<int> salt) {
    final Pbkdf2 pbkdf2 = Pbkdf2(
      macAlgorithm: Hmac.sha256(),
      iterations: _iterations,
      bits: 256,
    );
    return pbkdf2.deriveKey(
      secretKey: SecretKey(utf8.encode(passphrase)),
      nonce: salt,
    );
  }

  Uint8List _randomBytes(int n) {
    final Random r = Random.secure();
    return Uint8List.fromList(List<int>.generate(n, (_) => r.nextInt(256)));
  }
}
