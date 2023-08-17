import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:social_master/modules/app/pages/search_pages/user_model.dart';

import '../../../../shared/network/constant/constant.dart';
import '../../../../shared/shared_preferences.dart';

class FetchUserList {
  List<Userlist> results = [];
  List<Data> data = [];

  Future<List<Data>> getuserList({String? query}) async {
    var url = Uri.parse("${AppSetting.baseUrl}${AppSetting.searchUsers}");

    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      "Authorization": "Bearer ${Prefs.getToken()}"
    };
    final jsonString = json.encode({'name': query});
    var response = await http.post(url, body: jsonString, headers: headers);
    print(response.body.toString());
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      if (json['data'] != null) {
        data = <Data>[];
        json['data'].forEach((v) {
          data.add(new Data.fromJson(v));
        });
        print(data.length);
      }
    }
    return data;
  }
}

class FetchPostList {
  List<Userlist> results = [];
  List<Data> data = [];

  Future<List<Userlist>> getuserList({String? query}) async {
    var url = Uri.parse("${AppSetting.baseUrl}${AppSetting.searchUsers}");
    {
      final headers = {
        HttpHeaders.contentTypeHeader: 'application/json',
        "Authorization": "Bearer ${Prefs.getToken()}"
      };
      final jsonString = json.encode({'name': query});
      var response = await http.post(url, body: jsonString, headers: headers);
      print(response.body.toString());
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        if (json['data'] != null) {
          data = <Data>[];
          json['data'].forEach((v) {
            data.add(new Data.fromJson(v));
          });
          print(data.length);
        }
      }
      return results;
    }
  }
}
