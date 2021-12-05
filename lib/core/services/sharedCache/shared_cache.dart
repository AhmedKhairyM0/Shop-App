import 'package:shared_preferences/shared_preferences.dart';

class SharedCache {
  SharedCache._internal();
  static SharedCache? shared;
  factory SharedCache() {
    return shared ??= SharedCache._internal();
  }
  static late final SharedPreferences _sharedPreferences;
  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<bool> saveData(String key, dynamic value) async {
    if (value is bool) return await _sharedPreferences.setBool(key, value);
    if (value is double) return await _sharedPreferences.setDouble(key, value);
    if (value is int) return await _sharedPreferences.setInt(key, value);
    return await _sharedPreferences.setString(key, value);
  }

  getData(String key) => _sharedPreferences.get(key);

  // SharedPreferences Keys
  static const String skipOnboarding = 'skipOnboarding';
  static const String token = 'token';
  static const String isDark = 'isDark';
}
