import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_master/shared/styles/colors.dart';
import '../../../models/post/postmodel.dart';
import '../../../shared/components/post_component/post_component.dart';
import '../../../shared/components/post_component/shared_post_component.dart';

class Tab1 extends StatelessWidget {
  Tab1(this.scrollController, {Key? key}) : super(key: key);
  final ScrollController scrollController;

  final List<PostModel> posts = [
    PostModel(
        isSaved: false,
        isLiked: false,
        likes: 400,
        comments: 12,
        shares: 3,
        caption: 'caption',
        date: '30/12/2019',
        userFName: 'Habibi',
        userLName: 'wallah',
        images: [
          'https://mymodernmet.com/wp/wp-content/uploads/2021/12/kristina-makeeva-eoy-photo-1.jpeg',
          'https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg',
          'https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg',
          'https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg',
          'https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg'
        ],
        video: null,
        userImage:
            'https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg'),
    PostModel(
        isSaved: false,
        isLiked: false,
        likes: 400,
        comments: 12,
        shares: 3,
        caption: 'caption',
        date: '30/12/2019',
        userFName: 'Habibi',
        userLName: 'wallah',
        images: [],
        video:'assets/videos/vid.mp4',
        userImage:
        'https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg'),
    PostModel(
        isSaved: false,
        isLiked: false,
        likes: 400,
        comments: 12,
        shares: 3,
        caption: 'caption',
        date: '30/12/2019',
        userFName: 'Habibi',
        userLName: 'wallah',
        images: [
          'https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg'
        ],
        userImage:
            'https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg'),
    PostModel(
        isSaved: false,
        isLiked: false,
        likes: 400,
        comments: 12,
        shares: 3,
        caption: 'caption',
        date: '30/12/2019',
        userFName: 'Habibi',
        userLName: 'wallah',
        images: [],
        userImage:
            'https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg'),
  ];

  SharedPostModel s = SharedPostModel(
    caption: 'baaad sana',
    date: '5/5/5',
    userFName: 'Habibi',
    userLName: 'wallah',
    userImage:
        'https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg',
    post: PostModel(
      isSaved: true,
      isLiked: false,
      likes: 400,
      comments: 12,
      shares: 3,
      caption: 'caption',
      date: '30/12/2019',
      userFName: 'Habibi',
      userLName: 'wallah',
      images: [
        'https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg'
      ],
      userImage:
          'https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            RefreshIndicator(
              onRefresh: refresh,
              child: ListView.builder(
                  padding: const EdgeInsets.all(0.0),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: posts.length,
                  itemBuilder: (context, i) =>
                      ChangeNotifierProvider<PostModel>.value(
                        value: posts[i],
                        child: Consumer<PostModel>(
                          builder: (context, model, child) =>
                              postBuilder(model: model, context: context),
                        ),
                      )),
            ),
            ChangeNotifierProvider<SharedPostModel>.value(
              value: s,
              child: Consumer<SharedPostModel>(
                builder: (context, model, child) =>
                    sharedPostBuilder(model: model, context: context),
              ),
            ),
            const SizedBox(
              height: 55,
            ),
          ],
        ),
      ),
    );
  }
}
Future refresh() async {
  print('refresh');
}
