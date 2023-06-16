import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_master/shared/styles/colors.dart';
import '../home_page_content/tab1.dart';
import '../home_page_content/tab2.dart';
import '../navigations.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  ScrollController sc =ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            controller: sc ,
            physics: const BouncingScrollPhysics(),
            headerSliverBuilder: (context, value) {
              return [
                SliverAppBar(
                  backgroundColor: AppTheme.colors.purple,
                  floating: true,
                  elevation: 0.0,
                  pinned: true,
                  leading: IconButton(
                    icon: const FaIcon(FontAwesomeIcons.bars),
                    onPressed: () {

                    },
                  ),
                  title:  const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(image: AssetImage('assets/images/logo_name.png',),width: 125),
                        //Text("Master",style: TextStyle(fontSize: 40,fontFamily: 'Cairo',color: Colors.black),),
                        SizedBox(width: 8,),
                        //Icon(Icons.phone_in_talk)
                      ],
                    )
                  ),
                  actions:  [
                  IconButton(
                    onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Navigations()));},
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
