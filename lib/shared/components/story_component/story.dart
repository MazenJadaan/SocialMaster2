import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_master/shared/network/constant/constant.dart';

import '../../../models/story/data.dart';
import '../../../modules/app/home_page_content/story.dart';
import '../../styles/colors.dart';

class SmallStory extends StatefulWidget {
   SmallStory(this.story,{Key? key}) : super(key: key);
   StoryData story;
  @override
  State<SmallStory> createState() => _SmallStoryState();
}

class _SmallStoryState extends State<SmallStory> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: MaterialButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ShowStory(widget.story,)));
        },
        child: Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage('${AppSetting.baseUrl}${widget.story.userProfile!.profilePhoto!}'),
            ),
            Text('${widget.story.firstName} ${widget.story.lastName}',
                style: TextStyle(
                    fontFamily: 'SignikaNegative',
                    fontSize: 17,
                    color: AppTheme.colors.darkPurple,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

Widget smallStory({
  required BuildContext context,
  required StoryData story,
}) {
  return Padding(
    padding: const EdgeInsets.only(top: 15),
    child: MaterialButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ShowStory(story)));
      },
      child: CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(''),
      ),
    ),
  );
}
