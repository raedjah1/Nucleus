import 'package:nucleus/shared/core/encryption.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  final SharedPreferences _sharedPreferences;

  LocalStorage(this._sharedPreferences);

  Future<void> save(String key, String value) async {
    final encryptedData = Encryption.encrypt(value);
    await _sharedPreferences.setString(key, encryptedData);
  }

  String? read(String key) {
    final encryptedData = _sharedPreferences.getString(key);
    if (encryptedData == null) return null;
    return Encryption.decrypt(encryptedData);
  }

  Future<void> delete(String key) async {
    await _sharedPreferences.remove(key);
  }

  Future<void> clear() async {
    await _sharedPreferences.clear();
  }
}
