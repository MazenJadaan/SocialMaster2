import 'package:flutter/material.dart';
import 'package:social_master/modules/auth/login.dart';
import 'package:social_master/modules/auth/reset_password/reset_password.dart';
import 'package:social_master/modules/auth/signup_details.dart';
import 'package:social_master/modules/welcome/welcome_view_page.dart';
import 'package:social_master/shared/styles/colors.dart';
import 'modules/app/home.dart';
import 'modules/auth/signup.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Social Master',
      theme: ThemeData(
        appBarTheme: AppBarTheme(color:AppTheme.colors.purple ),
        primaryColor: AppTheme.colors.purple,
          primarySwatch: Colors.deepPurple,
          // primarySwatch: Colors.purple,
          ),

      home:WelcomePage(),


    );
  }
}
