import 'package:encrypt/encrypt.dart';

class Encryption {
  static const String _key = 'my_secret';
  static const String _iv = 'my_iv';

  static String encrypt(String value) {
    final encryptedText =
        Encrypter(AES(Key.fromUtf8(_key))).encrypt(value, iv: IV.fromUtf8(_iv));
    return encryptedText.base64;
  }

  static String decrypt(String value) {
    final decryptedText = Encrypter(AES(Key.fromUtf8(_key)))
        .decrypt(Encrypted.fromBase64(value), iv: IV.fromUtf8(_iv));
    return decryptedText;
  }
}
