import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/user_model.dart';

class StorageService {
  static const String _boxName = 'userBox';
  static const String _userKey = 'user';
  static const String _loginKey = 'isLoggedIn';
  static const String _darkKey = 'isDarkMode';
  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(_boxName);
  }

  static Box get _box => Hive.box(_boxName);
  static Future<void> saveUser(UserModel user) async {
    await _box.put(_userKey, user.toMap());
  }

  static UserModel? getUser() {
    final data = _box.get(_userKey);
    if (data == null) return null;
    return UserModel.fromMap(Map<String, dynamic>.from(data));
  }

  static Future<void> setLoggedIn(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_loginKey, value);
  }

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_loginKey) ?? false;
  }

  static Future<void> logout() async {
    await setLoggedIn(false);
  }

  static Future<void> setDarkMode(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_darkKey, value);
  }

  static Future<bool> isDarkMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_darkKey) ?? false;
  }
}
