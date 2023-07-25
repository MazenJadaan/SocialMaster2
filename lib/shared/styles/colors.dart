import 'package:flutter/cupertino.dart';

import '../network/constant/constant.dart';

@immutable
class AppColors {
  final darkPurple = AppSetting.darkMode ?
  Color(0xFFFFFFFF)
      : Color(0xff383d5d);
  final purple =AppSetting.darkMode ?
  Color(0xff383d5d)
      : Color(0xff917fb3);
  final lightPurple = const Color(0xffe5beeb);
  final whitePurple = const Color(0xffffe2ee);
  final opacityPurple= AppSetting.darkMode ?
  Color(0x40444865)
      : Color(0x40917fb3);
  final backgroundColor = AppSetting.darkMode ?
  Color(0xff10111a)
      : Color(0xFFFFFFFF);

   AppColors();
}
@immutable
class AppTheme {
  static var colors= AppColors();

}