import 'package:flutter/cupertino.dart';
import 'package:social_master/models/post/postmodel.dart';

class UserModel extends ChangeNotifier{
  String fname;
  String lname;
  int followers;
  int following;
  String phoneNumber;
  String isMale;
  String birthDate;
  String caption;
  String profileImage;
  String backgroundImage;
  List<MyPostModel> myPosts;

  UserModel({
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
});
}

class OtherUserModel extends ChangeNotifier{
  String name;
  int followers;
  int following;
  String phoneNumber;
  String isMale;
  String birthDate;
  String caption;
  String profileImage;
  String backgroundImage;
  List<PostModel>? posts;
  List<SharedPostModel>? sharedPosts;

  OtherUserModel({
    required this.name,
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
  });
}