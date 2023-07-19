// import 'package:social_master/models/post/postmodel.dart';
//
// class AllPosts{
//   int? id;
//   String? firstName;
//   String? lastName;
//   List<PostModel>? post;
//   List<SharedPostModel>? sharepost;
//
//   AllPosts({this.id, this.firstName, this.lastName, this.post, this.sharepost});
//
//
//   AllPosts.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     firstName = json['first_name'];
//     lastName = json['last_name'];
//     if (json['post'] != null) {
//       post = new List<PostModel>;
//       json['post'].forEach((v) {
//         post!.add(new PostModel.fromJson(v));
//       });
//     }
//     if (json['sharepost'] != null) {
//       sharepost = new List<SharedPostModel>();
//       json['sharepost'].forEach((v) {
//         sharepost.add(new SharedPostModel.fromJson(v));
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