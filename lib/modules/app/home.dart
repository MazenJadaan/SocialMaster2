import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_master/modules/app/pages/search_page.dart';
import 'package:social_master/modules/app/pages/home_page.dart';
import 'package:social_master/modules/app/pages/see_page.dart';
import 'package:social_master/modules/app/pages/profile_page.dart';
import 'package:social_master/modules/chat_page.dart';

import '../../shared/styles/colors.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 2;
  final screens = [
    SearchPage(),
    SeePage(),
    HomePage(),
    ProfilePage(),
    ChatPage(), ];

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
    );
  }
}
