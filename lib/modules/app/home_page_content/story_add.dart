import 'package:flutter/material.dart';
import 'package:social_master/models/story/data.dart';
import 'package:social_master/modules/app/home.dart';
import 'package:social_master/modules/app/home_page_content/story.dart';
import 'package:story/story.dart';

class StoryAdd extends StatelessWidget {
  const StoryAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: Text('واجهة بدنا نحط فيا انشاء القصة',style: TextStyle(fontSize: 40),))
        );
  }
}
