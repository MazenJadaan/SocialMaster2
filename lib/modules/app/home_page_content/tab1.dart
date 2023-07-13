import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_master/shared/styles/colors.dart';
import '../../../models/post/postmodel.dart';
import '../../../shared/components/post_component.dart';

class Tab1 extends StatelessWidget {
  Tab1(this.scrollController, {Key? key}) : super(key: key);
  final ScrollController scrollController;

 final List<PostModel> posts = [
    PostModel(
      isSaved: false,
      isLiked: true,
      likes: 400,
      comments: 12,
      shares: 3,
      caption: 'caption',
      date: '30/12/2019',
      userFName: 'Habibi',
      userLName: 'wallah',
      image: '',
      userImage:
          'https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg',
    ),
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
        userFName: 'Habibi',
        userLName: 'wallah',
        image:
            'https://mymodernmet.com/wp/wp-content/uploads/2021/12/kristina-makeeva-eoy-photo-1.jpeg',
        userImage:
            'https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg'),
  ];

  SharedPostModel s = SharedPostModel(
    caption: 'baaad sana',
    date: '5/5/5',
    userFName: 'Habibi',
    userLName: 'wallah',
    userImage:
        'https://photo-works.net/images/europe-landscape-photo-edited.jpg',
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
      image:
          'https://imgv3.fotor.com/images/slider-image/A-clear-close-up-photo-of-a-woman.jpg',
      userImage:
          'https://photo-works.net/images/europe-landscape-photo-edited.jpg',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    )),










            ChangeNotifierProvider<SharedPostModel>.value(
              value: s,
              child: Consumer<SharedPostModel>(
                builder: (context, model, child) =>
                    sharedPostBuilder(model: model, context: context),
              ),
            ),
            OutlinedButton(
                onPressed: () {
                  scrollController.animateTo(0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                },
                child: Text(
                  'back to the Top',
                  style: TextStyle(color: AppTheme.colors.purple),
                )),
            const SizedBox(
              height: 55,
            ),
          ],
        ),
      ),
    );
  }
}
