import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:social_master/models/postmodel.dart';
import 'package:social_master/models/usermodel.dart';
import 'package:social_master/shared/components/components.dart';
import 'package:social_master/shared/styles/colors.dart';
import '../../../shared/components/post_component.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final ImagePicker picker = ImagePicker();

  Future uploadImage() async {
    try {
      final pickedImage = await picker.pickImage(source: ImageSource.gallery);
      if (pickedImage == null) return;
      final image = File(pickedImage.path);
    } on PlatformException catch (e) {
      print('Failed to upload image $e');
    }
  }

  UserModel user = UserModel(
    name: 'mohamad',
    caption: 'habibi come to lebanon',
    followers: 500,
    following: 1200,
    birthDate: '12/5/2001',
    isMale: 'male',
    phoneNumber: '0945587900',
    backgroundImage:
        'https://img.freepik.com/free-vector/night-ocean-landscape-full-moon-stars-shine_107791-7397.jpg',
    profileImage:
        'https://mymodernmet.com/wp/wp-content/uploads/2021/12/kristina-makeeva-eoy-photo-1.jpeg',
    myPosts: [
      MyPostModel(
        isLiked: false,
        isSaved: false,
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
      MyPostModel(
          isLiked: false,
          isSaved: false,
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
    ],
  );

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserModel>.value(
      value: user,
      child: Scaffold(
        body: Consumer<UserModel>(
          builder: (context, user, child) => SingleChildScrollView(
            child: Container(
              color: AppTheme.colors.opacityPurple,
              child: Column(
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
                                image: NetworkImage(user.backgroundImage),
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: 70,
                          right: 10,
                          child: CircleAvatar(
                            backgroundColor: AppTheme.colors.purple,
                            radius: 16,
                            child: IconButton(
                                color: Colors.white,
                                icon: const FaIcon(
                                  FontAwesomeIcons.pencil,
                                  size: 17,
                                ),
                                onPressed: () {
                                  uploadImage();
                                  // setState(() {});
                                }),
                          ),
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
                        GestureDetector(
                          onTap: () {
                            uploadImage();
                            // setState(() {});
                          },
                          child: Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
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
                                        image: NetworkImage(user.profileImage),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                              CircleAvatar(
                                backgroundColor: AppTheme.colors.purple,
                                radius: 16,
                                child: IconButton(
                                    color: Colors.white,
                                    icon: const FaIcon(
                                      FontAwesomeIcons.pencil,
                                      size: 17,
                                    ),
                                    onPressed: () {
                                      uploadImage();
                                      // setState(() {});
                                    }),
                              ),
                            ],
                          ),
                        ),

                        //following and followers
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text('${user.followers}',
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
                                Text('${user.following}',
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
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(user.name,
                      style: TextStyle(
                          fontFamily: 'SignikaNegative',
                          fontSize: 20,
                          color: AppTheme.colors.darkPurple,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Text(user.caption,
                        style: const TextStyle(
                          fontFamily: 'SignikaNegative',
                          fontSize: 14,
                          color: Colors.white24,
                        )),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  myMaterialButton(
                      text: 'Edit profile details',
                      width: double.infinity,
                      onPressed: () {},
                      fontSize: 18),
                  myMaterialButton(
                      text: 'Create a new post',
                      width: double.infinity,
                      onPressed: () {},
                      fontSize: 18),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32.0,
                      vertical: 10.0,
                    ),
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
                      itemCount: user.myPosts.length,
                      itemBuilder: (context, i) =>
                          ChangeNotifierProvider<MyPostModel>(
                            create: (context) => user.myPosts[i],
                            child: Consumer<MyPostModel>(
                              builder: (context, model2, child) =>
                                  myPostBuilder(
                                      model: model2, context: context),
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
