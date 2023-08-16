import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_master/modules/app/home_page_content/story.dart';
import 'package:social_master/modules/app/home_page_content/story_add.dart';
import 'package:social_master/shared/components/components.dart';
import 'package:social_master/shared/components/story_component/story.dart';
import '../../../models/connection/home_page/foryou_posts.dart';
import '../../../models/provider/post/postmodel.dart';
import '../../../models/story/data.dart';
import '../../../shared/components/post_component/post_component.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../shared/network/constant/constant.dart';
import '../../../shared/shared_preferences.dart';

class Tab2 extends StatefulWidget {
  Tab2(this.scrollController, {Key? key}) : super(key: key);
  ScrollController scrollController;

  @override
  State<Tab2> createState() => _Tab2State();
}

class _Tab2State extends State<Tab2> {
  List<PostModel> posts = [
    PostModel(
        likes: 400,
        comments: 12,
        shares: 3,
        caption: 'caption',
        date: '30/12/2019',
        userFName: 'Habibi',
        userLName: 'wallah',
        images: [
          'https://mymodernmet.com/wp/wp-content/uploads/2021/12/kristina-makeeva-eoy-photo-1.jpeg'
        ],
        userImage:
            'https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg',
        isLiked: true,
        isSaved: false),
  ];

  List<PostModel>? aaposts = <PostModel>[];
  List<Data>? data;
  bool loading = true;

  Future followingPost() async {
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
        loading = false;
        setState(() {});

        for (int i = 0; i < data!.length; i++) {
          List<String> images = [];
          for (int j = 0; j < data![i].photo!.length; j++) {
            images.add(data![i].photo![j].photoPath!);
          }
          aaposts!.add(PostModel(
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
      }
    }
  }



  List<StoryData>? storyData = <StoryData>[];


  List<SmallStory> sStory = <SmallStory>[];

  bool loadingStory = true;

  Future showFollowingStory() async {
    print(Prefs.getToken());
    var url = Uri.parse("${AppSetting.baseUrl}${AppSetting.showFollwingStory}");
    var response = await http
        .get(url, headers: {"Authorization": "Bearer ${Prefs.getToken()}"});

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      if (json['data'] != null) {
        storyData = <StoryData>[];
        json['data'].forEach((v) {
          storyData!.add(new StoryData.fromJson(v));
        });



        for(int i=0 ;i<storyData!.length;i++){
          sStory.add(SmallStory(storyData![i]));
        }

        loadingStory = false;
        setState(() {});
      }
    }
  }

  @override
  void initState() {
    showFollowingStory();
    // followingPost();
    super.initState();
    // Add code after super
  }

  @override
  Widget build(BuildContext context) {
    return
      // loading &&loadingStory
      //   ?
      //   myCircularProgressIndicator()
        // :
    Scaffold(
            body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: MaterialButton(
                          child: Icon(
                            Icons.add,
                            size: 60,
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
                        children: sStory,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      ListView.builder(
                          padding: const EdgeInsets.all(0.0),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: aaposts!.length,
                          itemBuilder: (context, i) =>
                              ChangeNotifierProvider<PostModel>.value(
                                value: aaposts![i],
                                child: Consumer<PostModel>(
                                  builder: (context, model, child) =>
                                      postBuilder(
                                          model: model, context: context),
                                ),
                              )),
                      // ChangeNotifierProvider<SharedPostModel>.value(
                      //   value: s,
                      //   child: Consumer<SharedPostModel>(
                      //     builder: (context, model, child) =>
                      //         sharedPostBuilder(model: model, context: context),
                      //   ),
                      // ),
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
