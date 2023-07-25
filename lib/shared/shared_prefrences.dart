import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static SharedPreferences? prefs;

  static const keyToken = 'token';
  static const keyFirstTime = 'first_time';
  static const keyAppTheme = 'apptheme';



  static Future init() async => prefs = await SharedPreferences.getInstance();



  static setToken(String? token) => prefs!.setString(keyToken, token!);
  static String? getToken() => prefs!.getString(keyToken);

  static setFirstTime(bool? f)=> prefs!.setBool(keyFirstTime, f!);
  static bool? getFirtTime()=> prefs!.getBool(keyFirstTime);


  static setAppTheme(bool? appTheme)=> prefs!.setBool(keyAppTheme, appTheme!);
  static bool? getAppTheme()=> prefs!.getBool(keyAppTheme);


}
