import 'package:flutter/cupertino.dart';

class Obscure_Model extends ChangeNotifier {
bool obscure1=true;
bool obscure2=true;
bool obscure3=true;
dosomething1 (){
  obscure1= !obscure1;
  notifyListeners();
}
dosomething2 (){
  obscure2= !obscure2;
  notifyListeners();
}
dosomething3 (){
  obscure3= !obscure3;
  notifyListeners();
}
}