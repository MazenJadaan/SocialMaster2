import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/postmodel.dart';
import '../../shared/components/post_component.dart';

class SavedPosts extends StatelessWidget {
  SavedPosts({Key? key}) : super(key: key);
  List<PostModel> posts = [
    PostModel(
      isSaved: true,
      isLiked: false,
      likes: 400,
      comments: 12,
      shares: 3,
      caption: 'caption',
      date: '30/12/2019',
      userName: 'Habibi wallah',
      image: '',
      userImage:
          'https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg',
    ),
    PostModel(
        isSaved: true,
        isLiked: false,
        likes: 400,
        comments: 12,
        shares: 3,
        caption: 'caption',
        date: '30/12/2019',
        userName: 'Habibi wallah',
        image:
            'https://mymodernmet.com/wp/wp-content/uploads/2021/12/kristina-makeeva-eoy-photo-1.jpeg',
        userImage:
            'https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg'),
    PostModel(
        isSaved: true,
        isLiked: false,
        likes: 400,
        comments: 12,
        shares: 3,
        caption: 'caption',
        date: '30/12/2019',
        userName: 'Habibi wallah',
        image:
            'https://mymodernmet.com/wp/wp-content/uploads/2021/12/kristina-makeeva-eoy-photo-1.jpeg',
        userImage:
            'https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Saved Posts",
          style: TextStyle(),
        )),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            ListView.builder(
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
                    ),
            ), 
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
