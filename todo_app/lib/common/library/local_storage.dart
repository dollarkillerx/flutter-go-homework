import 'dart:convert';


import '../../models/user.dart';
import 'local_storage_service.dart';

class LocalStorage {
  static String _cloudrevegoJwt = "cloudrevego_token";
  static String _cloudrevegoConf = "cloudrevego_conf";
  static StorageService _storage = StorageService();

  static setVal(String key, String val) async {
    await _storage.setString(key, val);
  }

  static String? getVal(String key) {
    return _storage.getString(key);
  }

  static setUrl(String url) async {
    await _storage.setString("url", url);
  }
  static String? getUrl() {
    return _storage.getString("url");
  }

  static setJWT(String jwt) async {
    await _storage.setString(_cloudrevegoJwt, jwt);
  }

  static String? getJWT() {
    return _storage.getString(_cloudrevegoJwt);
  }

  static delJWT() async {
    await _storage.remove(_cloudrevegoJwt);
  }

  static setUserInfo(UserData data) async {
    final jsonStr = jsonEncode(data.toJson());
    await _storage.setString("user_info", jsonStr);
  }

  static UserData? getUserInfo() {
    final jsonStr = _storage.getString("user_info");
    if (jsonStr == null) return null;

    return UserDataMapper.fromJson(jsonStr);
  }
}