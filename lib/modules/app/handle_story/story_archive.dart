import 'package:flutter/material.dart';
import 'package:social_master/models/story/story_archive.dart';
import 'package:social_master/shared/components/components.dart';
import 'package:social_master/shared/network/constant/constant.dart';
import 'package:story/story.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../shared/shared_preferences.dart';

class ShowStoryArchive extends StatefulWidget {
  const ShowStoryArchive({Key? key}) : super(key: key);

  @override
  State<ShowStoryArchive> createState() => _ShowStoryArchiveState();
}

class _ShowStoryArchiveState extends State<ShowStoryArchive> {
  List<Story> myStories = <Story>[];
  bool loading = true;


  Future fetchMyStoriesArchive()async{
    var url = Uri.parse("${AppSetting.baseUrl}${AppSetting.storyArchiveApi}");
    var response = await http
        .get(url, headers: {"Authorization": "Bearer ${Prefs.getToken()}"});

     if(response.statusCode==200){
       final json = jsonDecode(response.body);
       if (json['data'] != null) {
         json['data'].forEach((v) {
           myStories.add(new Story.fromJson(v));
         });
         loading=false;
         setState(() {});
       }
       print('done');
     }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchMyStoriesArchive();
  }

  @override
  Widget build(BuildContext context) {
    return loading?myCircularProgressIndicator():Scaffold(
        body: StoryPageView(
      itemBuilder: (context, pageIndex, storyIndex) {
        var story = myStories[storyIndex];
        return Stack(
          children: [
            Positioned.fill(
              child: Container(
                color: Colors.black,
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: NetworkImage('${AppSetting.baseUrl}${story.media}'),
                  ),
                ),
              ),
            ),
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
                                image: NetworkImage('${AppSetting.baseUrl}${Prefs.getProfileImage()}'))),
                      ),
                      const SizedBox(width: 15),
                      Container(height: 40,
                        child: Column(
                          crossAxisAlignment:CrossAxisAlignment.start,
                          children: [
                          Text(
                            Prefs.getUserName()!,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          ),
                          const SizedBox(height: 4,),
                          Text('${story.storyTime}',
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
      storyLength: (pageIndex) => myStories.length,
    ));
  }
}
