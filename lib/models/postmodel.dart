

class PostModel {
  String? userImage;
  String? image;
  String date = "30/7/2001";
  String caption = "";
  String userName = "Anonymous";
  int likes = 0;
  int comments = 0;
  int shares = 0;

  PostModel({
    required this.likes,
    required this.comments,
    required this.shares,
    required this.caption,
    required this.userName,
    required this.date,
    this.image,
    this.userImage,
  });
}



class MyPostModel {
  String? userImage;
  String? image;
  String date = "30/7/2001";
  String caption = "";
  String userName = "Anonymous";
  int likes = 0;
  int comments = 0;
  int shares = 0;

  MyPostModel({
    required this.likes,
    required this.comments,
    required this.shares,
    required this.caption,
    required this.date,
    required this.userName,
    this.image,
    this.userImage,
  });

}
