class commentParams {
  late String comment;

  commentParams({required this.comment});

  commentParams.fromJson(Map<String, dynamic> json) {
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comment'] = this.comment;
    return data;
  }
}

class CreateComments {
  Data? data;
  String? message;
  int? status;

  CreateComments({this.data, this.message, this.status});

  CreateComments.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class createCommentData {
  UserName? userName;
  ProfilePhoto? profilePhoto;
  CommentInfo? commentInfo;

  createCommentData({this.userName, this.profilePhoto, this.commentInfo});

  createCommentData.fromJson(Map<String, dynamic> json) {
    userName = json['user_name'] != null
        ? new UserName.fromJson(json['user_name'])
        : null;
    profilePhoto = json['profile_photo'] != null
        ? new ProfilePhoto.fromJson(json['profile_photo'])
        : null;
    commentInfo = json['comment_info'] != null
        ? new CommentInfo.fromJson(json['comment_info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userName != null) {
      data['user_name'] = this.userName!.toJson();
    }
    if (this.profilePhoto != null) {
      data['profile_photo'] = this.profilePhoto!.toJson();
    }
    if (this.commentInfo != null) {
      data['comment_info'] = this.commentInfo!.toJson();
    }
    return data;
  }
}

class UserName {
  String? firstName;
  String? lastName;

  UserName({this.firstName, this.lastName});

  UserName.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    return data;
  }
}

class ProfilePhoto {
  String? profilePhoto;

  ProfilePhoto({this.profilePhoto});

  ProfilePhoto.fromJson(Map<String, dynamic> json) {
    profilePhoto = json['profile_photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profile_photo'] = this.profilePhoto;
    return data;
  }
}

class CommentInfo {
  int? userId;
  String? postId;
  String? comment;
  int? postOwner;
  String? updatedAt;
  String? createdAt;
  int? id;

  CommentInfo(
      {this.userId,
        this.postId,
        this.comment,
        this.postOwner,
        this.updatedAt,
        this.createdAt,
        this.id});

  CommentInfo.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    postId = json['post_id'];
    comment = json['comment'];
    postOwner = json['post_owner'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['post_id'] = this.postId;
    data['comment'] = this.comment;
    data['post_owner'] = this.postOwner;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}






class showCommentsResponse {
  List<Data>? data;
  String? message;
  int? status;

  showCommentsResponse({this.data, this.message, this.status});

  showCommentsResponse.fromJson(Map<String, dynamic> json) {
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
  String? comment;
  int? userId;
  User? user;

  Data({this.id, this.comment, this.userId, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    comment = json['comment'];
    userId = json['user_id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['comment'] = this.comment;
    data['user_id'] = this.userId;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
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








