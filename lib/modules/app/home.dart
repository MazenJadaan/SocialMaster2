import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_master/modules/app/pages/search_page.dart';
import 'package:social_master/modules/app/pages/chat_page.dart';
import 'package:social_master/modules/app/pages/home_page.dart';
import 'package:social_master/modules/app/pages/notifications_page.dart';
import 'package:social_master/modules/app/pages/profile_page.dart';

import '../../shared/styles/colors.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 2;
  GlobalKey<CurvedNavigationBarState> _bottomKey = GlobalKey();
  final screens = const [
    Search_Page(),
    Chat_Page(),
    Home_Page(),
    Profile_Page(),
    Notifications_Page(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[index],
        bottomNavigationBar: CurvedNavigationBar(
          animationDuration: const Duration(milliseconds: 400),
          color: AppTheme.colors.purple,
          backgroundColor: Colors.transparent,

          items: const [
            FaIcon(
              FontAwesomeIcons.magnifyingGlass,
              color: Colors.white,
            ),
            FaIcon(
              FontAwesomeIcons.message,
              color: Colors.white,
            ),
            FaIcon(
              FontAwesomeIcons.house,
              color: Colors.white,
            ),
            FaIcon(
              FontAwesomeIcons.user,
              color: Colors.white,
            ),
            FaIcon(
              FontAwesomeIcons.bell,
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


    );
  }
}
