import 'package:flutter/material.dart';
import 'package:social_master/models/provider/post/postmodel.dart';
import '../../../models/connection/home_page/foryou_posts.dart';
import '../../../shared/components/components.dart';
import '../../../shared/components/see_component.dart';
import '../../../shared/network/constant/constant.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../shared/shared_preferences.dart';

class SeePage extends StatefulWidget {
  SeePage({Key? key}) : super(key: key);

  @override
  State<SeePage> createState() => _SeePageState();
}

class _SeePageState extends State<SeePage> {
  final PageController _pageController = PageController();

  // List<SeePost> sees = [
  //   SeePost(
  //     PostModel(
  //         isSaved: false,
  //         isLiked: false,
  //         likes: 400,
  //         comments: 12,
  //         shares: 3,
  //         caption:
  //             'caption eded ede de fe fe  esds k lkkj lkj lklj jlj ljl jlj lj kl kk;l k;; k; l;k;l k;lk ;k; k;k ;k ;lk ;lk ;k ;l k;k ;; k;l k; k; ;;l k;l ',
  //         date: '30/12/2019',
  //         userFName: 'Habibi',
  //         userLName: 'wallah',
  //         images: [
  //           'https://mymodernmet.com/wp/wp-content/uploads/2021/12/kristina-makeeva-eoy-photo-1.jpeg',
  //           'https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg',
  //           'https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg',
  //           'https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg',
  //           'https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg'
  //         ],
  //         video: null,
  //         userImage:
  //             'https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg'),
  //   ),
  //   SeePost(
  //     PostModel(
  //         isSaved: false,
  //         isLiked: false,
  //         likes: 400,
  //         comments: 12,
  //         shares: 3,
  //         caption: 'caption',
  //         date: '30/12/2019',
  //         userFName: 'Habibi',
  //         userLName: 'wallah',
  //         images: [
  //           'https://mymodernmet.com/wp/wp-content/uploads/2021/12/kristina-makeeva-eoy-photo-1.jpeg',
  //           'https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg',
  //           'https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg',
  //           'https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg',
  //           'https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg'
  //         ],
  //         video: null,
  //         userImage:
  //             'https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg'),
  //   ),
  //   SeePost(
  //     PostModel(
  //         isSaved: false,
  //         isLiked: false,
  //         likes: 400,
  //         comments: 12,
  //         shares: 3,
  //         caption: 'caption',
  //         date: '30/12/2019',
  //         userFName: 'Habibi',
  //         userLName: 'wallah',
  //         images: [
  //           'https://mymodernmet.com/wp/wp-content/uploads/2021/12/kristina-makeeva-eoy-photo-1.jpeg',
  //           'https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg',
  //           'https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg',
  //           'https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg',
  //           'https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg'
  //         ],
  //         video: null,
  //         userImage:
  //             'https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg'),
  //   ),
  //   SeePost(
  //     PostModel(
  //         isSaved: false,
  //         isLiked: false,
  //         likes: 400,
  //         comments: 12,
  //         shares: 3,
  //         caption: 'caption',
  //         date: '30/12/2019',
  //         userFName: 'Habibi',
  //         userLName: 'wallah',
  //         images: [
  //           'https://mymodernmet.com/wp/wp-content/uploads/2021/12/kristina-makeeva-eoy-photo-1.jpeg',
  //           'https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg',
  //           'https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg',
  //           'https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg',
  //           'https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg'
  //         ],
  //         video: null,
  //         userImage:
  //             'https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg'),
  //   ),
  //   SeePost(
  //     PostModel(
  //         isSaved: false,
  //         isLiked: false,
  //         likes: 400,
  //         comments: 12,
  //         shares: 3,
  //         caption: 'caption',
  //         date: '30/12/2019',
  //         userFName: 'Habibi',
  //         userLName: 'wallah',
  //         images: [
  //           'https://mymodernmet.com/wp/wp-content/uploads/2021/12/kristina-makeeva-eoy-photo-1.jpeg',
  //           'https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg',
  //           'https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg',
  //           'https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg',
  //           'https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg'
  //         ],
  //         video: null,
  //         userImage:
  //             'https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg'),
  //   ),
  //   SeePost(
  //     PostModel(
  //         isSaved: false,
  //         isLiked: false,
  //         likes: 400,
  //         comments: 12,
  //         shares: 3,
  //         caption: 'caption',
  //         date: '30/12/2019',
  //         userFName: 'Habibi',
  //         userLName: 'wallah',
  //         images: [
  //           'https://mymodernmet.com/wp/wp-content/uploads/2021/12/kristina-makeeva-eoy-photo-1.jpeg',
  //           'https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg',
  //           'https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg',
  //           'https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg',
  //           'https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg'
  //         ],
  //         video: null,
  //         userImage:
  //             'https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg'),
  //   ),
  // ];

  List<SeePost>? allSees= [];
  List<Data>? data;
  bool loading = true;

  Future fetchSeeVideos() async {
    print(Prefs.getToken());
    var url = Uri.parse("${AppSetting.baseUrl}${AppSetting.seeVideosApi}");
    var response = await http
        .get(url, headers: {"Authorization": "Bearer ${Prefs.getToken()}"});

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      if (json['data'] != null) {
        data = <Data>[];
        json['data'].forEach((v) {
          data!.add(Data.fromJson(v));
        });



        loading = false;
        setState(() {});

        for (int i = 0; i < data!.length; i++) {
          allSees!.add(SeePost(PostModel(
            caption: data![i].postBody,
            postId: data![i].id,
            video: data![i].postVideo,
            date: data![i].postDate,
            isLiked: data![i].reaction == 0 ? false : true,
            isSaved: data![i].saved == 0 ? false : true,
            likes: data![i].likeCount,
            comments: data![i].commentCount,
            shares: data![i].sharePostCount,
            userId: data![i].user!.id,
            userFName: data![i].user!.firstName,
            userLName: data![i].user!.lastName,
            userImage: data![i].user!.userProfile!.profilePhoto,
          )));
        }

      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchSeeVideos();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? myCircularProgressIndicator()
        : Scaffold(
            body:
            PageView(
              scrollDirection: Axis.vertical,
              onPageChanged: (index) {
                setState(() {});
              },
              controller: _pageController,
              children: allSees!,
            ),
          );
  }
}
