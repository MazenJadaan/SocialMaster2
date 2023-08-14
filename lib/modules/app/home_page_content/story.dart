import 'package:flutter/material.dart';
import 'package:social_master/models/story/data.dart';
import 'package:story/story.dart';

class Story extends StatelessWidget {
  const Story({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        StoryPageView(
          itemBuilder: (context, pageIndex, storyIndex) {
            var user = dataUsers[pageIndex];
            var story = user.stories![storyIndex];
            return Stack(
              children: [
                Positioned.fill(
                    child: Container(
                      color: Colors.black,
                    )),
                Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.contain,
                            image: NetworkImage(story.mediaUrl!),
                          )),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 42.0,left: 16),
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(user.profileUrl!)
                            )
                        ),
                      ),
                      SizedBox(width: 14),
                      Text(
                        user.name!,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      ),
                    ],
                  ),
                )
              ],
            );
          },
          pageLength: dataUsers.length,
          storyLength: (pageIndex) => dataUsers[pageIndex].stories!.length,
        ));
  }
}
