import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_master/models/connection/profile/edit_profile.dart';
import 'package:social_master/shared/validate/validate.dart';
import '../../models/provider/usermodel.dart';
import '../../shared/network/constant/constant.dart';
import '../../shared/shared_preferences.dart';
import '../../shared/styles/colors.dart';
import '../../shared/components/components.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class EditProfile extends StatefulWidget {
  EditProfile(this.user, {Key? key}) : super(key: key);
  UserModel user;

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {



  late final TextEditingController _firstNameController =
      TextEditingController(text: widget.user.firstName);

  late final TextEditingController _lastNameController =
      TextEditingController(text: widget.user.lastName);

  late final TextEditingController _studyController = TextEditingController(
      text: widget.user.studyPlace
  );
  late final TextEditingController _placeOfLivingController = TextEditingController(
      text: widget.user.placeStay
  );
  late final TextEditingController _placeOfBirthController = TextEditingController(
      text: widget.user.placeBorn
  );
  late final TextEditingController _bioController = TextEditingController(
      text: widget.user.bio
  );
  late final TextEditingController _jobController = TextEditingController(
      text: widget.user.job
  );
  late final TextEditingController _stateController = TextEditingController(
      text: widget.user.state
  );



  Future editProfileFunc({
    required EditProfileParams params,
}) async {
    var url =
    Uri.parse("${AppSetting.baseUrl}${AppSetting.editProfileInfoApi}");
    var response =await http.post(url, headers: {"Authorization": "Bearer ${Prefs.getToken()}"},
        body: params.toJson());
    jsonDecode(response.body);

    if (response.statusCode == 200) {
      print('done');
    } else {
      print('d');
    }

}





  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Edit your Profile",
          style: TextStyle(),
        )),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Edit your profile information:',
                    style: TextStyle(
                        fontFamily: 'SignikaNegative',
                        fontSize: 16,
                        color: AppTheme.colors.darkPurple,
                        fontWeight: FontWeight.bold)),
              ),

              Row(
                children: [
                  Expanded(
                    child: smallTextFormField(
                      validate: Validate.emptyValidate,
                      controller: _firstNameController,
                      label: 'first name',
                    ),
                  ),
                  Expanded(
                    child: smallTextFormField(
                      validate: Validate.emptyValidate,
                      controller: _lastNameController,
                      label: "last name",
                    ),
                  ),
                ],
              ),
              captionTextFormField(controller: _bioController, label: 'write your bio',maxlines: 2),

              myTextFormField(
                validate: Validate.nullValidate,
                  suffixOnPressed: () {},
                  prefixIcon: Icon(
                    Icons.work,
                    color: AppTheme.colors.purple,
                  ),
                  controller: _jobController,
                  label: "Job",
                  ),

              myTextFormField(
                validate: Validate.nullValidate,
                suffixOnPressed: () {},
                prefixIcon: Icon(
                  Icons.work,
                  color: AppTheme.colors.purple,
                ),
                controller: _placeOfBirthController,
                label: "place of birth",
                ),

              myTextFormField(
                validate: Validate.nullValidate,
                suffixOnPressed: () {},
                prefixIcon: Icon(
                  Icons.work,
                  color: AppTheme.colors.purple,
                ),
                controller: _placeOfLivingController,
                label: "place of living",
                 ),

              myTextFormField(
                validate: Validate.nullValidate,
                suffixOnPressed: () {},
                prefixIcon: Icon(
                  FontAwesomeIcons.solidHeart,
                  color: AppTheme.colors.purple,
                ),
                controller: _studyController,
                label: "study place",
                 ),

              myTextFormField(
                validate: Validate.nullValidate,
                suffixOnPressed: () {},
                prefixIcon: Icon(
                  FontAwesomeIcons.solidHeart,
                  color: AppTheme.colors.purple,
                ),
                controller: _stateController,
                label: "relationship state",
                 ),





          const SizedBox(
                height: 10,
              ),
              Center(
                child: myMaterialButton(
                    width: 240,
                    height: 50,
                    text: "Confirm Changes",
                    fontSize: 22,
                    onPressed: () {
                      if(formKey.currentState!.validate()){
                        editProfileFunc(params: EditProfileParams(bio: _bioController.text,
                          // fName: _firstNameController.text,
                          // lName: _lastNameController.text,
                            job: _jobController.text,
                          place_born: _placeOfBirthController.text,
                          place_stay: _placeOfLivingController.text,
                          state: _stateController.text,
                          study_place: _studyController.text
                        ));
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
