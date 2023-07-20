import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PostModel extends ChangeNotifier {
  String? userImage;
  List<String>? images;
  String? vid;
  String date = "30/7/2001";
  String caption = "";
  String userFName;
  String userLName;
  int likes = 0;
  int comments = 0;
  int shares = 0;
  bool isLiked = false;
  Color? likeColor;
  bool isSaved = false;
  Color? saveColor;

  PostModel({
    required this.likes,
    required this.comments,
    required this.shares,
    required this.caption,
    required this.userFName,
    required this.userLName,
    required this.date,
    required this.isLiked,
    required this.isSaved,
    this.images,
    this.userImage,
    this.vid,
  }) {
    this.likeColor = isLiked ? Colors.red : Colors.white;
    this.saveColor = isSaved ? Colors.orange : Colors.white;
  }

  handleLike() {
    isLiked == false ? likeColor = Colors.red : likeColor = Colors.white;
    this.isLiked = !isLiked;
    notifyListeners();
  }

  handleSave() {
    this.isSaved = !isSaved;
    this.isSaved ? saveColor = Colors.orange : saveColor = Colors.white;

    if (this.isSaved) {
      Fluttertoast.showToast(
          msg: "Saved",
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.black45,
          fontSize: 16);
    } else {
      Fluttertoast.showToast(
          msg: "Un Saved",
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.black45,
          fontSize: 16);
    }
    notifyListeners();
  }
}

class MyPostModel extends ChangeNotifier {
  String? userImage;
  List<String>? images;
  String date = "30/7/2001";
  String caption = "";
  String userFName;
  String userLName;
  int likes = 0;
  int comments = 0;
  int shares = 0;
  bool isLiked = false;
  Color? likeColor;
  bool isSaved = false;
  Color? saveColor;

  MyPostModel({
    required this.likes,
    required this.comments,
    required this.shares,
    required this.caption,
    required this.date,
    required this.userFName,
    required this.userLName,
    required this.isLiked,
    required this.isSaved,
    required this.images,
    this.userImage,
  }) {
    this.likeColor = isLiked ? Colors.red : Colors.white;
    this.saveColor = isSaved ? Colors.orange : Colors.white;
  }

  handleLike() {
    isLiked == false ? likeColor = Colors.red : likeColor = Colors.white;
    this.isLiked = !isLiked;
    notifyListeners();
  }

  handleSave() {
    this.isSaved = !isSaved;
    this.isSaved ? saveColor = Colors.orange : saveColor = Colors.white;

    if (this.isSaved) {
      Fluttertoast.showToast(
          msg: "Saved",
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.black45,
          fontSize: 16);
    } else {
      Fluttertoast.showToast(
          msg: "Un Saved",
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.black45,
          fontSize: 16);
    }
    notifyListeners();
  }

  videoPlayer() {}
}

class SharedPostModel extends ChangeNotifier {
  String? userImage;
  String date = "30/7/2001";
  String caption = "";
  String userFName;
  String userLName;
  PostModel post;

  SharedPostModel({
    required this.caption,
    required this.date,
    required this.userFName,
    required this.userLName,
    required this.post,
    this.userImage,
  });

  doSomething() => notifyListeners();
}
