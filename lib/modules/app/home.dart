import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:social_master/modules/app/pages/search_page.dart';
import 'package:social_master/modules/app/pages/home_page.dart';
import 'package:social_master/modules/app/pages/see_page.dart';
import 'package:social_master/modules/app/pages/profile_page.dart';
import 'package:social_master/communicate/chat/chat_page.dart';
import '../../models/connection/profile.dart';
import '../../models/usermodel.dart';
import '../../shared/network/constant/constant.dart';
import '../../shared/shared_prefrences.dart';
import '../../shared/styles/colors.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Data userData = Data();

  Future fetchProfile() async {
    var url = Uri.parse("${AppSetting.baseUrl}api/showMyProfile");
    var response = await http
        .get(url, headers: {"Authorization": "Bearer ${Prefs.getToken()}"});

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      if (json['data'] != null) {
        Data model = Data.fromJson(json['data']);
        userData = model;
        print(userData.profileInformation?.firstName);

        // LoginResponse loginResponse = LoginResponse.fromJson(data);
        // return loginResponse;
      }
      // return null;
    }
  }

  int index = 2;
  final screens = [
    SearchPage(),
    SeePage(),
    HomePage(),
    ProfilePage(),
    ChatPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserModel>(
      create: (context) => UserModel(),
      child: Consumer<UserModel>(
        builder: (context, user, child) => Scaffold(
          body: screens[index],
          bottomNavigationBar: CurvedNavigationBar(
            animationDuration: const Duration(milliseconds: 400),
            color: AppTheme.colors.purple,
            backgroundColor: Colors.transparent,
            items: [
              FaIcon(
                FontAwesomeIcons.magnifyingGlass,
                color: Colors.white,
              ),
              FaIcon(
                FontAwesomeIcons.video,
                color: Colors.white,
              ),
              FaIcon(
                FontAwesomeIcons.house,
                color: Colors.white,
              ),
              FaIcon(
                  FontAwesomeIcons.solidUser,
                  color: Colors.white,
                ),
              FaIcon(
                FontAwesomeIcons.solidMessage,
                color: Colors.white,
              ),
            ],
            index: index,
            onTap: (index) {

              this.index = index;
              setState(() {});
            },
            height: 50,
          ),
          extendBody: true,
        ),
      ),
    );
  }
}
