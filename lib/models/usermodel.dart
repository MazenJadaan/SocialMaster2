import 'package:flutter/cupertino.dart';
import 'package:social_master/models/postmodel.dart';

class UserModel extends ChangeNotifier{
  String name;
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
    required this.name,
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