import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:social_master/models/post/postmodel.dart';
import 'package:social_master/models/edit_profile/usermodel.dart';
import 'package:social_master/modules/app/edit_profile.dart';
import 'package:social_master/modules/app/handle_post/create_post.dart';
import 'package:social_master/shared/components/components.dart';
import 'package:social_master/shared/styles/colors.dart';
import '../../../shared/components/post_component.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
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
    id: 1,
    fname: 'mohamad',
    lname: 'alraie',
    caption: 'habibi come to lebanon',
    followers: 500,
    following: 1200,
    birthDate: '12/5/2001',
    isMale: 'male',
    phoneNumber: '0945587900',
    job: 'facebook',
    studyPlace: 'bab alhara',
    bornPlace: 'Damascus',
    state: 'in relationship',
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
        caption:
            'my mym my mym my my mym my my my my m my mym my my my my caption',
        date: '30/12/2019',
        userFName: 'Habibi',
        userLName: 'wallah',
        images: [
          'https://mymodernmet.com/wp/wp-content/uploads/2021/12/kristina-makeeva-eoy-photo-1.jpeg'
        ],
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
          userFName: 'Habibi',
          userLName: 'wallah',
          images: [
            'https://mymodernmet.com/wp/wp-content/uploads/2021/12/kristina-makeeva-eoy-photo-1.jpeg'
          ],
          userImage:
              'https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-during-sunset-surrounded-by-grass_181624-22807.jpg'),
    ],
  );

  @override
  Widget build(BuildContext context) {
    TabController _tc = TabController(length: 2, vsync: this);
    return ChangeNotifierProvider<UserModel>.value(
      value: user,
      child: Consumer<UserModel>(
        builder: (context, user, child) => Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (context, value) => [
              SliverList(
                  delegate: SliverChildListDelegate.fixed([
                Container(
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
                                            image:
                                                NetworkImage(user.profileImage),
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
                      Text('${user.fname} ${user.lname}',
                          style: TextStyle(
                              fontFamily: 'SignikaNegative',
                              fontSize: 22,
                              color: AppTheme.colors.darkPurple,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 12,
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
                      myMaterialButton(
                          text: 'Edit profile details',
                          width: double.infinity,
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => EditProfile(user)));
                          },
                          fontSize: 18),
                      myMaterialButton(
                          text: 'Create a new post',
                          width: double.infinity,
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CreatePost()));
                          },
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
                      TabBar(
                        controller: _tc,
                        dividerColor: Colors.white,
                        labelStyle: const TextStyle(
                            fontFamily: 'SignikaNegative',
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                        indicatorWeight: 3,
                        indicatorColor: AppTheme.colors.purple,
                        labelColor: AppTheme.colors.purple,
                        tabs: const [
                          Tab(text: "my posts"),
                          Tab(text: "my shares"),
                        ],
                      ),
                    ],
                  ),
                ),
              ])),
            ],
            body: Container(
              child: TabBarView(
                  // viewportFraction: double.maxFinite,
                  controller: _tc,
                  physics: BouncingScrollPhysics(),
                  children: [
                    Container(
                      child: ListView.builder(
                          padding: const EdgeInsets.all(0.0),
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: user.myPosts.length,
                          itemBuilder: (context, i) =>
                              ChangeNotifierProvider<MyPostModel>.value(
                                value: user.myPosts[i],
                                child: Consumer<MyPostModel>(
                                  builder: (context, model2, child) =>
                                      myPostBuilder(
                                          model: model2, context: context),
                                ),
                              )),
                    ),
                    Container(
                      child: ListView.builder(
                          padding: const EdgeInsets.all(0.0),
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: user.myPosts.length,
                          itemBuilder: (context, i) =>
                              ChangeNotifierProvider<MyPostModel>.value(
                                value: user.myPosts[i],
                                child: Consumer<MyPostModel>(
                                  builder: (context, model2, child) =>
                                      myPostBuilder(
                                          model: model2, context: context),
                                ),
                              )),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
