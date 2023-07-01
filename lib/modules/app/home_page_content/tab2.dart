import 'package:flutter/material.dart';
import 'package:social_master/models/postmodel.dart';
import 'package:social_master/models/story/data.dart';
import 'package:social_master/modules/app/home.dart';
import 'package:social_master/modules/app/home_page_content/story.dart';
import 'package:social_master/modules/app/home_page_content/story_add.dart';
import 'package:story/story.dart';

import '../../../shared/components/post_component.dart';
import '../../../shared/styles/colors.dart';
import '../visit_profile.dart';

class Tab2 extends StatelessWidget {
  Tab2(this.scrollController, {Key? key}) : super(key: key);
  ScrollController scrollController;
  List<PostModel> posts = [
    PostModel(
      likes: 400,
      comments: 12,
      shares: 3,
      caption: 'caption',
      date: '30/12/2019',
      userName: 'Habibi wallah',
      image:
          'https://mymodernmet.com/wp/wp-content/uploads/2021/12/kristina-makeeva-eoy-photo-1.jpeg',
      userImage:
          'https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg',
    ),
    PostModel(
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
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => StoryAdd()));
                    },
                    child: Stack(children: [
                      Container(
                        width: 40,
                        height: 40,
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                      Center(
                          child: Icon(
                        Icons.add,
                        size: 60,
                      ))
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Story()));
                    },
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                          'https://media.licdn.com/dms/image/D4D03AQFOidLqeOofwQ/profile-displayphoto-shrink_800_800/0/1675283623437?e=2147483647&v=beta&t=PWqFmmIcp6DuF2iNY6PlvGIjaBEccf8lrWe7Eb9XOd8'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Story()));
                    },
                    child: CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                            'https://media.licdn.com/dms/image/D4E03AQE1K3zESFjOQg/profile-displayphoto-shrink_800_800/0/1680206692324?e=2147483647&v=beta&t=hTHBbcKIECvpy5xjMffpemlLVOZ7X4mInJa3opOrfcI')),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Story()));
                    },
                    child: CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                            'https://img.youm7.com/ArticleImgs/2018/8/16/56018-%D8%A8%D8%A7%D8%B3%D9%85-%D9%8A%D8%A7%D8%AE%D9%88%D8%B1-(5).jpg')),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Story()));
                    },
                    child: CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                            'https://img.youm7.com/ArticleImgs/2018/8/16/56018-%D8%A8%D8%A7%D8%B3%D9%85-%D9%8A%D8%A7%D8%AE%D9%88%D8%B1-(5).jpg')),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Story()));
                    },
                    child: CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                            'https://media.licdn.com/dms/image/D4D03AQFOidLqeOofwQ/profile-displayphoto-shrink_800_800/0/1675283623437?e=2147483647&v=beta&t=PWqFmmIcp6DuF2iNY6PlvGIjaBEccf8lrWe7Eb9XOd8')),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                ListView.builder(
                  padding: const EdgeInsets.all(0.0),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: posts.length,
                  itemBuilder: (context, i) =>
                      postBuilder(model: posts[i], context: context),
                ),
              ],
            ),
          ),
          OutlinedButton(
              onPressed: () {
                scrollController.animateTo(0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn);
              },
              child: Icon(Icons.update_sharp)),
          const SizedBox(
            height: 55,
          ),
        ],
      ),
    ));
  }
}
