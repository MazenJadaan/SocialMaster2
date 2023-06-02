import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:social_master/models/provider/ismale.dart';
import 'package:social_master/models/validate/validate.dart';

import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';
import '../app/home.dart';

class SignupDetails extends StatefulWidget {
  const SignupDetails({Key? key}) : super(key: key);

  @override
  State<SignupDetails> createState() => _SignupDetailsState();
}

class _SignupDetailsState extends State<SignupDetails> {
  final _phoneNumberController = TextEditingController();
  DateTime date = DateTime.now();
  File? image;
  bool? test;
  final ImagePicker picker = ImagePicker();

  Future uploadImage() async {
    try {
      final pickedImage = await picker.pickImage(source: ImageSource.gallery);
      if (pickedImage == null) return;
      // if (pickedImage != null) {
      final image2 = File(pickedImage.path);
      setState(() {});
      image = image2;
    } on PlatformException catch (e) {
      print('Failed to upload image $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Center(
          child: Image(
            height: 30,
            image: AssetImage('assets/images/logo_name.png'),
          ),
        ),
      ),
      body: Form(
        autovalidateMode: AutovalidateMode.always,
        key: formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Complete your details to Sign up:",
                  style: TextStyle(fontFamily: 'SignikaNegative', fontSize: 16),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
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
            MyTextFormField(
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
              height: 5,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Select your gender:",
                  style: TextStyle(fontFamily: 'SignikaNegative', fontSize: 16),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ChangeNotifierProvider(
              create: (context) => IsMale(),
              child: Consumer<IsMale>(
                builder: (context, model, child) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: GestureDetector(
                        onTap: () {
                          model.isMale = true;
                          model.dosomething();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 160,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: model.maleColor,
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Text(
                            'male',
                            style: TextStyle(
                              color: model.maleTextColor,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: GestureDetector(
                        onTap: () {
                          model.isMale = false;
                          model.dosomething();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 160,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: model.femaleColor,
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Text('female',
                              style: TextStyle(
                                color: model.femaleTextColor,
                                fontSize: 22,
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(children: const [
              SizedBox(
                width: 10,
              ),
              Text(
                "Select your birthday:",
                style: TextStyle(fontFamily: 'SignikaNegative', fontSize: 16),
              ),
            ]),
            const SizedBox(
              height: 10,
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
                    MyMaterialButton(
                        text: 'Select birthday',
                        height: 50,
                        width: 145,
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
                              fontSize: 24, color: AppTheme.colors.darkPurple),
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
                              fontSize: 24, color: AppTheme.colors.darkPurple),
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
                              fontSize: 24, color: AppTheme.colors.darkPurple),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            MyMaterialButton(
                width: 170,
                height: 50,
                text: "Continue",
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const Home();
                    }));
                  }
                }),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
