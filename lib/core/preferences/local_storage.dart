import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static final LocalStorage _instance = LocalStorage._internal();
  static SharedPreferences? _sharedPreferences;

  LocalStorage._internal();

  factory LocalStorage() {
    _initialize();
    return _instance;
  }

  static Future<void> _initialize() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
  }

  Future<void> saveString(String key, String value) async {
    await _sharedPreferences?.setString(key, value);
  }

  String? getString(String key) {
    return _sharedPreferences?.getString(key);
  }

  Future<void> saveInt(String key, int value) async {
    await _sharedPreferences?.setInt(key, value);
  }

  int? getInt(String key) {
    return _sharedPreferences?.getInt(key);
  }

  Future<void> saveDouble(String key, double value) async {
    await _sharedPreferences?.setDouble(key, value);
  }

  double? getDouble(String key) {
    return _sharedPreferences?.getDouble(key);
  }

  Future<void> saveBool(String key, bool value) async {
    await _sharedPreferences?.setBool(key, value);
  }

  bool? getBool(String key) {
    return _sharedPreferences?.getBool(key);
  }

  Future<void> remove(String key) async {
    await _sharedPreferences?.remove(key);
  }

  Future<void> clear() async {
    await _sharedPreferences?.clear();
  }
}
