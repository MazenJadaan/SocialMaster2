import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_master/modules/app/handle_story/all_following_story.dart';
import 'package:social_master/shared/network/constant/constant.dart';

import '../../../models/story/all_following_stories.dart';
import 'show_one_story.dart';
import '../../../shared/styles/colors.dart';

class SmallStory extends StatefulWidget {
   SmallStory(this.users,this.index,{Key? key}) : super(key: key);
  List <UserData> users;

  int index;

  @override
  State<SmallStory> createState() => _SmallStoryState();
}

class _SmallStoryState extends State<SmallStory> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15,left: 5,right: 5),
      child: GestureDetector(
        onTap: (){
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ShowOneStory(widget.users[widget.index])));
        },
        onLongPress: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AllFollowingStories(widget.users)));
        },
        child: Column(
          children: [

                  Stack(
                    alignment: Alignment.center,
                    children:[
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Image(
                          height: 140,
                          width: 90,
                          image: NetworkImage(
                            '${AppSetting.baseUrl}${widget.users[widget.index].story!.first.media}',
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        child: Center(
                          child: CircleAvatar(
                            radius: 27,
                            backgroundColor: AppTheme.colors.purple,
                            child: CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage('${AppSetting.baseUrl}${widget.users[widget.index].userProfile!.profilePhoto!}'),
            ),
                          ),
                        ),
                      ),
                    ]
                  ),
            Container(
              width: 80,
              child: Text('${widget.users[widget.index].firstName} ${widget.users[widget.index].lastName}',
                  style: TextStyle(
                      fontFamily: 'SignikaNegative',
                      fontSize: 12,
                      color: AppTheme.colors.darkPurple,
                      fontWeight: FontWeight.bold),
                  overflow:TextOverflow.ellipsis,
                  maxLines: 2),
            ),
          ],
        ),
      ),
    );
  }
}

