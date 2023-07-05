import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_master/modules/app/create_post.dart';
import 'package:social_master/modules/app/home_page_content/navbar.dart';
import 'package:social_master/shared/styles/colors.dart';
import '../home_page_content/tab1.dart';
import '../home_page_content/tab2.dart';
import '../notifications.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  ScrollController sc =ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
        body: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            controller: sc ,
            physics: const BouncingScrollPhysics(),
            headerSliverBuilder: (context, value) {
              return [
                SliverAppBar(snap: true,
                  backgroundColor: AppTheme.colors.purple,
                  floating: true,
                  elevation: 0.0,
                  pinned: true,
                  // leading: IconButton(
                  //   icon: const FaIcon(FontAwesomeIcons.bars),
                  //   onPressed: () {
                  //
                  //   },
                  // ),
                  title:   const Center(
                    child: Image(image: AssetImage('assets/images/logo_name.png',),width: 125)
                  ),
                  actions:  [
                  IconButton(
                    onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CreatePost()));},
                    icon: const FaIcon(
                      FontAwesomeIcons.plus,
                      color: Colors.white,
                    ),
                  ),
                    IconButton(
                      onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Notifications()));},
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
                    tabs: const [
                      Tab(text: "For you"),
                      Tab(text: "Following",)
                    ],
                  ),
                ),
              ];
            },
            body:  TabBarView(
                physics: BouncingScrollPhysics(),
                children: [
              Tab1(sc),
              Tab2(sc),
            ]),
          ),
        ),

      );
  }
}
