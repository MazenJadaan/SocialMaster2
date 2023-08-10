import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:social_master/modules/app/handle_post/create_post.dart';
import 'package:social_master/shared/components/components.dart';
import 'package:social_master/shared/network/constant/constant.dart';
import 'package:social_master/shared/styles/colors.dart';
import '../../../models/connection/profile/profile.dart';
import '../../../models/provider/post/postmodel.dart';
import '../../../models/provider/usermodel.dart';
import '../../../shared/components/post_component/my_post_component.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../shared/components/post_component/shared_post_component.dart';
import '../../../shared/shared_preferences.dart';
import '../edit_profile.dart';
import '../handle_media/show_photo.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
  final ImagePicker picker = ImagePicker();

  Data userData = Data();
  UserModel user = UserModel();
  List<MyPostModel> myPostData = <MyPostModel>[];
  List<SharedPostModel> mySharedPostData = <SharedPostModel>[];
  bool loading = true;

  Future<bool> updatePicture({
    required String api,
    required String key,
    required String token,
  }) async {
    var request =
    http.MultipartRequest("POST", Uri.parse("${AppSetting.baseUrl}$api"));
    request.headers["Authorization"] = "Bearer $token";
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage == null) return false;
    var pic = await http.MultipartFile.fromPath("${key}", pickedImage.path);
    request.files.add(pic);
    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    final json = jsonDecode(responseString);
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }


  Future fetchProfile() async {
    var url = Uri.parse("${AppSetting.baseUrl}${AppSetting.showMyProfileApi}");
    var response = await http
        .get(url, headers: {"Authorization": "Bearer ${Prefs.getToken()}"});

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      if (json['data'] != null) {
        Data model = Data.fromJson(json['data']);
        userData= model;

        for (int i = 0; i < userData.allPosts!.length; i++) {
          for (int j = 0; j < userData.allPosts![i].post!.length; j++) {
            List<String> images=[];

            for (int k = 0;
            k < userData.allPosts![i].post![j].photo!.length;
            k++) {
              images.add(userData.allPosts![i].post![j].photo![k].photoPath!);
            }
            myPostData.add(MyPostModel(
                userFName: userData.allPosts![i].firstName,
                userLName: userData.allPosts![i].lastName,
                userImage:'${AppSetting.baseUrl}${userData.profileInformation!.userProfile!.profilePhoto}',
                userId: userData.allPosts![i].post![j].userId,
                userProfileId: userData.allPosts![i].post![j].userProfileId,
                postId: userData.allPosts![i].post![j].id,
                caption: userData.allPosts![i].post![j].postBody,
                date: userData.allPosts![i].post![j].postDate,
                likes: userData.allPosts![i].post![j].likes,
                comments: userData.allPosts![i].post![j].comments,
                shares: userData.allPosts![i].post![j].shares,
                isLiked:
                userData.allPosts![i].post![j].reaction == 0
                    ?  false
                    : true,
                isSaved:
            userData.allPosts![i].post![j].saved == 0
                    ?  false
                    : true,
                video: userData.allPosts![i].post![j].video,
                images:images,
            ));

          // for (int j = 0; j < userData.allPosts![i].sharepost!.length; j++) {
          //   mySharedPostData[j].userFName = userData.allPosts![i].firstName;
          //   mySharedPostData[j].userLName = userData.allPosts![i].lastName;
          //   mySharedPostData[j].userImage =
          //       userData.profileInformation!.userProfile!.profilePhoto;
          //   mySharedPostData[j].id = userData.allPosts![i].sharepost![j].id;
          //   mySharedPostData[i].caption =
          //       userData.allPosts![i].sharepost![j].body;
          //   mySharedPostData[i].date =
          //       userData.allPosts![i].sharepost![j].createdAt;
          //   mySharedPostData[i].post!.video =
          //       userData.allPosts![i].sharepost![j].post!.video;
          //   mySharedPostData[i].userId =
          //       userData.allPosts![i].sharepost![j].post!.userId;
          //   mySharedPostData[i].post!.caption =
          //       userData.allPosts![i].sharepost![j].post!.postBody;
          //   mySharedPostData[i].post!.video =
          //       userData.allPosts![i].sharepost![j].post!.video;
          //   mySharedPostData[i].post!.date =
          //       userData.allPosts![i].sharepost![j].post!.createdAt;
          //   for (int k = 0;
          //   k < userData.allPosts![i].post![j].photo!.length;
          //   k++) {
          //     mySharedPostData[i].post!.images![k] = userData
          //         .allPosts![i].sharepost![j].post!.photo![k].photoPath!;
          //   }
          }
        }

        user = UserModel(
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
          myPosts: myPostData,
          mySharedPosts: mySharedPostData,
        );

        loading = false;
        setState(() {});
      }
      // return null;
    } else {}
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
        : ChangeNotifierProvider<UserModel>.value(
      value: user,
      child: Consumer<UserModel>(
        builder: (context, user, child) =>
            Scaffold(
              body: RefreshIndicator(
                onRefresh: () async {
                  await fetchProfile();
                },
                child: NestedScrollView(
                  headerSliverBuilder: (context, value) =>
                  [
                    SliverList(
                        delegate: SliverChildListDelegate.fixed([
                          Container(
                            color: AppTheme.colors.backgroundColor,
                            child: Container(
                              color: AppTheme.colors.opacityPurple,
                              child: Column(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    child: Stack(
                                      alignment: AlignmentDirectional
                                          .bottomCenter,
                                      children: [
                                        Column(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                showPhoto(
                                                    context: context,
                                                    image:
                                                    '${AppSetting.baseUrl}${user
                                                        .coverPhoto!}');
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                height: 220,
                                                child: Image(
                                                  image: NetworkImage(
                                                      '${AppSetting
                                                          .baseUrl}${user
                                                          .coverPhoto!}'),
                                                  // errorBuilder: (context, error,
                                                  //         stackTrace) =>
                                                  //     myCircularProgressIndicator(),
                                                  fit: BoxFit.cover,
                                                ),
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
                                            backgroundColor: AppTheme.colors
                                                .purple,
                                            radius: 16,
                                            child: IconButton(
                                                color: Colors.white,
                                                icon: const FaIcon(
                                                  FontAwesomeIcons.pencil,
                                                  size: 17,
                                                ),
                                                onPressed: () async {
                                                  bool done = await updatePicture(
                                                      token: Prefs.getToken()!,
                                                      api: AppSetting
                                                          .updateProfileCoverApi,
                                                      key: 'cover_photo');
                                                  done
                                                      ? Fluttertoast.showToast(
                                                      msg:
                                                      "Refresh the Screen to display the photo!",
                                                      gravity:
                                                      ToastGravity.BOTTOM,
                                                      toastLength:
                                                      Toast.LENGTH_SHORT,
                                                      backgroundColor:
                                                      Colors.black,
                                                      timeInSecForIosWeb: 2,
                                                      fontSize: 14)
                                                      : Fluttertoast.showToast(
                                                      msg:
                                                      "Failed to load the photo",
                                                      gravity:
                                                      ToastGravity.BOTTOM,
                                                      toastLength:
                                                      Toast.LENGTH_SHORT,
                                                      backgroundColor:
                                                      Colors.red,
                                                      timeInSecForIosWeb: 2,
                                                      fontSize: 14);
                                                }),
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            borderRadius: const BorderRadius
                                                .only(
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
                                                '${AppSetting.baseUrl}${user
                                                    .profilePhoto!}');
                                          },
                                          child: Stack(
                                            alignment:
                                            AlignmentDirectional.bottomEnd,
                                            children: [
                                              CircleAvatar(
                                                radius: 60,
                                                backgroundColor:
                                                AppTheme.colors.purple,
                                                child: CircleAvatar(
                                                  backgroundColor:
                                                  Colors.transparent,
                                                  radius: 56,
                                                  child: ClipOval(
                                                    child: Image(
                                                        width: 200,
                                                        height: 200,
                                                        image: NetworkImage(
                                                            '${AppSetting
                                                                .baseUrl}${user
                                                                .profilePhoto!}'),
                                                        // errorBuilder: (context,
                                                        //         error,
                                                        //         stackTrace) =>
                                                        //     myCircularProgressIndicator(),
                                                        fit: BoxFit.cover),
                                                  ),
                                                ),
                                              ),
                                              CircleAvatar(
                                                backgroundColor:
                                                AppTheme.colors.purple,
                                                radius: 16,
                                                child: IconButton(
                                                    color: Colors.white,
                                                    icon: const FaIcon(
                                                      FontAwesomeIcons.pencil,
                                                      size: 17,
                                                    ),
                                                    onPressed: () async {
                                                      bool done = await updatePicture(
                                                          token: Prefs
                                                              .getToken()!,
                                                          api: AppSetting
                                                              .updateProfilePictureApi,
                                                          key: "profile_photo");
                                                      done
                                                          ? Fluttertoast
                                                          .showToast(
                                                          msg:
                                                          "Refresh the Screen to display the photo!",
                                                          gravity: ToastGravity
                                                              .BOTTOM,
                                                          toastLength: Toast
                                                              .LENGTH_SHORT,
                                                          backgroundColor:
                                                          Colors.black,
                                                          timeInSecForIosWeb: 2,
                                                          fontSize: 14)
                                                          : Fluttertoast
                                                          .showToast(
                                                          msg:
                                                          "Failed to load the photo",
                                                          gravity: ToastGravity
                                                              .BOTTOM,
                                                          toastLength: Toast
                                                              .LENGTH_SHORT,
                                                          backgroundColor:
                                                          Colors.red,
                                                          timeInSecForIosWeb: 2,
                                                          fontSize: 14);
                                                    }),
                                              ),
                                            ],
                                          ),
                                        ),

                                        //following and followers
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Column(
                                              children: [
                                                Text('${user.followersNumber ??
                                                    0 }',
                                                    style: TextStyle(
                                                        fontFamily:
                                                        'SignikaNegative',
                                                        fontSize: 15,
                                                        color: AppTheme
                                                            .colors.darkPurple,
                                                        fontWeight:
                                                        FontWeight.bold)),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text('followers',
                                                    style: TextStyle(
                                                        fontFamily:
                                                        'SignikaNegative',
                                                        fontSize: 15,
                                                        color: AppTheme
                                                            .colors.darkPurple,
                                                        fontWeight:
                                                        FontWeight.bold)),
                                              ],
                                            ),
                                            const SizedBox(
                                              width: 170,
                                            ),
                                            Column(
                                              children: [
                                                Text('${user.followingNumber ??
                                                    0 }',
                                                    style: TextStyle(
                                                        fontFamily:
                                                        'SignikaNegative',
                                                        fontSize: 15,
                                                        color: AppTheme
                                                            .colors.darkPurple,
                                                        fontWeight:
                                                        FontWeight.bold)),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text('following',
                                                    style: TextStyle(
                                                        fontFamily:
                                                        'SignikaNegative',
                                                        fontSize: 15,
                                                        color: AppTheme
                                                            .colors.darkPurple,
                                                        fontWeight:
                                                        FontWeight.bold)),
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 18.0),
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
                                          'from ${user.placeBorn ??
                                              'no where'}.',
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
                                          'live in ${user.placeStay ??
                                              'no where'}.',
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
                                            'works at ${user.job ??
                                                'no where'}.',
                                            style: TextStyle(
                                              fontFamily: 'SignikaNegative',
                                              fontSize: 15,
                                              color:
                                              AppTheme.colors.darkPurple,
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
                                          'studied at ${user.studyPlace ??
                                              'no where'}.',
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
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  myMaterialButton(
                                      text: 'Edit profile details',
                                      width: double.infinity,
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EditProfile(user)));
                                      },
                                      fontSize: 18),
                                  myMaterialButton(
                                      text: 'Create a new post',
                                      width: double.infinity,
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                const CreatePost()));
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
                                      Tab(text: "my posts"),
                                      Tab(text: "my shares"),
                                    ],
                                  ),
                                ],
                              ),
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
                              child: user.myPosts!.isEmpty
                                  ? SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 30.0,
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
                                itemCount: user.myPosts!.length,
                                itemBuilder: (context, i) =>
                                ChangeNotifierProvider<
                                    MyPostModel>.value(
                                  value: user.myPosts![i],
                                  child: Consumer<MyPostModel>(
                                    builder: (context, model2, child) =>
                                        myPostBuilder(
                                            model: model2,
                                            context: context),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: user.mySharedPosts!.isEmpty
                                  ? SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 30.0,
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
                                  itemCount: user.mySharedPosts!.length,
                                  itemBuilder: (context, i) =>
                                  ChangeNotifierProvider<
                                      SharedPostModel>.value(
                                    value: user.mySharedPosts![i],
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
      ),
    );
  }
}