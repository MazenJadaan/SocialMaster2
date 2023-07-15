import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../models/post/postmodel.dart';

import '../../models/edit_profile/usermodel.dart';
import '../../shared/components/components.dart';
import '../../shared/components/post_component.dart';
import '../../shared/styles/colors.dart';

class VisitProfile extends StatelessWidget {
  VisitProfile({Key? key}) : super(key: key);

  OtherUserModel user = OtherUserModel(
    id: 1,
    fName: 'mohamad',
    lName: 'alraie',
    caption:
        'habibi come to lebanon oasdas mrker iefmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm enjkn  yuebheb fhbeb eunef',
    isFollowed: true,
    followers: 500,
    following: 1200,
    birthDate: '12/5/2001',
    isMale: 'male',
    job: 'facebook',
    studyPlace: 'bab alhara',
    bornPlace: 'Damascus',
    state: 'in relationship',
    phoneNumber: '0945587900',
    backgroundImage:
        'https://img.freepik.com/free-vector/night-ocean-landscape-full-moon-stars-shine_107791-7397.jpg',
    profileImage:
        'https://mymodernmet.com/wp/wp-content/uploads/2021/12/kristina-makeeva-eoy-photo-1.jpeg',
    posts: [
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
    ],
    sharedPosts: [],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: AppTheme.colors.opacityPurple,
          child: ChangeNotifierProvider<OtherUserModel>.value(
            value: user,
            child: Consumer<OtherUserModel>(
              builder: (context, model, child) => Column(
                children: [
                  Container(
                    width: double.infinity,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 220,
                              child: Image(
                                image: NetworkImage('${model.backgroundImage}'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            )
                          ],
                        ),
                        Container(
                          width: double.infinity,
                          height: 60,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30)),
                            color: Color(0xffdfdbe9),
                          ),
                        ),

                        CircleAvatar(
                          radius: 59,
                          backgroundColor: AppTheme.colors.purple,
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 55,
                            child: ClipOval(
                              child: Image(
                                  width: 200,
                                  height: 200,
                                  image: NetworkImage('${model.profileImage}'),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),

                        //following and followers
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text('${model.followers}',
                                    style: TextStyle(
                                        fontFamily: 'SignikaNegative',
                                        fontSize: 15,
                                        color: AppTheme.colors.darkPurple,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text('followers',
                                    style: TextStyle(
                                        fontFamily: 'SignikaNegative',
                                        fontSize: 15,
                                        color: AppTheme.colors.darkPurple,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            const SizedBox(
                              width: 170,
                            ),
                            Column(
                              children: [
                                Text('${model.following}',
                                    style: TextStyle(
                                        fontFamily: 'SignikaNegative',
                                        fontSize: 15,
                                        color: AppTheme.colors.darkPurple,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text('following',
                                    style: TextStyle(
                                        fontFamily: 'SignikaNegative',
                                        fontSize: 15,
                                        color: AppTheme.colors.darkPurple,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ),
                        Positioned(
                            left: 10,
                            top: 40,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: const Icon(
                                Icons.arrow_back_rounded,
                                color: Colors.white,
                              ),
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text('${model.fName} ${model.lName}',
                      style: TextStyle(
                          fontFamily: 'SignikaNegative',
                          fontSize: 22,
                          color: AppTheme.colors.darkPurple,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Text(user.caption,
                        style: const TextStyle(
                            fontFamily: 'SignikaNegative',
                            fontSize: 15,
                            color: Colors.black54,
                            fontWeight: FontWeight.w600)),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.mapLocation,
                          size: 17,
                          color: AppTheme.colors.darkPurple,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          'from ${user.bornPlace ?? 'no where'}.',
                          style: const TextStyle(
                            fontFamily: 'SignikaNegative',
                            fontSize: 15,
                            color: Colors.black45,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Row(
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.briefcase,
                          size: 17,
                          color: Colors.brown,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text('works at ${user.job ?? 'no where'}.',
                            style: const TextStyle(
                              fontFamily: 'SignikaNegative',
                              fontSize: 15,
                              color: Colors.black45,
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Row(
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.bookOpen,
                          size: 17,
                          color: Color(0xFFC0AB75),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          'studied at ${user.studyPlace ?? 'no where'}.',
                          style: const TextStyle(
                            fontFamily: 'SignikaNegative',
                            fontSize: 15,
                            color: Colors.black45,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Row(
                      children: [
                        FaIcon(
                          FontAwesomeIcons.solidHeart,
                          size: 17,
                          color: Colors.red[800],
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          '${user.state ?? 'unknown'}.',
                          style: const TextStyle(
                            fontFamily: 'SignikaNegative',
                            fontSize: 15,
                            color: Colors.black45,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: myMaterialButton(
                            width: double.infinity,
                            text:
                                '${model.isFollowed ? 'un Follow' : 'Follow'}',
                            onPressed: () {
                              model.handleFollow();
                            },
                            fontSize: 18),
                      ),
                      Expanded(
                        child: myMaterialButton(
                            width: double.infinity,
                            text: 'Message',
                            onPressed: () {},
                            fontSize: 18),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32.0, vertical: 10.0),
                    child: Container(
                      width: double.infinity,
                      height: 1,
                      color: AppTheme.colors.purple,
                    ),
                  ),
                  ListView.builder(
                      padding: const EdgeInsets.all(0.0),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: model.posts?.length,
                      itemBuilder: (context, i) =>
                          ChangeNotifierProvider<PostModel>(
                            create: (context) => model.posts![i],
                            child: Consumer<PostModel>(
                              builder: (context, model, child) =>
                                  postBuilder(model: model, context: context),
                            ),
                          )),
                  const SizedBox(
                    height: 55,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
