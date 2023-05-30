import 'package:flutter/material.dart';

import 'package:social_master/modules/auth/login.dart';

import 'modules/auth/Signup.dart';


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

          // primarySwatch: Colors.purple,
          ),
      home: Signup(),
    );
  }
}
