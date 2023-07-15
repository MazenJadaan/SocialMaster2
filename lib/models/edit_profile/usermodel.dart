import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_master/models/post/postmodel.dart';

class UserModel extends ChangeNotifier{
  int id;
  String fname;
  String lname;
  int followers;
  int following;
  String phoneNumber;
  String isMale;
  String birthDate;
  String caption;
  String? job;
  String? studyPlace;
  String? bornPlace;
  String? state;
  String profileImage;
  String backgroundImage;
  List<MyPostModel> myPosts;

  UserModel({
    required this.id,
    required this.fname,
    required this.lname,
    required this.followers,
    required this.following,
    required this.phoneNumber,
    required this.isMale,
    required this.birthDate,
    required this.caption,
    required this.profileImage,
    required this.backgroundImage,
    required this.myPosts,
    this.job,
    this.studyPlace,
    this.state,
    this.bornPlace
});
}

class OtherUserModel extends ChangeNotifier {
  int id;
  bool isFollowed;
  String fName;
  String lName;
  int followers;
  int following;
  String phoneNumber;
  String isMale;
  String birthDate;
  String caption;
  String profileImage;
  String backgroundImage;
  String? job;
  String? studyPlace;
  String? bornPlace;
  String? state;
  List<PostModel>? posts;
  List<SharedPostModel>? sharedPosts;

  OtherUserModel({
    required this.id,
    required this.isFollowed,
    required this.fName,
    required this.lName,
    required this.followers,
    required this.following,
    required this.phoneNumber,
    required this.isMale,
    required this.birthDate,
    required this.caption,
    required this.profileImage,
    required this.backgroundImage,
    required this.posts,
    required this.sharedPosts,
    this.job,
    this.studyPlace,
    this.state,
    this.bornPlace
  });

  handleFollow() {
    this.isFollowed = !this.isFollowed;
    if (this.isFollowed) {
      Fluttertoast.showToast(
          msg: "${this.fName} Followed",
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.black45,
          fontSize: 16);
    } else {
      Fluttertoast.showToast(
          msg: "${this.fName} un Followed",
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.black45,
          fontSize: 16);
    }
    notifyListeners();
  }
}