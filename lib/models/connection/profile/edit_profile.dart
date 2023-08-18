import 'package:social_master/modules/app/edit_profile.dart';

class EditProfileParams {
  late String? bio;
  // late String? lName;
  // late String? fName;
  late String? job;
  late String? study_place;
  late String? place_stay;
  late String? place_born;
  late String? state;

  EditProfileParams(
      {required this.job,
      required this.state,
      required this.bio,
      // required this.fName,
      // required this.lName,
      required this.place_born,
      required this.place_stay,
      required this.study_place});

  // ShareParams.fromJson(Map<String, dynamic> json) {
  //   bio = json['bio'];
  //
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bio'] = this.bio;
    data['job'] = this.job;
    data['study_place'] = this.study_place;
    data['place_stay'] = this.place_stay;
    data['place_born'] = this.place_born;
    data['state'] = this.state;
    // data[''] = this.fName;
    // data[''] = this.lName;

    return data;
  }
}
