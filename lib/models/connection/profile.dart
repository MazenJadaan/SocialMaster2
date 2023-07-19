// import 'package:social_master/models/usermodel.dart';
//
// class ProfileResponse {
//   Data? data;
//   String? message;
//   int? status;
//
//   ProfileResponse({this.data, this.message, this.status});
//
//   ProfileResponse.fromJson(Map<String, dynamic> json) {
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//     message = json['message'];
//     status = json['status'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data?.toJson();
//     }
//     data['message'] = this.message;
//     data['status'] = this.status;
//     return data;
//   }
// }
// class ProfileData{
//   UserModel? userModel;
//   ProfileData({this.userModel});
//
//
//   ProfileData.fromJson(Map<String,dynamic> json){
//     userModel =  json['profile information'] != null
//         ? new UserModel.fromJson(json['profile information'])
//         : null;
//   }
//
// }
//
//
//
//
// class Data {
//   UserModel? userModel;
//   List<AllPosts>? allPosts;
//
//   Data({ this.userModel, this.allPosts});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     userModel = json['profile information'] != null
//         ? new UserModel.fromJson(json['profile information'])
//         : null;
//     if (json['all posts'] != null) {
//       allPosts = new List<AllPosts>();
//       json['all posts'].forEach((v) {
//         allPosts.add(new AllPosts.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.userModel != null) {
//       data['profile information'] = this.userModel!.toJson();
//     }
//     if (this.allPosts != null) {
//       data['all posts'] = this.allPosts.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// // class ProfileInformation {
// //   int id;
// //   String firstName;
// //   String lastName;
// //   String gender;
// //   String birthdate;
// //   UserProfile? userProfile;
// //
// //   ProfileInformation(
// //       {this.id,
// //         this.firstName,
// //         this.lastName,
// //         this.gender,
// //         this.birthdate,
// //         this.userProfile});
// //
// //   ProfileInformation.fromJson(Map<String, dynamic> json) {
// //     id = json['id'];
// //     firstName = json['first_name'];
// //     lastName = json['last_name'];
// //     gender = json['gender'];
// //     birthdate = json['birthdate'];
// //     userProfile = json['user_profile'] != null
// //         ? new UserProfile.fromJson(json['user_profile'])
// //         : null;
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['id'] = this.id;
// //     data['first_name'] = this.firstName;
// //     data['last_name'] = this.lastName;
// //     data['gender'] = this.gender;
// //     data['birthdate'] = this.birthdate;
// //     if (this.userProfile != null) {
// //       data['user_profile'] = this.userProfile.toJson();
// //     }
// //     return data;
// //   }
// // }
// //
// // class UserProfile {
// //   int id;
// //   Null job;
// //   Null studyPlace;
// //   Null placeStay;
// //   Null placeBorn;
// //   Null bio;
// //   String coverPhoto;
// //   String profilePhoto;
// //   int followersNumber;
// //   Null state;
// //   int userId;
// //   String createdAt;
// //   String updatedAt;
// //
// //   UserProfile(
// //       {this.id,
// //         this.job,
// //         this.studyPlace,
// //         this.placeStay,
// //         this.placeBorn,
// //         this.bio,
// //         this.coverPhoto,
// //         this.profilePhoto,
// //         this.followersNumber,
// //         this.state,
// //         this.userId,
// //         this.createdAt,
// //         this.updatedAt});
// //
// //   UserProfile.fromJson(Map<String, dynamic> json) {
// //     id = json['id'];
// //     job = json['job'];
// //     studyPlace = json['study_place'];
// //     placeStay = json['place_stay'];
// //     placeBorn = json['place_born'];
// //     bio = json['bio'];
// //     coverPhoto = json['cover_photo'];
// //     profilePhoto = json['profile_photo'];
// //     followersNumber = json['followers_number'];
// //     state = json['state'];
// //     userId = json['user_id'];
// //     createdAt = json['created_at'];
// //     updatedAt = json['updated_at'];
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['id'] = this.id;
// //     data['job'] = this.job;
// //     data['study_place'] = this.studyPlace;
// //     data['place_stay'] = this.placeStay;
// //     data['place_born'] = this.placeBorn;
// //     data['bio'] = this.bio;
// //     data['cover_photo'] = this.coverPhoto;
// //     data['profile_photo'] = this.profilePhoto;
// //     data['followers_number'] = this.followersNumber;
// //     data['state'] = this.state;
// //     data['user_id'] = this.userId;
// //     data['created_at'] = this.createdAt;
// //     data['updated_at'] = this.updatedAt;
// //     return data;
// //   }
// // }
//
// class AllPosts {
//   int id;
//   String firstName;
//   String lastName;
//   List<Post> post;
//   List<Sharepost> sharepost;
//
//   AllPosts({this.id, this.firstName, this.lastName, this.post, this.sharepost});
//
//   AllPosts.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     firstName = json['first_name'];
//     lastName = json['last_name'];
//     if (json['post'] != null) {
//       post = new List<Post>();
//       json['post'].forEach((v) {
//         post.add(new Post.fromJson(v));
//       });
//     }
//     if (json['sharepost'] != null) {
//       sharepost = new List<Sharepost>();
//       json['sharepost'].forEach((v) {
//         sharepost.add(new Sharepost.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['first_name'] = this.firstName;
//     data['last_name'] = this.lastName;
//     if (this.post != null) {
//       data['post'] = this.post.map((v) => v.toJson()).toList();
//     }
//     if (this.sharepost != null) {
//       data['sharepost'] = this.sharepost.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Post {
//   int id;
//   int userId;
//   int userProfileId;
//   String postBody;
//   String postTime;
//   String postDate;
//   String createdAt;
//   String updatedAt;
//   List<Photo> photo;
//   List<Video> video;
//
//   Post(
//       {this.id,
//         this.userId,
//         this.userProfileId,
//         this.postBody,
//         this.postTime,
//         this.postDate,
//         this.createdAt,
//         this.updatedAt,
//         this.photo,
//         this.video});
//
//   Post.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['user_id'];
//     userProfileId = json['user_profile_id'];
//     postBody = json['post_body'];
//     postTime = json['post_time'];
//     postDate = json['post_date'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     if (json['photo'] != null) {
//       photo = new List<Photo>();
//       json['photo'].forEach((v) {
//         photo.add(new Photo.fromJson(v));
//       });
//     }
//     if (json['video'] != null) {
//       video = new List<Video>();
//       json['video'].forEach((v) {
//         video.add(new Video.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['user_id'] = this.userId;
//     data['user_profile_id'] = this.userProfileId;
//     data['post_body'] = this.postBody;
//     data['post_time'] = this.postTime;
//     data['post_date'] = this.postDate;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     if (this.photo != null) {
//       data['photo'] = this.photo.map((v) => v.toJson()).toList();
//     }
//     if (this.video != null) {
//       data['video'] = this.video.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Photo {
//   int id;
//   int postId;
//   String photoPath;
//   String createdAt;
//   String updatedAt;
//
//   Photo({this.id, this.postId, this.photoPath, this.createdAt, this.updatedAt});
//
//   Photo.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     postId = json['post_id'];
//     photoPath = json['photo_path'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['post_id'] = this.postId;
//     data['photo_path'] = this.photoPath;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
//
// class Video {
//   int id;
//   int postId;
//   String videoPath;
//   String createdAt;
//   String updatedAt;
//
//   Video({this.id, this.postId, this.videoPath, this.createdAt, this.updatedAt});
//
//   Video.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     postId = json['post_id'];
//     videoPath = json['video_path'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['post_id'] = this.postId;
//     data['video_path'] = this.videoPath;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }
//
// class Sharepost {
//   int id;
//   int userId;
//   int postId;
//   String body;
//   String createdAt;
//   String updatedAt;
//   Post post;
//
//   Sharepost(
//       {this.id,
//         this.userId,
//         this.postId,
//         this.body,
//         this.createdAt,
//         this.updatedAt,
//         this.post});
//
//   Sharepost.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['user_id'];
//     postId = json['post_id'];
//     body = json['body'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     post = json['post'] != null ? new Post.fromJson(json['post']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['user_id'] = this.userId;
//     data['post_id'] = this.postId;
//     data['body'] = this.body;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     if (this.post != null) {
//       data['post'] = this.post.toJson();
//     }
//     return data;
//   }
// }
//
// class Post {
//   int id;
//   int userId;
//   int userProfileId;
//   String postBody;
//   String postTime;
//   String postDate;
//   String createdAt;
//   String updatedAt;
//   User user;
//   List<Photo> photo;
//   List<Null> video;
//
//   Post(
//       {this.id,
//         this.userId,
//         this.userProfileId,
//         this.postBody,
//         this.postTime,
//         this.postDate,
//         this.createdAt,
//         this.updatedAt,
//         this.user,
//         this.photo,
//         this.video});
//
//   Post.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['user_id'];
//     userProfileId = json['user_profile_id'];
//     postBody = json['post_body'];
//     postTime = json['post_time'];
//     postDate = json['post_date'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     user = json['user'] != null ? new User.fromJson(json['user']) : null;
//     if (json['photo'] != null) {
//       photo = new List<Photo>();
//       json['photo'].forEach((v) {
//         photo.add(new Photo.fromJson(v));
//       });
//     }
//     if (json['video'] != null) {
//       video = new List<Null>();
//       json['video'].forEach((v) {
//         video.add(new Null.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['user_id'] = this.userId;
//     data['user_profile_id'] = this.userProfileId;
//     data['post_body'] = this.postBody;
//     data['post_time'] = this.postTime;
//     data['post_date'] = this.postDate;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     if (this.user != null) {
//       data['user'] = this.user.toJson();
//     }
//     if (this.photo != null) {
//       data['photo'] = this.photo.map((v) => v.toJson()).toList();
//     }
//     if (this.video != null) {
//       data['video'] = this.video.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class User {
//   int id;
//   String firstName;
//   String lastName;
//
//   User({this.id, this.firstName, this.lastName});
//
//   User.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     firstName = json['first_name'];
//     lastName = json['last_name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['first_name'] = this.firstName;
//     data['last_name'] = this.lastName;
//     return data;
//   }
// }
//
