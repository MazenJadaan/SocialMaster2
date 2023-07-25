import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:social_master/modules/app/pages/profile_page.dart';
import 'package:social_master/shared/styles/colors.dart';

import '../../../shared/network/constant/constant.dart';
import '../saved_posts.dart';

class NavBar extends StatelessWidget {
  NavBar({super.key});

  final screens = [
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
            accountEmail: const Text('yoyo@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: ClipOval(
                child: Image.asset('assets/images/user-profile.png'),
              ),
            ),
            decoration: BoxDecoration(
              color: AppTheme.colors.purple,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              color: AppTheme.colors.darkPurple,
            ),
            title: Text(
              'My Profile',
              style: TextStyle(color: AppTheme.colors.darkPurple),
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ProfilePage()));
            },
          ),
          const Divider(
            thickness: 1,
          ),
           ListTile(
            leading: Icon(
             FontAwesomeIcons.solidBookmark,
              color: AppTheme.colors.darkPurple,
            ),
            title: Text('Saved Posts',style: TextStyle(color: AppTheme.colors.darkPurple),),
            trailing: Icon(Icons.chevron_right),
          ),
          const Divider(
            thickness: 1,
          ),
           ListTile(
            leading: Icon(
              Icons.archive,
              color: AppTheme.colors.darkPurple,
            ),
            title: Text('My Story Archive',style: TextStyle(color: AppTheme.colors.darkPurple),),
            trailing: Icon(Icons.chevron_right),
          ),
          const Divider(
            thickness: 1,
          ),
          const ListTile(
            leading: Icon(
              Icons.star,
              color: Colors.purple,
            ),
            title: Text('Account Verification'),
            trailing: Icon(Icons.chevron_right),
          ),
          const Divider(
            thickness: 1,
          ),
          const ListTile(
            leading: Icon(
              Icons.language,
              color: Colors.purple,
            ),
            title: Text('Language'),
            trailing: Icon(Icons.chevron_right),
          ),
          const Divider(
            thickness: 1,
          ),
          ListTile(
              leading: Icon(
                FontAwesomeIcons.moon,
                color: AppTheme.colors.darkPurple,
              ),
              title: Text(
                'App theme',
                style: TextStyle(color: AppTheme.colors.darkPurple),
              ),
              trailing: LiteRollingSwitch(
                value: AppSetting.darkMode,
                textOn: 'dark',
                textOff: 'light',
                colorOn: Colors.grey,
                colorOff: Colors.amber,
                iconOn: FontAwesomeIcons.moon,
                iconOff: FontAwesomeIcons.sun,
                onChanged: (bool State) {
                  // setState(() {});
                },
                onTap: () {
                  // setState(() {});
                },
                onDoubleTap: () {},
                onSwipe: () {},
              )),
          const Divider(
            thickness: 1,
          ),
          const ListTile(
            leading: Icon(
              Icons.logout,
              color: Colors.purple,
            ),
            title: Text(
              'Logout',
            ),
            trailing: Icon(Icons.chevron_right),
          ),

          // index: index,
          // onTap: (index) {
          //   this.index = index;
          //   setState(() {});
        ],
      ),
    );
  }
}
