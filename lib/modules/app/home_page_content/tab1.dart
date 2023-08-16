import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_master/shared/components/components.dart';
import 'package:social_master/shared/components/no_posts_yet.dart';
import '../../../models/connection/home_page/foryou_posts.dart';
import '../../../models/provider/post/postmodel.dart';
import '../../../shared/components/post_component/post_component.dart';
import '../../../shared/network/constant/constant.dart';
import '../../../shared/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Tab1 extends StatefulWidget {
  Tab1(this.scrollController, {Key? key}) : super(key: key);
  final ScrollController scrollController;

  @override
  State<Tab1> createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {

  List<PostModel>? posts=<PostModel>[];
  List<Data>? data;
  bool loading = true;

  Future forYouPosts() async {
    var url = Uri.parse("${AppSetting.baseUrl}${AppSetting.forYouPageApi}");
    var response = await http
        .get(url, headers: {"Authorization": "Bearer ${Prefs.getToken()}"});

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      if (json['data'] != null) {
        data = <Data>[];
        json['data'].forEach((v) {
          data!.add( Data.fromJson(v));
        });
        loading = false;
        setState(() {});




        for (int i = 0; i < data!.length; i++) {
          List<String> images = [];
          for(int j=0; j<data![i].photo!.length;j++){
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
            userProfileId: data![i].user!.userProfile!.userId,
            userId: data![i].user!.id,
            userFName: data![i].user!.firstName,
            userLName: data![i].user!.lastName,
            userImage: data![i].user!.userProfile!.profilePhoto,
          ));
        }
      }
    }
  }

  @override
  void initState() {
    forYouPosts();
    super.initState();
    // Add code after super
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? myCircularProgressIndicator()
        : Scaffold(
            body: RefreshIndicator(
              onRefresh: () async {
                posts=[];
                setState(() {
                  forYouPosts();
                });

              },
              child:posts!.isEmpty?noPostsYet(): SingleChildScrollView(
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
              ),
            ),
          );
  }
}

Future refresh() async {
  print('refresh');
}
