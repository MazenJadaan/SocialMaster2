import 'package:flutter/material.dart';
import 'package:social_master/communicate/calling/HomeScreen.dart';
import 'package:social_master/modules/auth/login.dart';
import 'package:social_master/modules/welcome/welcome_view_page.dart';

import 'package:social_master/shared/shared_preferences.dart';
import 'package:social_master/shared/styles/colors.dart';
import 'modules/app/home.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Social Master',
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: AppTheme.colors.purple),
        primaryColor: AppTheme.colors.purple,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple).copyWith(background: AppTheme.colors.backgroundColor),
          canvasColor: AppTheme.colors.backgroundColor

        // primarySwatch: Colors.purple,
      ),
      home:
     Prefs.getToken() ==null|| Prefs.getToken()=='' ?( Prefs.getFirtTime()==true ? Login(): WelcomePage()) :Home(),
    );
  }
}
