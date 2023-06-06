import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Aya'),
            accountEmail:const Text('yoyo@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(child: Image.asset('images/user-profile.png')),
            ),
            decoration:const BoxDecoration(
              color: Colors.purple,
            ),
          ),
          const ListTile(
            leading: Icon(Icons.person),
            title: Text('My Profile'),
          ),
          const ListTile(
            leading: Icon(Icons.favorite),
            title: Text('My Favorite'),
          ),
          const ListTile(
            leading: Icon(Icons.language),
            title: Text('Language'),
          ),
          const ListTile(
            leading: Icon(Icons.mode_edit),
            title: Text('Theming'),
          ),
          const ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
          ),
        ],
      ),
    );
  }
}