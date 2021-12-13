import 'package:shared_preferences/shared_preferences.dart';

class SharedManager {
  static SharedManager? _instance = null;
  SharedPreferences? _preferences = null;

  SharedManager._();

  static SharedManager get instance {
    _instance ??= SharedManager._();
    return _instance!;
  }

  static Future<void> init() async {
    if (SharedManager.instance._preferences != null) {
      return;
    }
    SharedManager.instance._preferences = await SharedPreferences.getInstance();
    var keyList = SharedManager.instance._preferences!.getKeys().toList();
  }

  Future<bool> setString(String key, String value) async {
    return _preferences!.setString(key.toString(), value);
  }

  Future<bool> setBool(String key, bool value) async {
    return _preferences!.setBool(key.toString(), value);
  }

  Future<bool> setInt(String key, int value) async {
    return _preferences!.setInt(key.toString(), value);
  }

  Future<bool> setStringList(String key, List<String> value) async {
    return _preferences!.setStringList(key.toString(), value);
  }

  String? getString(String key) {
    return _preferences!.getString(key.toString());
  }

  String? getCachedData(String key) {
    return _preferences!.getString(key);
  }

  bool? getBool(String key) {
    return _preferences!.getBool(key.toString());
  }

  int? getInt(String key) {
    return _preferences!.getInt(key.toString());
  }

  List<String>? getStringList(String key) {
    return _preferences!.getStringList(key.toString());
  }

  Future<bool> delete(String key) {
    return _preferences!.remove(key.toString());
  }

  Future<bool> clearAll() {
    return _preferences!.clear();
  }

  Future<bool> setCacheDataLog(String key, int value) async {
    return _preferences!.setInt(key, value);
  }
}

enum SharedKey { EMAIL, TOKEN, USER, FAVORITE_LIST, MUSIC_DATA, AD_DATA,STATION}
