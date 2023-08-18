class AllFollowingStoryResponse {
  List<UserData>? data;
  String? message;
  int? status;

  AllFollowingStoryResponse({this.data, this.message, this.status});

  AllFollowingStoryResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <UserData>[];
      json['data'].forEach((v) {
        data!.add(new UserData.fromJson(v));
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

class UserData {
  int? id;
  String? firstName;
  String? lastName;
  UserProfile? userProfile;
  List<Story>? story;

  UserData({this.id, this.firstName, this.lastName, this.userProfile, this.story});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    userProfile = json['user_profile'] != null
        ? new UserProfile.fromJson(json['user_profile'])
        : null;
    if (json['story'] != null) {
      story = <Story>[];
      json['story'].forEach((v) {
        story!.add(new Story.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    if (this.userProfile != null) {
      data['user_profile'] = this.userProfile!.toJson();
    }
    if (this.story != null) {
      data['story'] = this.story!.map((v) => v.toJson()).toList();
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

class Story {
  int? id;
  int? userId;
  int? userProfileId;
  String? storyBody;
  String? storyDate;
  String? storyDateExpire;
  String? storyTime;
  String? media;
  String? createdAt;
  String? updatedAt;

  Story(
      {this.id,
        this.userId,
        this.userProfileId,
        this.storyBody,
        this.storyDate,
        this.storyDateExpire,
        this.storyTime,
        this.media,
        this.createdAt,
        this.updatedAt});

  Story.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    userProfileId = json['user_profile_id'];
    storyBody = json['story_body'];
    storyDate = json['story_date'];
    storyDateExpire = json['story_date_expire'];
    storyTime = json['story_time'];
    media = json['media'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['user_profile_id'] = this.userProfileId;
    data['story_body'] = this.storyBody;
    data['story_date'] = this.storyDate;
    data['story_date_expire'] = this.storyDateExpire;
    data['story_time'] = this.storyTime;
    data['media'] = this.media;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
