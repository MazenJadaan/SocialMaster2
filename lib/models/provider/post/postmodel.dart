import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_master/modules/app/handle_post/like_at_post.dart';
import 'package:social_master/modules/app/handle_post/save_post.dart';

class PostModel extends ChangeNotifier {
  int? userId;
  int? userProfileId;
  int? id;
  int? postId;
  String? userImage;
  List<String>? images=[];
  String? video;
  String? date = "30/7/2001";
  String? caption = "";
  String? userFName;
  String? userLName;
  int? likes = 0;
  int? comments = 0;
  int? shares = 0;
  bool? isLiked = false;
  Color? likeColor;
  bool? isSaved = false;
  Color? saveColor;

  PostModel({
    this.postId,
    this.userId,
    this.userProfileId,
    this.likes,
     this.comments,
     this.shares,
     this.caption,
     this.userFName,
     this.userLName,
     this.date,
    this.isLiked,
     this.isSaved,
    this.images,
    this.userImage,
    this.video,
  }) {
    this.likeColor = isLiked! ? Colors.red : Colors.white;
    this.saveColor = isSaved! ? Colors.orange : Colors.white;
  }

  handleLike() {
    isLiked == false ? likeColor = Colors.red : likeColor = Colors.white;
    isLiked==false ? likePost(postId: this.postId!)  :dislikePost(postId: this.postId!);
    isLiked==false? likes=likes! +1 : likes= likes! -1 ;
    this.isLiked = !isLiked!;
    notifyListeners();
  }

  handleSave() {
    this.isSaved = !isSaved!;
    this.isSaved! ? saveColor = Colors.orange : saveColor = Colors.white;
    this.isSaved! ? savePost(postId: this.postId!):savePost(postId: this.postId!);

    if (this.isSaved!) {
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
  int? userId;
  int? userProfileId;
  int? id;
  int? postId;
  String? userImage;
  List<String>? images=[];
  String? video;
  String? date = "30/7/2001";
  String? caption = "";
  String? userFName;
  String? userLName;
  int? likes = 0;
  int? comments = 0;
  int? shares = 0;
  bool? isLiked = false;
  Color? likeColor;
  bool? isSaved = false;
  Color? saveColor;

  MyPostModel({
    this.userId,
    this.userProfileId,
    this.postId,
    this.id,
     this.likes,
     this.comments,
     this.shares,
     this.caption,
     this.date,
     this.userFName,
     this.userLName,
     this.isLiked,
     this.isSaved,
     this.images,
    this.video,
    this.userImage,
  }) {
    this.likeColor = isLiked! ? Colors.red : Colors.white;
    this.saveColor = isSaved! ? Colors.orange : Colors.white;
  }

  handleLike() {
    isLiked == false ? likeColor = Colors.red : likeColor = Colors.white;
    isLiked==false ? likePost(postId: this.postId!):dislikePost(postId: this.postId!);
    isLiked==false? likes=likes! +1 : likes= likes! -1 ;
    this.isLiked = !isLiked!;
    notifyListeners();
  }

  handleSave() {
    this.isSaved = !isSaved!;
    this.isSaved! ? saveColor = Colors.orange : saveColor = Colors.white;

    if (this.isSaved!) {
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
  int? id;
  int? userId;
  String? userImage;
  String? date ;
  String? caption ;
  String? userFName;
  String? userLName;
  PostModel? post;

  SharedPostModel({
    this.userId,
    this.id,
    this.caption,
    this.date,
    this.userFName,
    this.userLName,
    this.post,
    this.userImage,
  });

  doSomething() => notifyListeners();
}
