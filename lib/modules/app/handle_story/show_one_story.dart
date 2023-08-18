import 'package:flutter/material.dart';
import 'package:social_master/models/story/story_archive.dart';
import 'package:story/story_page_view.dart';
import '../../../models/story/all_following_stories.dart';
import '../../../shared/network/constant/constant.dart';
import '../../../shared/shared_preferences.dart';


class ShowOneStory extends StatefulWidget {
  ShowOneStory(this.story,{Key? key}) : super(key: key);
  UserData story;
  @override
  State<ShowOneStory> createState() => _ShowOneStoryState();
}

class _ShowOneStoryState extends State<ShowOneStory> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        StoryPageView(

          itemBuilder: (context, pageIndex, storyIndex) {
           var user = widget.story;
            var story = user.story![storyIndex];
            return Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    color: Colors.black,
                  ),),
                Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.contain,
                            image: NetworkImage('${AppSetting.baseUrl}${story.media}'),
                          )),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 42.0, left: 16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage('${AppSetting.baseUrl}${user.userProfile!.profilePhoto}'))),
                          ),
                          const SizedBox(width: 15),
                          Container(height: 40,
                            child: Column(
                              crossAxisAlignment:CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${user.firstName} ${user.lastName}',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16),
                                ),
                                const SizedBox(height: 4,),
                                Text('${story.storyDateExpire}',
                                    style: const TextStyle(color: Colors.white, fontSize: 10)),


                              ],),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text('${story.storyBody}',
                          style: const TextStyle(color: Colors.white, fontSize: 14)),
                      const SizedBox(height: 50,),
                    ],
                  ),
                )
              ],
            );
          },
          pageLength: 1,
          storyLength: (pageIndex) => widget.story.story!.length,
        ));
  }
}
