import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  SharedPrefHelper._(); // Private constructor to prevent instantiation

  static late SharedPreferences _prefs;

  // Initialize SharedPreferences
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Save a value
  static Future<void> setString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  static Future<void> setBool(String key, bool value) async {
    await _prefs.setBool(key, value);
  }

  static Future<void> setInt(String key, int value) async {
    await _prefs.setInt(key, value);
  }

  // Get a value
  static String? getString(String key) {
    return _prefs.getString(key);
  }

  static bool? getBool(String key) {
    return _prefs.getBool(key);
  }

  static int? getInt(String key) {
    return _prefs.getInt(key);
  }

  // Remove a value
  static Future<void> remove(String key) async {
    await _prefs.remove(key);
  }
}
