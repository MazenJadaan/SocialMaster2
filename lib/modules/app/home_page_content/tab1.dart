import 'package:flutter/material.dart';
import 'package:social_master/modules/app/visit_profile.dart';

import 'package:social_master/shared/styles/colors.dart';
import '../../../shared/components/post_component.dart';

class Tab1 extends StatelessWidget {
  const Tab1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Post(
                profile:(){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>VisitProfile()));},
                comments: 13,
                likes: 99,
                shares: 6,
                heroTag: 'profile_1',
                userName: 'Mohamad Alraie',
                caption: "wake up to reality nothing ever goes as planned in this cursed world the more you live the more you realize that the only things that truly exist in this reality are merely pain suffering and futility.",
                userImage:
                    "https://mymodernmet.com/wp/wp-content/uploads/2021/12/kristina-makeeva-eoy-photo-1.jpeg",
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
