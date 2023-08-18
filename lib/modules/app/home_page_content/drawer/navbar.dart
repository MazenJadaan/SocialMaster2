import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:social_master/modules/app/handle_story/story_archive.dart';
import 'package:social_master/modules/app/pages/profile_page/profile_page.dart';
import 'package:social_master/shared/styles/colors.dart';

import '../../../../shared/network/constant/constant.dart';
import '../../../../shared/shared_preferences.dart';
import '../../../auth/login.dart';
import 'saved_posts.dart';

class NavBar extends StatelessWidget {
  NavBar({super.key});

  get index => 2;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('${Prefs.getUserName()}'),
            accountEmail: null,
            currentAccountPicture: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.transparent,
              child: ClipOval(
                child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage('${AppSetting.baseUrl}${Prefs.getProfileImage()}'),
                  width: 200,
                  height: 200,
                )
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
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ProfilePage()));
            },
          ),
          const SizedBox(height: 8),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.solidBookmark,
              color: AppTheme.colors.darkPurple,
            ),
            title: Text(
              'Saved Posts',
              style: TextStyle(color: AppTheme.colors.darkPurple),
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => SavedPosts()));
            },
          ),
          const SizedBox(height: 8),
          ListTile(
            leading: Icon(
              Icons.archive,
              color: AppTheme.colors.darkPurple,
            ),
            title: Text(
              'My Story Archive',
              style: TextStyle(color: AppTheme.colors.darkPurple),
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ShowStoryArchive()));
            },
          ),
          const SizedBox(height: 8),
           ListTile(
            leading: Icon(
              Icons.star,
              color: AppTheme.colors.darkPurple,
            ),
            title: Text('Account Verification'),
            trailing: Icon(Icons.chevron_right),
          ),
          const SizedBox(height: 8),
           ListTile(
            leading: Icon(
              Icons.language,
              color: AppTheme.colors.darkPurple,
            ),
            title: Text('Language'),
            trailing: Icon(Icons.chevron_right),
          ),
          const SizedBox(height: 8),
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
                onChanged: (bool state) {
                  // setState(() {});
                },
                onTap: () {
                  // setState(() {});
                },
                onDoubleTap: () {},
                onSwipe: () {},
              )),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => buildLogout(context: context));
            },
            child: const ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.purple,
              ),
              title: Text(
                'Logout',
              ),
              trailing: Icon(Icons.chevron_right),
            ),
          ),
        ],
      ),
    );
  }
}

buildLogout({required BuildContext context}) => AlertDialog(
      content: Container(
        height: 80,
        child: Column(
          children: [
            Text(
              'Are you sure to Logout?',
              style: TextStyle(fontSize: 20, color: AppTheme.colors.darkPurple),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    child: Text(
                      'yes',
                      style: TextStyle(
                          fontSize: 18, color: AppTheme.colors.darkPurple),
                    ),
                    onPressed: () {
                      Prefs.setToken('');
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => Login()),
                          (route) => false);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Container(
                      height: 30,
                      width: 1,
                      color: AppTheme.colors.darkPurple,
                    ),
                  ),
                  TextButton(
                      child: Text(
                        'cancel',
                        style: TextStyle(
                            fontSize: 18, color: AppTheme.colors.darkPurple),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
