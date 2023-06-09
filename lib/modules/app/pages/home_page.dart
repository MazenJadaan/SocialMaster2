import 'package:flutter/material.dart';
import 'package:social_master/modules/app/pages/navbar.dart';
import 'package:social_master/shared/styles/colors.dart';
import '../home_page_tabs/tab1.dart';
import '../home_page_tabs/tab2.dart';

class Home_Page extends StatelessWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     drawer: const NavBar(),
        body: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder: (context, value) {
              return [
                SliverAppBar(
                  backgroundColor: AppTheme.colors.purple,
                  floating: true,
                  elevation: 0.0,
                  pinned: true,
                  title: const Center(
                    child: Image(
                      height: 30,
                      image: AssetImage('assets/images/logo_name.png'),
                    ),
                  ),
                  actions: const [
                    SizedBox(
                      width: 55,
                    ),
                  ],
                  bottom: TabBar(
                    dividerColor: Colors.white,
                    labelStyle: const TextStyle(
                        fontFamily: 'SignikaNegative',
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                    indicatorWeight: 3,
                    indicatorColor: AppTheme.colors.darkPurple,
                    tabs: const [
                      Tab(text: "For you"),
                      Tab(
                        text: "Follow",
                      )
                    ],
                  ),
                ),
              ];
            },
            body:  const TabBarView(children: [

              Tab1(),
              Tab2(),
            ]),
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   elevation: 0.0,
        //   backgroundColor: AppTheme.colors.purple,
        //   onPressed: () {},
        //   child: const FaIcon(FontAwesomeIcons.plus),
        // ),
      );
  }
}
