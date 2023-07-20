

import 'package:flutter/material.dart';
import 'package:social_master/modules/app/pages/profile_page.dart';
import 'package:social_master/shared/styles/colors.dart';

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
            backgroundColor:  Colors.transparent,
              child: ClipOval(child:
              Image.asset('assets/images/user-profile.png'),),
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
            leading: Icon(Icons.archive,color: Colors.purple,),
            title: Text('My Archive'),
            trailing: Icon(Icons.chevron_right),
          ),
          const Divider(thickness: 1,),
          const ListTile(
            leading: Icon(Icons.star,color: Colors.purple,),
            title: Text('Account Verification'),
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
            trailing: Icon(Icons.toggle_off_outlined,color: Colors.purple,),
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