import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static SharedPreferences? _preferences ;
  static const _keyUsername = 'userName';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUname(String uname) async =>
      await _preferences?.setString(_keyUsername, uname);

  static String? getUname() => _preferences?.getString(_keyUsername);
}