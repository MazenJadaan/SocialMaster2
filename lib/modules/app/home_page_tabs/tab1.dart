import 'package:flutter/material.dart';

import 'package:social_master/shared/styles/colors.dart';
import '../../../shared/components/post_component.dart';

class Tab1 extends StatelessWidget {
  const Tab1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            ImagePost(
                comments: 13,
                likes: 99,
                shares: 6,
                userName: 'Mohamad Alraie',
                caption: "wake up to reality nothing ever goes as planned in this cursed world the more you live the more you realize that the only things that truly exist in this reality are merely pain suffering and futility.",
                userImage:
                    "https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg",
                image:
                    "https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg"),

            const SizedBox(
              height: 55,
            ),
          ],
        ),
      ),
    );
  }
}
