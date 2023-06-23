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
   Tab2(this.scrollController,{Key? key}) : super(key: key);
  ScrollController scrollController;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
      children: [
          SingleChildScrollView(
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
                        child: const CircleAvatar(
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                      const Center(
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
                    child: Container(
                        width: 80,
                        height: 80,
                        child: const CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://media.licdn.com/dms/image/D4D03AQFOidLqeOofwQ/profile-displayphoto-shrink_800_800/0/1675283623437?e=2147483647&v=beta&t=PWqFmmIcp6DuF2iNY6PlvGIjaBEccf8lrWe7Eb9XOd8'),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Story()));
                    },
                    child: Container(
                      width: 80,
                      height: 80,
                      child: const CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://media.licdn.com/dms/image/D4E03AQE1K3zESFjOQg/profile-displayphoto-shrink_800_800/0/1680206692324?e=2147483647&v=beta&t=hTHBbcKIECvpy5xjMffpemlLVOZ7X4mInJa3opOrfcI')),
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
                    child: Container(
                      width: 80,
                      height: 80,
                      child: const CircleAvatar(

                          backgroundImage: NetworkImage(
                              'https://img.youm7.com/ArticleImgs/2018/8/16/56018-%D8%A8%D8%A7%D8%B3%D9%85-%D9%8A%D8%A7%D8%AE%D9%88%D8%B1-(5).jpg')),
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
                    child: Container(
                      width: 80,
                      height: 80,
                      child: const CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://img.youm7.com/ArticleImgs/2018/8/16/56018-%D8%A8%D8%A7%D8%B3%D9%85-%D9%8A%D8%A7%D8%AE%D9%88%D8%B1-(5).jpg')),
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
                    child: Container(
                      width: 80,
                      height: 80,
                      child: const CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://media.licdn.com/dms/image/D4D03AQFOidLqeOofwQ/profile-displayphoto-shrink_800_800/0/1675283623437?e=2147483647&v=beta&t=PWqFmmIcp6DuF2iNY6PlvGIjaBEccf8lrWe7Eb9XOd8')),
                    ),
                  ),
                )
              ],
            ),
          )
        ,const SizedBox(height: 20),
          // SingleChildScrollView(
          //   physics:  const BouncingScrollPhysics(),
          //   child: Column(
          //     children: [
          //       ListView.builder(
          //         padding: const EdgeInsets.all(0.0),
          //         physics: const NeverScrollableScrollPhysics(),
          //         shrinkWrap: true,
          //         scrollDirection: Axis.vertical,
          //         itemCount: posts.length,
          //         itemBuilder: (context, i) => postBuilder(model: posts[i],context: context),
          //       ),
          //     ],
          //   ),
          // ),
          OutlinedButton(onPressed: (){scrollController.animateTo(0,duration: const Duration(milliseconds: 500), curve: Curves.easeIn);}, child: Text('back to the Top',style: TextStyle(color: AppTheme.colors.purple),)),
          const SizedBox(
            height: 55,
          ),
      ],

    ),
        )
    );
  }
}
