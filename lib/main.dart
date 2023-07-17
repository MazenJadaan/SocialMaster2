import 'package:flutter/material.dart';
import 'package:social_master/modules/auth/login.dart';
import 'package:social_master/modules/auth/signup.dart';
import 'package:social_master/shared/shared_prefrences.dart';
import 'package:social_master/shared/styles/colors.dart';
import 'modules/app/home.dart';
import 'modules/auth/signup_details.dart';

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
        primarySwatch: Colors.deepPurple,
        // primarySwatch: Colors.purple,
      ),
      home: Home(),
    );
  }
}
