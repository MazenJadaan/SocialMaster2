

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_master/communicate/calling/videoCall.dart';

import 'audioCall.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Master Calling'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
      ClipRRect(
      borderRadius: BorderRadius.circular(150.0),
      child: Image.asset(
        "assets/images/calling.png",
      height: 200.0,
      width: 200.0,
      fit: BoxFit.cover,
      ),
    ),
    Text(
    'Ahmad Hafez',
    style: Theme.of(context).textTheme.headline3,
    ),
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    IconButton(
    onPressed: () {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => videocall()));
    },
    icon: Icon(
    Icons.video_call,
    size: 44,
    ),
    color: Colors.teal,
    ),
    IconButton(
    onPressed: () {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => audiocall()));
    },
    icon: Icon(
    Icons.phone,
    size: 35,
    ),
    color: Colors.teal,
    ),
    ],
    ),
    ),
    ],
    ),
    );
  }
}
