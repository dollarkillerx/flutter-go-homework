import 'local_storage_service.dart';

class LocalStorage {
  static String _komiJwt = "wx_sf_jwt";
  static String _komiToken = "wx_sf_token";
  static String _komiUserInfo = "wx_sf_userInfo";
  static StorageService _storage = StorageService();

  static setVal(String key, String val) async {
    await _storage.setString(key, val);
  }

  static String? getVal(String key) {
    return _storage.getString(key);
  }

  static setJWT(String jwt) async {
    print("setJWT: $jwt");
    await _storage.setString(_komiJwt, jwt);
  }

  static String? getJWT() {
    return _storage.getString(_komiJwt);
  }

  static delJWT() async {
    await _storage.remove(_komiJwt);
  }

  static setToken(String jwt) async {
    await _storage.setString(_komiToken, jwt);
  }

  static String? getToken() {
    return _storage.getString(_komiToken);
  }

  static delToken() async {
    await _storage.remove(_komiToken);
  }


}