//import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:social_master/modules/app/pages/profile_page.dart';

import '../saved_posts.dart';

class NavBar extends StatelessWidget {
    NavBar({super.key});

  final screens =  [
    ProfilePage(),
    SavedPosts(),
  ];

  get index => 2;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Aya'),
            accountEmail:const Text('yoyo@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(child:
              Image.asset('images/user-profile.png'),),
            ),
            decoration:const BoxDecoration(
              color:  Color(0xff917fb3),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.person,color: Colors.purple,),
            title: Text('My Profile'),
            trailing: Icon(Icons.chevron_right),
          ),
          const Divider(thickness: 1,),
          const ListTile(
            leading: Icon(Icons.favorite,color: Colors.purple,),
            title: Text('My Favorite'),
            trailing: Icon(Icons.chevron_right),
          ),
          const Divider(thickness: 1,),
          const ListTile(
            leading: Icon(Icons.language,color: Colors.purple,),
            title: Text('Language'),
            trailing: Icon(Icons.chevron_right),
          ),
          const Divider(thickness: 1,),
          const ListTile(
            leading: Icon(Icons.mode_edit,color: Colors.purple,),
            title: Text('Theming'),
            trailing: Icon(Icons.chevron_right),
          ),
          const Divider(thickness: 1,),
          const ListTile(
            leading: Icon(Icons.logout,color: Colors.purple,),
            title: Text('Logout',),
            trailing: Icon(Icons.chevron_right),),

          // index: index,
          // onTap: (index) {
          //   this.index = index;
          //   setState(() {});

        ],
      ),
    );
  }
}