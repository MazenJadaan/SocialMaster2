import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_master/shared/components/no_posts_yet.dart';
import '../../models/connection/saved_posts.dart';
import '../../models/provider/post/postmodel.dart';
import '../../shared/components/components.dart';
import '../../shared/components/post_component/post_component.dart';
import '../../shared/network/constant/constant.dart';
import '../../../shared/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SavedPosts extends StatefulWidget {
  SavedPosts({Key? key}) : super(key: key);

  @override
  State<SavedPosts> createState() => _SavedPostsState();
}

class _SavedPostsState extends State<SavedPosts> {
  List<PostModel>? posts = <PostModel>[];

  List<Data>? data;

  bool loading = true;

  Future fetchSavedPosts() async {
    var url = Uri.parse("${AppSetting.baseUrl}${AppSetting.savedPostsApi}");
    var response = await http
        .get(url, headers: {"Authorization": "Bearer ${Prefs.getToken()}"});

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      if (json['data'] != null) {
        data = <Data>[];
        json['data'].forEach((v) {
          data!.add(Data.fromJson(v));
        });


        for (int i = 0; i < data!.length; i++) {
          List<String> images = [];
          for (int j = 0; j < data![i].post!.photo!.length; j++) {
            images.add(data![i].post!.photo![j].photoPath!);
          }
          posts!.add(PostModel(
            caption: data![i].post!.postBody,
            postId: data![i].post!.id,
            video: data![i].post!.postVideo,
            date: data![i].post!.postDate,
            isLiked: data![i].post!.reaction == 0 ? false : true,
            isSaved: data![i].post!.saved == 0 ? false : true,
            likes: data![i].post!.likeCount,
            comments: data![i].post!.commentCount,
            shares: data![i].post!.sharePostCount,
            images: images,
            userProfileId: data![i].post!.user!.userProfile!.userId,
            userId: data![i].post!.user!.id,
            userFName: data![i].post!.user!.firstName,
            userLName: data![i].post!.user!.lastName,
            userImage: data![i].post!.user!.userProfile!.profilePhoto,
          ));
        }
        loading = false;
        setState(() {});
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchSavedPosts();

  }
  @override
  Widget build(BuildContext context) {
    return
      loading
        ? myCircularProgressIndicator()
        :
      Scaffold(
            appBar: AppBar(
              title: const Center(
                  child: Text(
                "Saved Posts",
                style: TextStyle(),
              )),
            ),
            body:posts!.isEmpty? noPostsYet(): RefreshIndicator(
              onRefresh: () async {
                posts = [];
                setState(() {
                  fetchSavedPosts();
                });
              },
              child: SingleChildScrollView(
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
                                    postBuilder(model: model, context: context),
                              ),
                            ),
                    ),
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
