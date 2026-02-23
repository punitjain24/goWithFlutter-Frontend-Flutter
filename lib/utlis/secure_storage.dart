import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static const _storage = FlutterSecureStorage();
  static const tokenKey = "auth_token";
  static const _refreshTokenKey = "refresh_token";

static Future<void> saveValue(String key , String value)async{
  return _storage.write(key: key, value: value);
}

static Future<String?> getValue(String key)async{
  return await _storage.read(key: key);
}
static Future<void> clearData()async{
  return await _storage.deleteAll();
}

}