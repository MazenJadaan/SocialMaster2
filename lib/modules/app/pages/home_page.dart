import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_master/shared/styles/colors.dart';
import '../home_page_tabs/tab1.dart';
import '../home_page_tabs/tab2.dart';

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
                  title:  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Master",style: TextStyle(fontSize: 40,fontFamily: 'Cairo',color: Colors.black),),
                        SizedBox(width: 8,),
                        Icon(Icons.phone_in_talk)
                      ],
                    )
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
                    indicatorColor: AppTheme.colors.purple,
                    tabs: const [
                      Tab(text: "For you"),
                      Tab(
                        text: "Following",
                      )
                    ],
                  ),
                ),
              ];
            },
            body:  TabBarView(
                physics: BouncingScrollPhysics(),
                children: [

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
