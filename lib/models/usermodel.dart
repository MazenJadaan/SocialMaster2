import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_master/models/post/postmodel.dart';

class UserModel extends ChangeNotifier{
  int? profileId;
  int? id;
  String? firstName;
  String? lastName;
  int? followersNumber;
  int? following;
  String? phoneNumber;
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

  UserModel({
     this.profileId,
     this.id,
     this.firstName,
     this.lastName,
     this.followersNumber,
     this.following,
     this.phoneNumber,
     this.gender,
     this.birthdate,
     this.bio,
     this.profilePhoto,
    this.coverPhoto,
    this.myPosts,
    this.job,
    this.studyPlace,
    this.state,
    this.placeBorn,
    this.placeStay,
    this.createdAt,
    this.updatedAt,
});


  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    gender = json['gender'];
    birthdate = json['birthdate'];
    profileId =json['user_profile']['id'];
    job = json['user_profile']['job'];
    studyPlace = json['user_profile']['study_place'];
    placeStay = json['user_profile']['place_stay'];
    placeBorn = json['user_profile']['place_born'];
    bio = json['user_profile']['bio'];
    coverPhoto = json['user_profile']['cover_photo'];
    profilePhoto = json['user_profile']['profile_photo'];
    followersNumber = json['user_profile']['followers_number'];
    state = json['user_profile']['state'];
    createdAt = json['user_profile']['created_at'];
    updatedAt = json['user_profile']['updated_at'];

  //  userId is the id
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['gender'] = this.gender;
    data['birthdate'] = this.birthdate;
    data['user_profile']['id'] = this.profileId;
    data['user_profile']['job'] = this.job;
    data['user_profile']['study_place'] = this.studyPlace;
    data['user_profile']['place_stay'] = this.placeStay;
    data['user_profile']['place_born'] = this.placeBorn;
    data['user_profile']['bio'] = this.bio;
    data['user_profile']['cover_photo'] = this.coverPhoto;
    data['user_profile']['profile_photo'] = this.profilePhoto;
    data['user_profile']['followers_number'] = this.followersNumber;
    data['user_profile']['state'] = this.state;
    data['user_profile']['user_id'] = this.id;
    data['user_profile']['created_at'] = this.createdAt;
    data['user_profile']['updated_at'] = this.updatedAt;

    return data;
  }


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