import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
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
      // if (pickedImage != null) {
      final image2 = File(pickedImage.path);
      // setState(() {});
      var image = image2;
    } on PlatformException catch (e) {
      print('Failed to upload image $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                          child: const Image(
                            image: NetworkImage(
                                'https://img.freepik.com/free-vector/night-ocean-landscape-full-moon-stars-shine_107791-7397.jpg'),
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
                        children: [CircleAvatar(
                          radius: 59,
                          backgroundColor: AppTheme.colors.purple,
                          child: const CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 55,
                            child: ClipOval(
                              child: Image(
                                  width: 200,
                                  height: 200,
                                  image: NetworkImage(
                                      'https://mymodernmet.com/wp/wp-content/uploads/2021/12/kristina-makeeva-eoy-photo-1.jpeg'),
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
                            Text('23440',
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
                            Text('570',
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
              Text('Mohamad Alraie',
                  style: TextStyle(
                      fontFamily: 'SignikaNegative',
                      fontSize: 20,
                      color: AppTheme.colors.darkPurple,
                      fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0),
                child: Text(
                    'hey welcome to Los Pollos Hermanos  my name is gustavo fring but you can call me gus you can say that i see things in people',
                    style: TextStyle(
                      fontFamily: 'SignikaNegative',
                      fontSize: 14,
                      color: Colors.grey,
                    )),
              ),
              const SizedBox(
                height: 8,
              ),
              MyMaterialButton(
                  text: 'Edit profile details',width: double.infinity, onPressed: () {}, fontSize: 18),
              MyMaterialButton(
                  text: 'Create a new post',width: double.infinity, onPressed: () {}, fontSize: 18),

              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 32.0, vertical: 10.0),
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: AppTheme.colors.purple,
                ),
              ),
              MyOwnPost(
                  comments: 13,
                  likes: 99,
                  shares: 6,
                  userName: 'Mohamad Alraie',
                  caption:
                      "wake up to reality nothing ever goes as planned in this cursed world the more you live the more you realize that the only things that truly exist in this reality are merely pain suffering and futility.",
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
      ),
    );
  }
}
