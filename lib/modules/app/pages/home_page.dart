import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_master/modules/home_page_tabs/tab1.dart';
import 'package:social_master/modules/home_page_tabs/tab2.dart';
import 'package:social_master/shared/styles/colors.dart';

class Home_Page extends StatelessWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                 leading: IconButton(
                   icon: const FaIcon(FontAwesomeIcons.bars),
                   onPressed: () {},
                 ),
                  title: const Center(
                    child: Image(
                        height: 30,
                        image: AssetImage('assets/images/logo_name.png'),
                      ),
                  ),

                  actions: const [
                  SizedBox(width: 40,),

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
                        text: "follow",
                      )
                    ],
                  ),
                ),
              ];
            },
            body: const TabBarView(children: [
              Tab1(),
              Tab2(),
            ]),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 0.0,
          backgroundColor: AppTheme.colors.purple,
          onPressed: () {},
          child: const FaIcon(FontAwesomeIcons.plus),
        ));
  }
}
