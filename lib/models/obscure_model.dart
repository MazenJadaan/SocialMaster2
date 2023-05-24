import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../shared/styles/colors.dart';


class ObscureModel extends ChangeNotifier {
  bool obscure1 = true;
  Icon icon1 =
      Icon(Icons.remove_red_eye_outlined, color: AppTheme.colors.purple);
  bool obscure2 = true;
  bool obscure3 = true;

  dosomething1() {
    obscure1 = !obscure1;
    icon1 == Icon(Icons.remove_red_eye_outlined, color: AppTheme.colors.purple)
        ? icon1 = Icon(Icons.remove_red_eye, color: AppTheme.colors.purple)
        : icon1 =
            Icon(Icons.remove_red_eye_outlined, color: AppTheme.colors.purple);
    notifyListeners();
  }

  dosomething2() {
    obscure2 = !obscure2;
    notifyListeners();
  }

  dosomething3() {
    obscure3 = !obscure3;
    notifyListeners();
  }
}
