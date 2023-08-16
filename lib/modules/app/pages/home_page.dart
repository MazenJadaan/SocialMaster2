import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_master/modules/app/handle_post/create_post.dart';
import 'package:social_master/modules/app/home_page_content/navbar.dart';
import 'package:social_master/shared/network/constant/constant.dart';
import 'package:social_master/shared/styles/colors.dart';
import '../home_page_content/tab1.dart';
import '../home_page_content/tab2.dart';
import '../notifications.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  ScrollController sc = ScrollController();
  ScrollController sc1 = ScrollController();
  ScrollController sc2 = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.backgroundColor,
      drawer: NavBar(),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          controller: sc,
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (context, value) {
            return [
              SliverAppBar(
                snap: true,
                backgroundColor: AppTheme.colors.purple,
                floating: true,
                elevation: 0.0,
                pinned: true,
                title: Image(
                    image: AssetImage(
                      AppSetting.darkMode
                          ? 'assets/images/logo_name_3.png'
                          : 'assets/images/logo_name.png',
                    ),
                    width: 120),
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CreatePost()));
                    },
                    icon: const FaIcon(
                      FontAwesomeIcons.plus,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Notifications()));
                    },
                    icon: const FaIcon(
                      FontAwesomeIcons.bell,
                      color: Colors.white,
                    ),
                  ),
                ],
                bottom: TabBar(
                  dividerColor: Colors.white,
                  labelStyle: const TextStyle(
                      fontFamily: 'SignikaNegative',
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                  indicatorWeight: 3,
                  indicatorColor: AppTheme.colors.purple,
                  tabs: [
                    GestureDetector(
                        child: const Tab(
                          text: "For you",
                        ),
                      onDoubleTap: () {
                        sc.animateTo(0,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeIn);
                      },
                    ),
                    GestureDetector(
                      child: const Tab(
                        text: "Following",
                      ),
                      onDoubleTap: () {
                        sc.animateTo(0,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeIn);
                      },
                    )
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(physics: const BouncingScrollPhysics(), children: [
            Tab1(sc),
            Tab2(sc),
          ]),
        ),
      ),
    );
  }
}
