import 'package:flutter/material.dart';
import 'package:social_master/shared/styles/colors.dart';

class IsMale extends ChangeNotifier {
  bool? isMale;
  Color maleColor = AppTheme.colors.opacityPurple;
  Color maleTextColor = Colors.grey;
  Color femaleColor = AppTheme.colors.opacityPurple;
  Color femaleTextColor = Colors.grey;

  dosomething() {
    isMale!
        ? maleColor = AppTheme.colors.purple
        : maleColor = AppTheme.colors.opacityPurple;

    isMale! ? maleTextColor = Colors.white : maleTextColor = Colors.grey;

    isMale!
        ? femaleColor = AppTheme.colors.opacityPurple
        : femaleColor = AppTheme.colors.purple;

    isMale! ? femaleTextColor = Colors.grey : femaleTextColor = Colors.white;

    notifyListeners();
  }
}
