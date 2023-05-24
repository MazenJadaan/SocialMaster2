import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../shared/styles/colors.dart';

class ObscureModel extends ChangeNotifier {
  bool obscure1 = true;
  FaIcon icon1 = FaIcon(
    FontAwesomeIcons.eye,
    color: AppTheme.colors.purple,
    size: 19,
  );
  bool obscure2 = true;
  FaIcon icon2 = FaIcon(
    FontAwesomeIcons.eye,
    color: AppTheme.colors.purple,
    size: 19,
  );
  bool obscure3 = true;
  FaIcon icon3 = FaIcon(
    FontAwesomeIcons.eye,
    color: AppTheme.colors.purple,
    size: 19,
  );

  dosomething1() {
    if(obscure1==true){
      icon1 = FaIcon(FontAwesomeIcons.eyeSlash, color: AppTheme.colors.purple,size: 19,);}
    else {
      icon1 = FaIcon(FontAwesomeIcons.eye, color: AppTheme.colors.purple,size: 19,);
    }
    obscure1 = !obscure1;

    notifyListeners();
  }

  dosomething2() {
    if(obscure2==true){
      icon2 = FaIcon(FontAwesomeIcons.eyeSlash, color: AppTheme.colors.purple,size: 19,);}
    else {
      icon2 = FaIcon(FontAwesomeIcons.eye, color: AppTheme.colors.purple,size: 19,);
    }
    obscure2 = !obscure2;


    notifyListeners();
  }

  dosomething3() {

    if(obscure3==true){
         icon3 = FaIcon(FontAwesomeIcons.eyeSlash, color: AppTheme.colors.purple,size: 19,);}
    else {
      icon3 = FaIcon(FontAwesomeIcons.eye, color: AppTheme.colors.purple,size: 19,);
    }
    obscure3 = !obscure3;
    notifyListeners();
  }
}
