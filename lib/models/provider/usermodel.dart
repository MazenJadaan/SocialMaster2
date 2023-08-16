import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_master/models/provider/post/postmodel.dart';

class UserModel extends ChangeNotifier {
  int? profileId;
  int? id;
  String? firstName;
  String? lastName;
  int? followersNumber;
  int? followingNumber;
  int? phoneNumber;
  String? gender;
  String? birthdate;
  String? bio;
  String? job;
  String? studyPlace;
  String? placeBorn;
  String? placeStay;
  String? state;
  String? profilePhoto;
  String? coverPhoto;
  String? createdAt;
  String? updatedAt;
  List<MyPostModel>? myPosts;
  List<SharedPostModel>? mySharedPosts;

  UserModel({
    this.profileId,
    this.id,
    this.firstName,
    this.lastName,
    this.followersNumber,
    this.followingNumber,
    this.phoneNumber,
    this.gender,
    this.birthdate,
    this.bio,
    this.profilePhoto,
    this.coverPhoto,
    this.myPosts,
    this.mySharedPosts,
    this.job,
    this.studyPlace,
    this.state,
    this.placeBorn,
    this.placeStay,
    this.createdAt,
    this.updatedAt,
  });
}

class OtherUserModel extends ChangeNotifier {
  int? id;
  int? profileId;
  String? firstName;
  String? lastName;
  int? followersNumber;
  int? followingNumber;
  int? phoneNumber;
  String? gender;
  String? birthdate;
  String? bio;
  String? profilePhoto;
  String? coverPhoto;
  String? job;
  String? studyPlace;
  String? placeBorn;
  String? placeStay;
  String? state;
  List<PostModel>? posts;
  List<SharedPostModel>? sharedPosts;

  OtherUserModel(
      {this.profileId,
        this.id,
      this.firstName,
      this.lastName,
      this.followersNumber,
      this.followingNumber,
      this.phoneNumber,
      this.gender,
      this.birthdate,
      this.bio,
      this.profilePhoto,
      this.coverPhoto,
      this.posts,
      this.sharedPosts,
      this.job,
      this.studyPlace,
      this.placeStay,
      this.state,
      this.placeBorn});

  // handleFollow() {
  //   this.isFollowed = !this.isFollowed!;
  //   if (this.isFollowed!) {
  //     Fluttertoast.showToast(
  //         msg: "${this.firstName} Followed",
  //         gravity: ToastGravity.BOTTOM,
  //         toastLength: Toast.LENGTH_SHORT,
  //         backgroundColor: Colors.black45,
  //         fontSize: 16);
  //   } else {
  //     Fluttertoast.showToast(
  //         msg: "${this.firstName} un Followed",
  //         gravity: ToastGravity.BOTTOM,
  //         toastLength: Toast.LENGTH_SHORT,
  //         backgroundColor: Colors.black45,
  //         fontSize: 16);
  //   }
  //   notifyListeners();
  // }
}
