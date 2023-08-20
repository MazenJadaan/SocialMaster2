import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_master/modules/app/handle_story/story_add.dart';
import 'package:social_master/shared/components/components.dart';
import '../../../models/connection/home_page/foryou_posts.dart';
import '../../../models/provider/post/postmodel.dart';
import '../../../models/story/all_following_stories.dart';
import '../../../models/story/story_archive.dart';
import '../../../shared/components/post_component/post_component.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../handle_story/story.dart';
import '../../../shared/network/constant/constant.dart';
import '../../../shared/shared_preferences.dart';

class Tab2 extends StatefulWidget {
  Tab2(this.scrollController, {Key? key}) : super(key: key);
  ScrollController scrollController;

  @override
  State<Tab2> createState() => _Tab2State();
}

class _Tab2State extends State<Tab2> {


  List<PostModel>? posts = <PostModel>[];
  List<Data>? data;
  bool loading = true;

  Future fetchFollowingPost() async {
    var url = Uri.parse("${AppSetting.baseUrl}${AppSetting.followingPost}");
    var response = await http
        .get(url, headers: {"Authorization": "Bearer ${Prefs.getToken()}"});

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      if (json['data'] != null) {
        data = <Data>[];
        json['data'].forEach((v) {
          data!.add(new Data.fromJson(v));
        });


        for (int i = 0; i < data!.length; i++) {
          List<String> images = [];
          for (int j = 0; j < data![i].photo!.length; j++) {
            images.add(data![i].photo![j].photoPath!);
          }
          posts!.add(PostModel(
            caption: data![i].postBody,
            postId: data![i].id,
            video: data![i].postVideo,
            date: data![i].postDate,
            isLiked: data![i].reaction == 0 ? false : true,
            isSaved: data![i].saved == 0 ? false : true,
            likes: data![i].likeCount,
            comments: data![i].commentCount,
            shares: data![i].sharePostCount,
            images: images,
            userId: data![i].user!.id,
            userFName: data![i].user!.firstName,
            userLName: data![i].user!.lastName,
            userImage: data![i].user!.userProfile!.profilePhoto,
          ));
        }
        loading = false;
        setState(() {});
      }
    }
  }



  List<UserData>? usersData = <UserData>[];


  List<SmallStory> stories = <SmallStory>[];
  UserData? myData;
  bool loadingStory = true;


  Future showFollowingStory() async {
    var url = Uri.parse("${AppSetting.baseUrl}${AppSetting.showFollwingStoryApi}");
    var response = await http
        .get(url, headers: {"Authorization": "Bearer ${Prefs.getToken()}"});

    if (response.statusCode == 200) {
      print('yes');
      final json = jsonDecode(response.body);

      if (json['data'] != null) {
        usersData = <UserData>[];
        json['data'].forEach((v) {
          usersData!.add(new UserData.fromJson(v));
        });



        for(int i=0 ;i<usersData!.length;i++){
          stories.add(SmallStory(usersData!,i));
        }

        loadingStory = false;
        setState(() {});
      }
    }
  }

  @override
  void initState() {
    showFollowingStory();
    fetchFollowingPost();
    super.initState();
    // Add code after super
  }

  @override
  Widget build(BuildContext context) {
    return
      loading && loadingStory
        ?
        myCircularProgressIndicator()
        :
    Scaffold(
            body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: MaterialButton(
                          child:Container(
                            decoration: BoxDecoration(
                              color: Color(0xffe0e0e0),
                              borderRadius: BorderRadius.circular(20)
                            ),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            height: 140,width: 90,
                            child: const Center(
                              child: Icon(
                                Icons.add,
                                size: 60,
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => StoryAdd()));
                            setState(() {});
                          },
                        ),
                      ),
                      Row(
                        children:stories,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      ListView.builder(
                          padding: const EdgeInsets.all(0.0),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: posts!.length,
                          itemBuilder: (context, i) =>
                              ChangeNotifierProvider<PostModel>.value(
                                value: posts![i],
                                child: Consumer<PostModel>(
                                  builder: (context, model, child) =>
                                      postBuilder(
                                          model: model, context: context),
                                ),
                              )),

                      const SizedBox(
                        height: 55,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ));
  }
}
