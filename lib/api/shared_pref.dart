import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePrefrences {
  static SharedPreferences? _preferences;

  static const _keyUserEmail = 'email';
  static const _keyUserPassword = 'password';
  static const _keyRemember = 'remember';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUserEmail(String email) async =>
      await _preferences!.setString(_keyUserEmail, email);

  static Future setUserPassword(String password) async =>
      await _preferences!.setString(_keyUserPassword, password);

  static Future setRemember(bool remember) async =>
      await _preferences!.setBool(_keyRemember, remember);

  static String? getUserEmail() =>
      _preferences!.getString(_keyUserEmail) as dynamic;

  static String? getUserPassword() =>
      _preferences!.getString(_keyUserPassword) as dynamic;

  static bool? getRemember() => _preferences!.getBool(_keyRemember) as dynamic;
}
