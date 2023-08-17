import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../../../shared/network/constant/constant.dart';
import '../../../shared/shared_preferences.dart';

Future deletePost({required String postId})async{
  var url = Uri.parse("${AppSetting.baseUrl}${AppSetting.deletePostApi}$postId");
  var response = await http.delete(url,headers:  {"Authorization": "Bearer ${Prefs.getToken()}"});

  if (response.statusCode == 200) {
    Fluttertoast.showToast(
        msg: "your post has been deleted",
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.black54,
        timeInSecForIosWeb: 2,
        fontSize: 16);
  }

}