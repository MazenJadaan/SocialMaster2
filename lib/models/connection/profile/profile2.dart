

class ProfileResponse {
  Data? data;
  String? message;
  int? status;

  ProfileResponse({this.data, this.message, this.status});

  ProfileResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  ProfileInformation? profileInformation;
  List<AllPosts>? allPosts;

  Data({this.profileInformation, this.allPosts});

  Data.fromJson(Map<String, dynamic> json) {
    profileInformation = json['profile information'] != null
        ? new ProfileInformation.fromJson(json['profile information'])
        : null;
    if (json['all posts'] != null) {
      allPosts =  <AllPosts>[];
      json['all posts'].forEach((v) {
        allPosts?.add(new AllPosts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.profileInformation != null) {
      data['profile information'] = this.profileInformation?.toJson();
    }
    if (this.allPosts != null) {
      data['all posts'] = this.allPosts?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProfileInformation {
  int? id;
  String? firstName;
  String? lastName;
  String? gender;
  String? birthdate;
  UserProfile? userProfile;

  ProfileInformation(
      {this.id,
        this.firstName,
        this.lastName,
        this.gender,
        this.birthdate,
        this.userProfile});

  ProfileInformation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    gender = json['gender'];
    birthdate = json['birthdate'];
    userProfile = json['user_profile'] != null
        ? new UserProfile.fromJson(json['user_profile'])
        : null;



  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['gender'] = this.gender;
    data['birthdate'] = this.birthdate;
    if (this.userProfile != null) {
      data['user_profile'] = this.userProfile?.toJson();
    }
    return data;
  }
}

class UserProfile {
  int? id;
  String? job;
  String? studyPlace;
  String? placeStay;
  String? placeBorn;
  String? bio;
  String? coverPhoto;
  String? profilePhoto;
  int? followersNumber;
  int? followingNumber;
  String? state;
  int? userId;
  String? createdAt;
  String? updatedAt;

  UserProfile(
      {this.id,
        this.job,
        this.studyPlace,
        this.placeStay,
        this.placeBorn,
        this.bio,
        this.coverPhoto,
        this.profilePhoto,
        this.followersNumber,
        this.followingNumber,
        this.state,
        this.userId,
        this.createdAt,
        this.updatedAt});

  UserProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    job = json['job'];
    studyPlace = json['study_place'];
    placeStay = json['place_stay'];
    placeBorn = json['place_born'];
    bio = json['bio'];
    coverPhoto = json['cover_photo'];
    profilePhoto = json['profile_photo'];
    followersNumber = json['followers_number'];
    followingNumber = json['following_number'];
    state = json['state'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['job'] = this.job;
    data['study_place'] = this.studyPlace;
    data['place_stay'] = this.placeStay;
    data['place_born'] = this.placeBorn;
    data['bio'] = this.bio;
    data['cover_photo'] = this.coverPhoto;
    data['profile_photo'] = this.profilePhoto;
    data['followers_number'] = this.followersNumber;
    data['state'] = this.state;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class AllPosts {
  int? id;
  String? firstName;
  String? lastName;
  List<Post>? post;
  List<Sharepost>? sharepost;

  AllPosts({this.id, this.firstName, this.lastName, this.post, this.sharepost});

  AllPosts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    if (json['post'] != null) {
      post = <Post>[];
      json['post'].forEach((v) {
        post?.add(new Post.fromJson(v));
      });
    }
    if (json['sharepost'] != null) {
      sharepost = <Sharepost>[];
      json['sharepost'].forEach((v) {
        sharepost?.add(new Sharepost.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    if (this.post != null) {
      data['post'] = this.post?.map((v) => v.toJson()).toList();
    }
    if (this.sharepost != null) {
      data['sharepost'] = this.sharepost?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Post {
  int? id;
  int? userId;
  int? userProfileId;
  String? postBody;
  String? postTime;
  String? postDate;
  int? reaction;
  int? saved;
  int? likes;
  int? comments;
  int? shares;
  String? createdAt;
  String? updatedAt;
  String? video;
  List<Photo>? photo;


  Post(
      {this.id,
        this.userId,
        this.userProfileId,
        this.postBody,
        this.postTime,
        this.postDate,
        this.reaction,
        this.saved,
        this.likes,
        this.comments,
        this.shares,
        this.createdAt,
        this.updatedAt,
        this.photo,
        this.video});

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    userProfileId = json['user_profile_id'];
    postBody = json['post_body'];
    postTime = json['post_time'];
    postDate = json['post_date'];
    comments = json['comment_count'];
    shares = json['share_post_count'];
    likes = json['like_count'];
    reaction = json['reaction'];
    saved = json['saved'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    video =json['post_video'];
    if (json['photo'] != null) {
      photo = <Photo>[];
      json['photo'].forEach((v) {
        photo?.add(new Photo.fromJson(v));
      });
    }


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['user_profile_id'] = this.userProfileId;
    data['post_body'] = this.postBody;
    data['post_time'] = this.postTime;
    data['post_date'] = this.postDate;
    data['comment_count'] = this.comments;
    data['like_count'] = this.likes;
    data['share_post_count']=this.shares;
    data['saved']= this.saved;
    data['reaction']=this.reaction;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['post_video'] =this.video;

    if (this.photo != null) {
      data['photo'] = this.photo?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Photo {
  int? id;
  int? postId;
  String? photoPath;
  String? createdAt;
  String? updatedAt;

  Photo({this.id, this.postId, this.photoPath, this.createdAt, this.updatedAt});

  Photo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    postId = json['post_id'];
    photoPath = json['photo_path'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['post_id'] = this.postId;
    data['photo_path'] = this.photoPath;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Sharepost {
  int? id;
  int? userId;
  int? postId;
  String? body;
  String? createdAt;
  String? updatedAt;
  Post? post;

  Sharepost(
      {this.id,
        this.userId,
        this.postId,
        this.body,
        this.createdAt,
        this.updatedAt,
        this.post});

  Sharepost.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    postId = json['post_id'];
    body = json['body'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    post = json['post'] != null ? new Post.fromJson(json['post']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['post_id'] = this.postId;
    data['body'] = this.body;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.post != null) {
      data['post'] = this.post?.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? firstName;
  String? lastName;

  User({this.id, this.firstName, this.lastName});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    return data;
  }
}
