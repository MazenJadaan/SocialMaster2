import 'package:flutter/material.dart';

class PostModel extends ChangeNotifier {
  String? userImage;
  String? image='';
  String? vid='';
  String date = "30/7/2001";
  String caption = "";
  String userName = "Anonymous";
  int likes = 0;
  int comments = 0;
  int shares = 0;
  bool isLiked = false;
  Color? likeColor ;
  bool isSaved = false;
  Color? saveColor ;

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
    this.vid,

  }){
    this.likeColor = isLiked ? Colors.red:Colors.white;
    this.saveColor = isSaved ?Colors.orange:Colors.white;
  }

  handleLike(){
    isLiked == false ? likeColor=Colors.red : likeColor=Colors.white;
    this.isLiked = !isLiked;
    notifyListeners();
  }
  handleSave(){
    isSaved == false ? saveColor=Colors.orange : saveColor=Colors.white;
    this.isSaved = !isSaved;
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
  Color? likeColor;
  bool isSaved = false;
  Color? saveColor ;

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

  }){
    this.likeColor = isLiked ? Colors.red:Colors.white;
    this.saveColor = isSaved ?Colors.orange:Colors.white;
  }

  handleLike(){
    isLiked == false ? likeColor=Colors.red : likeColor=Colors.white;
    this.isLiked = !isLiked;
    notifyListeners();
  }
  handleSave(){
    isSaved == false ? saveColor=Colors.orange : saveColor=Colors.white;
    this.isSaved = !isSaved;
    notifyListeners();
  }
  videoPlayer(){

  }
}

class SharedPostModel extends ChangeNotifier{
  String? userImage;
  String date = "30/7/2001";
  String caption = "";
  String userName = "Anonymous";
  PostModel post;

  SharedPostModel({
    required this.caption,
    required this.date,
    required this.userName,
    required this.post,
    this.userImage,
  });
  doSomething()=>notifyListeners();


}
