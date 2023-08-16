class SavedPostResponse {
  List<Data>? data;
  String? message;
  int? status;

  SavedPostResponse({this.data, this.message, this.status});

  SavedPostResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  int? id;
  Post? post;

  Data({this.id, this.post});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    post = json['post'] != null ? new Post.fromJson(json['post']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.post != null) {
      data['post'] = this.post!.toJson();
    }
    return data;
  }
}

class Post {
  int? id;
  int? userId;
  int? userProfileId;
  String? postBody;
  String? postVideo;
  String? postTime;
  String? postDate;
  int? reaction;
  int? saved;
  String? createdAt;
  String? updatedAt;
  int? likeCount;
  int? commentCount;
  int? sharePostCount;
  List<Photo>? photo;
  User? user;

  Post(
      {this.id,
        this.userId,
        this.userProfileId,
        this.postBody,
        this.postVideo,
        this.postTime,
        this.postDate,
        this.reaction,
        this.saved,
        this.createdAt,
        this.updatedAt,
        this.likeCount,
        this.commentCount,
        this.sharePostCount,
        this.photo,
        this.user});

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    userProfileId = json['user_profile_id'];
    postBody = json['post_body'];
    postVideo = json['post_video'];
    postTime = json['post_time'];
    postDate = json['post_date'];
    reaction = json['reaction'];
    saved = json['saved'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    likeCount = json['like_count'];
    commentCount = json['comment_count'];
    sharePostCount = json['share_post_count'];
    if (json['photo'] != null) {
      photo = <Photo>[];
      json['photo'].forEach((v) {
        photo!.add(new Photo.fromJson(v));
      });
    }
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['user_profile_id'] = this.userProfileId;
    data['post_body'] = this.postBody;
    data['post_video'] = this.postVideo;
    data['post_time'] = this.postTime;
    data['post_date'] = this.postDate;
    data['reaction'] = this.reaction;
    data['saved'] = this.saved;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['like_count'] = this.likeCount;
    data['comment_count'] = this.commentCount;
    data['share_post_count'] = this.sharePostCount;
    if (this.photo != null) {
      data['photo'] = this.photo!.map((v) => v.toJson()).toList();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class Photo {
  int? postId;
  String? photoPath;

  Photo({this.postId, this.photoPath});

  Photo.fromJson(Map<String, dynamic> json) {
    postId = json['post_id'];
    photoPath = json['photo_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['post_id'] = this.postId;
    data['photo_path'] = this.photoPath;
    return data;
  }
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  UserProfile? userProfile;

  User({this.id, this.firstName, this.lastName, this.userProfile});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    userProfile = json['user_profile'] != null
        ? new UserProfile.fromJson(json['user_profile'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    if (this.userProfile != null) {
      data['user_profile'] = this.userProfile!.toJson();
    }
    return data;
  }
}

class UserProfile {
  int? userId;
  String? profilePhoto;

  UserProfile({this.userId, this.profilePhoto});

  UserProfile.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    profilePhoto = json['profile_photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['profile_photo'] = this.profilePhoto;
    return data;
  }
}
