import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../models/connection/profile/profile.dart';
import '../../models/provider/post/postmodel.dart';
import '../../models/provider/usermodel.dart';
import '../../shared/components/components.dart';
import '../../shared/components/post_component/post_component.dart';
import '../../shared/components/post_component/shared_post_component.dart';
import '../../shared/network/constant/constant.dart';
import '../../shared/shared_preferences.dart';
import '../../shared/styles/colors.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'handle_media/show_photo.dart';

class VisitProfile extends StatefulWidget {
  VisitProfile(this.profileId, {Key? key}) : super(key: key);
  int? profileId;

  @override
  State<VisitProfile> createState() => _VisitProfileState();
}

class _VisitProfileState extends State<VisitProfile>
    with TickerProviderStateMixin {
  Data userData = Data();
  OtherUserModel user = OtherUserModel();
  List<PostModel> postData = <PostModel>[];
  List<SharedPostModel> sharedPostData = <SharedPostModel>[];
  bool loading = false;

  Future fetchProfile() async {
    var url = Uri.parse("${AppSetting.baseUrl}${AppSetting.showProfileApi}1");
    var response = await http
        .get(url, headers: {"Authorization": "Bearer ${Prefs.getToken()}"});
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      if (json['data'] != null) {
        Data model = Data.fromJson(json['data']);
        userData = model;
        for (int i = 0; i < userData.allPosts!.length; i++) {
          for (int j = 0; j < userData.allPosts![i].post!.length; i++) {
            // myPostData[j].id = userData.allPosts![i].id;
            postData[j].userFName = userData.allPosts![i].firstName;
            postData[j].userLName = userData.allPosts![i].lastName;
            postData[j].userImage =
                userData.profileInformation!.userProfile!.profilePhoto;
            postData[j].postId = userData.allPosts![i].post![j].id;
            postData[i].caption = userData.allPosts![i].post![j].postBody;
            postData[i].date = userData.allPosts![i].post![j].postDate;
            postData[i].likes = userData.allPosts![i].post![j].likes;
            postData[i].comments = userData.allPosts![i].post![j].comments;
            postData[i].shares = userData.allPosts![i].post![j].shares;
            postData[i].isLiked = userData.allPosts![i].post![j].reaction == 0
                ? postData[i].isLiked = false
                : true;
            postData[i].isLiked = userData.allPosts![i].post![j].saved == 0
                ? postData[i].isSaved = false
                : true;
            postData[i].video = userData.allPosts![i].post![j].video;
            postData[i].userId = userData.allPosts![i].post![j].userId;
            postData[i].userProfileId =
                userData.allPosts![i].post![j].userProfileId;
            for (int k = 0;
                k < userData.allPosts![i].post![j].photo!.length;
                k++) {
              postData[i].images![k] =
                  userData.allPosts![i].post![j].photo![k].photoPath!;
            }
          }
          for (int j = 0; j < userData.allPosts![i].sharepost!.length; i++) {
            sharedPostData[j].userFName = userData.allPosts![i].firstName;
            sharedPostData[j].userLName = userData.allPosts![i].lastName;
            sharedPostData[j].userImage =
                userData.profileInformation!.userProfile!.profilePhoto;
            sharedPostData[j].id = userData.allPosts![i].sharepost![j].id;
            sharedPostData[i].caption =
                userData.allPosts![i].sharepost![j].body;
            sharedPostData[i].date =
                userData.allPosts![i].sharepost![j].createdAt;
            sharedPostData[i].post!.video =
                userData.allPosts![i].sharepost![j].post!.video;
            sharedPostData[i].userId =
                userData.allPosts![i].sharepost![j].post!.userId;
            sharedPostData[i].post!.caption =
                userData.allPosts![i].sharepost![j].post!.postBody;
            sharedPostData[i].post!.video =
                userData.allPosts![i].sharepost![j].post!.video;
            sharedPostData[i].post!.date =
                userData.allPosts![i].sharepost![j].post!.createdAt;
            for (int k = 0;
                k < userData.allPosts![i].post![j].photo!.length;
                k++) {
              sharedPostData[i].post!.images![k] = userData
                  .allPosts![i].sharepost![j].post!.photo![k].photoPath!;
            }
          }
        }
        user = OtherUserModel(
          profileId: userData.profileInformation?.id,
          firstName: userData.profileInformation?.firstName,
          lastName: userData.profileInformation?.lastName,
          gender: userData.profileInformation?.gender,
          birthdate: userData.profileInformation?.birthdate,
          job: userData.profileInformation?.userProfile?.job,
          studyPlace: userData.profileInformation?.userProfile?.studyPlace,
          placeStay: userData.profileInformation?.userProfile?.placeStay,
          placeBorn: userData.profileInformation?.userProfile?.placeBorn,
          bio: userData.profileInformation?.userProfile?.bio,
          coverPhoto: userData.profileInformation?.userProfile?.coverPhoto,
          state: userData.profileInformation?.userProfile?.state,
          followingNumber:
              userData.profileInformation?.userProfile?.followingNumber,
          followersNumber:
              userData.profileInformation?.userProfile?.followersNumber,
          // user.phoneNumber=userData.profileInformation?.userProfile?.
          phoneNumber: 0945587900,
          profilePhoto: userData.profileInformation?.userProfile?.profilePhoto,
          posts: postData,
          sharedPosts: sharedPostData,
        );

        loading = false;
        setState(() {});
      }
      print('no fuck u');
    } else {
      print('fuck u');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TabController tc = TabController(length: 2, vsync: this);
    return loading
        ? myCircularProgressIndicator()
        : ChangeNotifierProvider<OtherUserModel>.value(
            value: user,
            child: Consumer<OtherUserModel>(
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
                                      GestureDetector(
                                        onTap: () {
                                          showPhoto(
                                              context: context,
                                              image:
                                                  '${AppSetting.baseUrl}${user.coverPhoto}');
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: 220,
                                          child: Image(
                                            image: NetworkImage(
                                                '${AppSetting.baseUrl}${user.coverPhoto}'),
                                            errorBuilder: (context, error,
                                                    stackTrace) =>
                                                myCircularProgressIndicator(),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          topRight: Radius.circular(30)),
                                      color: AppSetting.darkMode
                                          ? const Color(0xff1d1f2c)
                                          : const Color(0xffe3dfec),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      showPhoto(
                                          context: context,
                                          image:
                                              '${AppSetting.baseUrl}${user.profilePhoto}');
                                    },
                                    child: Stack(
                                      alignment: AlignmentDirectional.bottomEnd,
                                      children: [
                                        CircleAvatar(
                                          radius: 60,
                                          backgroundColor:
                                              AppTheme.colors.purple,
                                          child: CircleAvatar(
                                            backgroundColor: Colors.transparent,
                                            radius: 56,
                                            child: ClipOval(
                                              child: Image(
                                                  width: 200,
                                                  height: 200,
                                                  image: NetworkImage(
                                                      '${AppSetting.baseUrl}${user.profilePhoto}'),
                                                  errorBuilder: (context, error,
                                                          stackTrace) =>
                                                      myCircularProgressIndicator(),
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
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
                                          Text('${user.followersNumber}',
                                              style: TextStyle(
                                                  fontFamily: 'SignikaNegative',
                                                  fontSize: 15,
                                                  color: AppTheme
                                                      .colors.darkPurple,
                                                  fontWeight: FontWeight.bold)),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text('followers',
                                              style: TextStyle(
                                                  fontFamily: 'SignikaNegative',
                                                  fontSize: 15,
                                                  color: AppTheme
                                                      .colors.darkPurple,
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 170,
                                      ),
                                      Column(
                                        children: [
                                          Text('${user.followingNumber}',
                                              style: TextStyle(
                                                  fontFamily: 'SignikaNegative',
                                                  fontSize: 15,
                                                  color: AppTheme
                                                      .colors.darkPurple,
                                                  fontWeight: FontWeight.bold)),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text('following',
                                              style: TextStyle(
                                                  fontFamily: 'SignikaNegative',
                                                  fontSize: 15,
                                                  color: AppTheme
                                                      .colors.darkPurple,
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
                            Text('${user.firstName} ${user.lastName}',
                                style: TextStyle(
                                    fontFamily: 'SignikaNegative',
                                    fontSize: 22,
                                    color: AppTheme.colors.darkPurple,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(
                              height: 12,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18.0),
                              child: Text(' ${user.bio ?? ''}',
                                  style: TextStyle(
                                      fontFamily: 'SignikaNegative',
                                      fontSize: 15,
                                      color: AppTheme.colors.darkPurple,
                                      fontWeight: FontWeight.w600)),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            user.placeBorn == null
                                ? const SizedBox()
                                : Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 18.0),
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
                                          'from ${user.placeBorn ?? 'no where'}.',
                                          style: TextStyle(
                                            fontFamily: 'SignikaNegative',
                                            fontSize: 15,
                                            color: AppTheme.colors.darkPurple,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                            const SizedBox(
                              height: 4,
                            ),
                            user.placeStay == null
                                ? const SizedBox()
                                : Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 18.0),
                                    child: Row(
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.house,
                                          size: 17,
                                          color: AppTheme.colors.darkPurple,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          'live in ${user.placeStay ?? 'no where'}.',
                                          style: TextStyle(
                                            fontFamily: 'SignikaNegative',
                                            fontSize: 15,
                                            color: AppTheme.colors.darkPurple,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                            const SizedBox(
                              height: 4,
                            ),
                            user.job == null
                                ? const SizedBox()
                                : Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 18.0),
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
                                        Text(
                                            'works at ${user.job ?? 'no where'}.',
                                            style: TextStyle(
                                              fontFamily: 'SignikaNegative',
                                              fontSize: 15,
                                              color: AppTheme.colors.darkPurple,
                                            )),
                                      ],
                                    ),
                                  ),
                            const SizedBox(
                              height: 4,
                            ),
                            user.studyPlace == null
                                ? const SizedBox()
                                : Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 18.0),
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
                                          style: TextStyle(
                                            fontFamily: 'SignikaNegative',
                                            fontSize: 15,
                                            color: AppTheme.colors.darkPurple,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                            const SizedBox(
                              height: 4,
                            ),
                            user.state == null
                                ? const SizedBox()
                                : Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 18.0),
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
                                          style: TextStyle(
                                            fontFamily: 'SignikaNegative',
                                            fontSize: 15,
                                            color: AppTheme.colors.darkPurple,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: myMaterialButton(
                                      width: double.infinity,
                                      text: 'Follow',
                                      onPressed: () {
                                        // user.handleFollow();
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
                            TabBar(
                              controller: tc,
                              dividerColor: Colors.white,
                              labelStyle: const TextStyle(
                                  fontFamily: 'SignikaNegative',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                              indicatorWeight: 3,
                              indicatorColor: AppTheme.colors.purple,
                              labelColor: AppTheme.colors.purple,
                              tabs: const [
                                Tab(text: "posts"),
                                Tab(text: "shares"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ])),
                  ],
                  body: Container(
                    color: AppTheme.colors.backgroundColor,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 55.0),
                      child: TabBarView(
                          // viewportFraction: double.maxFinite,
                          controller: tc,
                          physics: const BouncingScrollPhysics(),
                          children: [
                            Container(
                              child: postData.isEmpty
                                  ? SingleChildScrollView(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          top: 50.0,
                                        ),
                                        child: Column(
                                          children: [
                                            Icon(
                                              Icons.camera_alt_outlined,
                                              size: 100,
                                              color: AppTheme.colors.darkPurple,
                                            ),
                                            Text(
                                              'No Posts Yet',
                                              style: TextStyle(
                                                fontSize: 30,
                                                color:
                                                    AppTheme.colors.darkPurple,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : ListView.builder(
                                      padding: const EdgeInsets.all(0.0),
                                      physics: const BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: postData.length,
                                      itemBuilder: (context, i) =>
                                          ChangeNotifierProvider<
                                              PostModel>.value(
                                        value: postData[i],
                                        child: Consumer<PostModel>(
                                          builder: (context, model2, child) =>
                                              postBuilder(
                                                  model: model2,
                                                  context: context),
                                        ),
                                      ),
                                    ),
                            ),
                            Container(
                              child: sharedPostData.isEmpty
                                  ? SingleChildScrollView(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          top: 50.0,
                                        ),
                                        child: Column(
                                          children: [
                                            Icon(
                                              Icons.camera_alt_outlined,
                                              size: 100,
                                              color: AppTheme.colors.darkPurple,
                                            ),
                                            Text(
                                              'No Posts Yet',
                                              style: TextStyle(
                                                fontSize: 30,
                                                color:
                                                    AppTheme.colors.darkPurple,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  : ListView.builder(
                                      padding: const EdgeInsets.all(0.0),
                                      physics: const BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: sharedPostData.length,
                                      itemBuilder: (context, i) =>
                                          ChangeNotifierProvider<
                                              SharedPostModel>.value(
                                            value: sharedPostData[i],
                                            child: Consumer<SharedPostModel>(
                                              builder:
                                                  (context, model2, child) =>
                                                      sharedPostBuilder(
                                                          model: model2,
                                                          context: context),
                                            ),
                                          )),
                            ),
                          ]),
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
