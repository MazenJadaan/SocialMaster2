import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static SharedPreferences? prefs;

  static const keyToken = 'token';

  static Future init() async => prefs = await SharedPreferences.getInstance();

  static setToken(String? token) => prefs!.setString(keyToken, token!);

  static String? getToken() => prefs!.getString(keyToken);
}
