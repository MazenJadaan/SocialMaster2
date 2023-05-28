import 'package:flutter/cupertino.dart';

@immutable
class AppColors {
  final darkPurple = const Color(0xff383d5d);
  final purple = const Color(0xff917fb3);
  final lightPurple = const Color(0xffe5beeb);
  final whitePurple = const Color(0xffffe2ee);
  final opacityPurple= const Color(0x40917fb3);

  const AppColors();
}
@immutable
class AppTheme {
  static const colors= AppColors();

}