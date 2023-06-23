



import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostModel extends ChangeNotifier {
  String? userImage;
  String? image='';
  String date = "30/7/2001";
  String caption = "";
  String userName = "Anonymous";
  int likes = 0;
  int comments = 0;
  int shares = 0;
  bool isLiked = false;
  Color likeColor =Colors.white;
  bool isSaved = false;
  Color saveColor =Colors.white;

  PostModel({
    required this.likes,
    required this.comments,
    required this.shares,
    required this.caption,
    required this.userName,
    required this.date,
    required this.isLiked,
    required this.isSaved,
    this.image,
    this.userImage,

  });

  handleLike(){
    isLiked == false ? likeColor=Colors.red : likeColor=Colors.white;
    isLiked = !isLiked;
    notifyListeners();
  }
  handleSave(){
    isSaved == false ? saveColor=Colors.orange : saveColor=Colors.white;
    isSaved = !isSaved;
    notifyListeners();
  }

}




class MyPostModel extends ChangeNotifier{
  String? userImage;
  String? image='';
  String date = "30/7/2001";
  String caption = "";
  String userName = "Anonymous";
  int likes = 0;
  int comments = 0;
  int shares = 0;
  bool isLiked = false;
  Color likeColor =Colors.white;
  bool isSaved = false;
  Color saveColor =Colors.white;

  MyPostModel({
    required this.likes,
    required this.comments,
    required this.shares,
    required this.caption,
    required this.date,
    required this.userName,
    required this.isLiked,
    required this.isSaved,
    this.image,
    this.userImage,
  });

  handleLike(){
    isLiked == false ? likeColor=Colors.red : likeColor=Colors.white;
    isLiked = !isLiked;
    notifyListeners();
  }
  handleSave(){
    isSaved == false ? saveColor=Colors.orange : saveColor=Colors.white;
    isSaved = !isSaved;
    notifyListeners();
  }
}
