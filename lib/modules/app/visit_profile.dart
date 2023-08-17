import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:social_master/shared/components/no_posts_yet.dart';
import '../../models/connection/profile/profile2.dart';
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
  OtherUserModel user=OtherUserModel() ;
  List<PostModel> postData = <PostModel>[];
  List<SharedPostModel> sharedPostData = <SharedPostModel>[];

  bool loading = true;

  Future follow()async {
    var url = Uri.parse(
        "${AppSetting.baseUrl}${AppSetting.followApi}${user.profileId}");
    var response = await http.post(
        url, headers: {"Authorization": "Bearer ${Prefs.getToken()}"});
    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "followed",
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.black45,
          fontSize: 16);
    }else {
      var url2 = Uri.parse(
          "${AppSetting.baseUrl}${AppSetting.unfollowApi}${user.profileId}");
      var response2 = await http.delete(
          url2, headers: {"Authorization": "Bearer ${Prefs.getToken()}"});
      if(response2.statusCode == 200){
        Fluttertoast.showToast(
            msg: "unfollowed",
            gravity: ToastGravity.BOTTOM,
            toastLength: Toast.LENGTH_SHORT,
            backgroundColor: Colors.black45,
            fontSize: 16);
      }
    }
  }


  Future fetchProfile() async {
    var url = Uri.parse("${AppSetting.baseUrl}${AppSetting.showProfileApi}${widget.profileId}");
    var response = await http
        .get(url, headers: {"Authorization": "Bearer ${Prefs.getToken()}"});
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      if (json['data'] != null) {

        Data? model = Data.fromJson(json['data']);
        userData = model;
        print(userData.userInformation!.lastName);
        for (int i = 0; i < userData.userPosts!.length; i++) {
          for (int j = 0; j < userData.userPosts![i].post!.length; j++) {
            List<String> images = [];

            for (int k = 0;
            k < userData.userPosts![i].post![j].photo!.length;
            k++) {
              images.add(userData.userPosts![i].post![j].photo![k].photoPath!);
            }
            postData.add(PostModel(
              userFName: userData.userPosts![i].firstName,
              userLName: userData.userPosts![i].lastName,
              userImage: userData.userInformation!.userProfile!.profilePhoto,
              userId: userData.userInformation!.id,
              userProfileId: userData.userInformation!.userProfile!.id,
              postId:   userData.userPosts![i].post![j].id,
              caption: userData.userPosts![i].post![j].postBody,
              date: userData.userPosts![i].post![j].postDate,
              likes: userData.userPosts![i].post![j].likes,
              comments: userData.userPosts![i].post![j].comments,
              shares:  userData.userPosts![i].post![j].shares,
              isLiked:  userData.userPosts![i].post![j].reaction == 0
                  ?  false
                  : true,
              isSaved:  userData.userPosts![i].post![j].saved == 0
                  ?  false
                  : true,
              video: userData.userPosts![i].post![j].video,
              images: images,
            ));
          }


          for (int j = 0; j < userData.userPosts![i].sharepost!.length; j++) {
            List<String> images2 = [];
            for (int k = 0;
            k < userData.userPosts![i].sharepost![j].post!.photo!.length;
            k++) {
              images2.add(userData.userPosts![i].sharepost![j].post!.photo![k].photoPath!);
            }
            sharedPostData.add(SharedPostModel(
              userFName: userData.userPosts![i].firstName,
              userLName: userData.userPosts![i].lastName,
              userId: userData.userPosts![i].sharepost![j].post!.userId,
              caption: userData.userPosts![i].sharepost![j].body,
              id: userData.userPosts![i].sharepost![j].id,
              date: userData.userPosts![i].sharepost![j].createdAt,
              userImage:
              userData.userInformation!.userProfile!.profilePhoto,
              post: PostModel(
                video: userData.userPosts![i].sharepost![j].post!.video,
                userId: userData.userPosts![i].sharepost![j].post!.userId,
                caption: userData.userPosts![i].sharepost![j].post!.postBody,
                date: userData.userPosts![i].sharepost![j].post!.createdAt,
                images: images2,
                likes: userData.userPosts![i].sharepost![j].post!.likes,
                comments: userData.userPosts![i].sharepost![j].post!.comments,
                shares: userData.userPosts![i].sharepost![j].post!.shares,
                postId: userData.userPosts![i].sharepost![j].post!.id,
                userProfileId: userData.userPosts![i].sharepost![j].post!.userProfileId,
                userImage:userData.userInformation!.userProfile!.profilePhoto,
                isSaved: userData.userPosts![i].sharepost![j].post!.saved == 0 ? false : true,
                isLiked:  userData.userPosts![i].sharepost![j].post!.reaction == 0 ? false : true,
                // userLName: userData.allPosts![i].sharepost![j].
              ),
            ));
          }

        }
        user = OtherUserModel(
          profileId: userData.userInformation!.id,
          firstName: userData.userInformation!.firstName,
          lastName: userData.userInformation!.lastName,
          gender: userData.userInformation!.gender,
          birthdate: userData.userInformation!.birthdate,
          job: userData.userInformation!.userProfile!.job,
          studyPlace: userData.userInformation!.userProfile!.studyPlace,
          placeStay: userData.userInformation!.userProfile!.placeStay,
          placeBorn: userData.userInformation!.userProfile!.placeBorn,
          bio: userData.userInformation!.userProfile!.bio,
          coverPhoto: userData.userInformation!.userProfile!.coverPhoto,
          state: userData.userInformation!.userProfile!.state,
          followingNumber:
              userData.userInformation!.userProfile!.followingNumber,
          followersNumber:
              userData.userInformation!.userProfile!.followersNumber,
          profilePhoto: userData.userInformation!.userProfile!.profilePhoto,
          // posts: postData,
          // sharedPosts: sharedPostData,
        );

        loading = false;
        setState(() {});
      }
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
        : ChangeNotifierProvider<OtherUserModel?>.value(
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
                                        follow();
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
                    child: TabBarView(
                        // viewportFraction: double.maxFinite,
                        controller: tc,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          Container(
                            child: postData.isEmpty
                                ? SingleChildScrollView(
                                    child:noPostsYet()
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
                                    child: noPostsYet()
                                  )
                                : ListView.builder(
                                    padding: const EdgeInsets.all(0.0),
                                    physics: const BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: sharedPostData.length,
                                    itemBuilder: (context, i) =>
                                        ChangeNotifierProvider<SharedPostModel>.value(
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
          );
  }
}
