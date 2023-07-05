import 'package:flutter/material.dart';
import 'package:social_master/modules/app/saved_posts.dart';
import 'package:social_master/modules/app/home.dart';
import 'package:social_master/shared/styles/colors.dart';

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
        appBarTheme: AppBarTheme(color: AppTheme.colors.purple),
        primaryColor: AppTheme.colors.purple,
        primarySwatch: Colors.deepPurple,
        // primarySwatch: Colors.purple,
      ),
      home: Home(),
    );
  }
}
