import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_master/shared/shared_preferences.dart';
import '../../shared/components/components.dart';
import '../../shared/network/constant/constant.dart';
import '../../shared/styles/colors.dart';
import '../../shared/validate/validate.dart';
import '../app/home.dart';
import 'package:http/http.dart' as http;

class SignupDetails extends StatefulWidget {
  const SignupDetails({Key? key}) : super(key: key);

  @override
  State<SignupDetails> createState() => _SignupDetailsState();
}

class _SignupDetailsState extends State<SignupDetails> {
  final _phoneNumberController = TextEditingController();

  DateTime date = DateTime.now();
  String? token = Prefs.getToken();
  File? image = null;
  bool isLoading = false;

  Future<bool> signupDetails({
    required String phone_num,
    required String gender,
    required String birthdate,
    String? profile_photo = null,
    required String token,
  }) async {
    //create multipart request for POST or PATCH method
    var request = http.MultipartRequest("POST",
        Uri.parse("${AppSetting.baseUrl}${AppSetting.completeRegisterApi}"));
    //add text fields
    request.fields["phone_num"] = phone_num;
    request.fields["gender"] = gender;
    request.fields["birthdate"] = birthdate;
    request.headers["Authorization"] = "Bearer $token";
    if (profile_photo != null) {
      //create multipart using filepath, string or bytes
      var pic =
          await http.MultipartFile.fromPath("profile_photo", profile_photo);
      //add multipart to request
      request.files.add(pic);
    } else {
      // request.fields["profile_photo"] =profile_photo;
    }
    var response = await request.send();

    //Get the response from the server
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
     jsonDecode(responseString);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  final ImagePicker picker = ImagePicker();

  Future uploadImage() async {
    try {
      final pickedImage = await picker.pickImage(source: ImageSource.gallery);
      if (pickedImage == null) return;
      final image2 = File(pickedImage.path);
      setState(() {});
      image = image2;
    } on PlatformException catch (e) {
      print('Failed to upload image $e');
    }
  }

  late int selectedRadio;

  @override
  void initState() {
    super.initState();

    selectedRadio = 0;
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Master",
          style: TextStyle(),
        ),),
      body: Form(
        autovalidateMode: AutovalidateMode.always,
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
               const Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.account_box),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Complete your details to Sign up:",
                    style:
                        TextStyle(fontFamily: 'SignikaNegative', fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  GestureDetector(
                    child: CircleAvatar(
                      backgroundColor: const Color(0x30000000),
                      radius: 84,
                      child: image != null
                          ? ClipOval(
                              child: Image.file(
                                image!,
                                height: 165,
                                width: 165,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Container(
                              alignment: const Alignment(0, 3.5),
                              child: const Image(
                                  height: 160,
                                  fit: BoxFit.fitHeight,
                                  image: AssetImage(
                                      'assets/images/profile_image.png')),
                            ),
                    ),
                    onTap: () {
                      uploadImage();
                      setState(() {});
                    },
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 22,
                    child: CircleAvatar(
                      backgroundColor: AppTheme.colors.purple,
                      radius: 20,
                      child: IconButton(
                          color: Colors.white,
                          icon: const FaIcon(
                            FontAwesomeIcons.pencil,
                            size: 19,
                          ),
                          onPressed: () {
                            uploadImage();
                            setState(() {});
                          }),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              myTextFormField(
                  suffixOnPressed: () {},
                  prefixIcon: Icon(
                    Icons.phone,
                    color: AppTheme.colors.purple,
                  ),
                  controller: _phoneNumberController,
                  validate: Validate.emptyValidate,
                  label: "Phone Number",
                  inputType: TextInputType.number),
              const SizedBox(
                height: 10,
              ),
               const Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.person),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Select your gender:",
                    style:
                        TextStyle(fontFamily: 'SignikaNegative', fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              RadioListTile(
                  title:  const Row(
                    children: [
                      Text(
                        'Male',
                        style: TextStyle(
                            fontSize: 28, fontFamily: 'SignikaNegative'),
                      ),
                      Icon(Icons.man)
                    ],
                  ),
                  activeColor: Colors.blue,
                  value: 1,
                  groupValue: selectedRadio,
                  onChanged: (val) {
                    setSelectedRadio(val!);
                  }),
              RadioListTile(
                  title:  const Row(
                    children: [
                      Text(
                        'Female',
                        style: TextStyle(
                            fontSize: 28, fontFamily: 'SignikaNegative'),
                      ),
                      Icon(Icons.woman)
                    ],
                  ),
                  activeColor: Colors.red,
                  value: 2,
                  groupValue: selectedRadio,
                  onChanged: (val) {
                    setSelectedRadio(val!);
                  }),
              const SizedBox(
                height: 10,
              ),
               const Row(children: [
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.calendar_month),
                SizedBox(width: 5),
                Text(
                  "Select your birthday:",
                  style: TextStyle(fontFamily: 'SignikaNegative', fontSize: 16),
                ),
              ]),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: AppTheme.colors.opacityPurple,
                  ),
                  height: 65,
                  child: Row(
                    children: [
                      myMaterialButton(
                          text: 'Select birthday',
                          height: 50,
                          width: 140,
                          fontSize: 16,
                          onPressed: () async {
                            DateTime? newDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime(2001, 7, 30),
                              firstDate: DateTime(1950),
                              lastDate: DateTime(2010),
                            );
                            if (newDate == null) return;
                            date = newDate;
                            setState(() {});
                          }),
                      const Text('d:'),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppTheme.colors.opacityPurple,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            '${date.day}',
                            style: TextStyle(
                                fontSize: 20,
                                color: AppTheme.colors.darkPurple),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      const Text('m:'),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppTheme.colors.opacityPurple,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            '${date.month}',
                            style: TextStyle(
                                fontSize: 20,
                                color: AppTheme.colors.darkPurple),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      const Text('y:'),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppTheme.colors.opacityPurple,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            '${date.year}',
                            style: TextStyle(
                                fontSize: 20,
                                color: AppTheme.colors.darkPurple),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              myMaterialButton(
                  width: 240,
                  isLoading: isLoading,
                  height: 50,
                  text: "Done",
                  onPressed: () async {
                    if (isLoading) {
                      setState(() => isLoading = false);
                    } else {
                      if (formKey.currentState!.validate()) {
                        setState(() => isLoading = true);
                        bool res = await signupDetails(
                          phone_num: _phoneNumberController.text,
                          gender: selectedRadio == 1 ? "male" : "female",
                          profile_photo: image != null ? image!.path : null,
                          birthdate: '${date.month}/${date.day}/${date.year}',
                          token: token!,
                        );

                        if (res) {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) => Home()),
                              (route) => false);
                        } else {
                          setState(() => isLoading = false);
                          Fluttertoast.showToast(
                              msg: "Failed",
                              gravity: ToastGravity.BOTTOM,
                              toastLength: Toast.LENGTH_SHORT,
                              backgroundColor: Colors.pink,
                              timeInSecForIosWeb: 2,
                              fontSize: 16);
                        }
                      }
                    }
                  }),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
