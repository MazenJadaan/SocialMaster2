import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:social_master/modules/app/home.dart';
import 'package:social_master/modules/auth/signup_details.dart';
import 'package:social_master/shared/components/components.dart';
import 'package:social_master/shared/network/constant/constant.dart';


import '../../provider/obscure_model.dart';
import '../../shared/styles/colors.dart';

import 'package:http/http.dart' as http;
import '../../shared/validate/validate.dart';
import 'login.dart';

class Signup extends StatelessWidget {
  Signup({Key? key}) : super(key: key);
  static Future<bool> register(
      {required String first,
        required String email,
        required String password,
        required String password_confirmation,
        required String last,
        required BuildContext context}) async {
    var url = Uri.parse('${AppSetting.baseUrl}api/expert/register');
    var response = await http.post(url, body: {
      "first_name": first,
      "last_name": last,
      "email": email,
      "password": password,
      "password_confirmation": password_confirmation,
    });

    print(response.statusCode);
     print(response.body);
    var decodedRespon = jsonDecode(response.body);
    print(decodedRespon['data']['token']);
    AppSetting.token = decodedRespon["data"]['token'];

    if (response.statusCode == 200) {
      return true;

    } else {
      return false;
    }
  }
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Container(
        alignment: AlignmentDirectional.topCenter,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background2.png"),
                fit: BoxFit.cover)),
        child: ChangeNotifierProvider(
          create: (context) => ObscureModel(),
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 35,
                  ),
                  Text(
                    "SIGNUP",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.colors.purple,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Image(
                    image: AssetImage("assets/images/monitoring (2).png"),
                    width: 200,
                    height: 180,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SmallTextFormField(
                          controller: _firstNameController,
                          validate: Validate.emptyValidate,
                          label: "first name",
                        ),
                      ),
                      Expanded(
                        child: SmallTextFormField(
                            controller: _lastNameController,
                            validate: Validate.emptyValidate,
                            label: "last name"),
                      ),
                    ],
                  ),
                  MyTextFormField(
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: AppTheme.colors.purple,
                      ),
                      suffixOnPressed: () {},
                      controller: _emailController,
                      validate: Validate.emptyValidate,
                      label: "E-mail",
                      inputType: TextInputType.emailAddress),
                  Consumer<ObscureModel>(builder: (context, model, child) {
                    return MyTextFormField(
                      controller: _passwordController,
                      validate: Validate.passwordValidate,
                      label: "Password",
                      hint: 'enter your password',
                      obscureText: model.obscure2,
                      suffixIcon: model.icon2,
                      suffixOnPressed: () {
                        model.dosomething2();
                      },
                      prefixIcon: Icon(
                        Icons.vpn_key_rounded,
                        color: AppTheme.colors.purple,
                      ),
                    );
                  }),
                  Consumer<ObscureModel>(builder: (context, model, child) {
                    return MyTextFormField(
                        prefixIcon: Icon(
                          Icons.vpn_key_rounded,
                          color: AppTheme.colors.purple,
                        ),
                        suffixIcon: model.icon3,
                        suffixOnPressed: () {
                          model.dosomething3();
                        },
                        controller: _confirmPasswordController,
                        validate: Validate.passwordValidate,
                        obscureText: model.obscure3,
                        label: "Confirm Password");
                  }),
                  const SizedBox(height: 5),
                  MyMaterialButton(
                    width: 240,
                    text: 'Signup',
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        bool res = await register(
                            context: context,
                            first: _firstNameController.text,
                            last: _lastNameController.text,
                            email: _emailController.text,
                            password: _passwordController.text,
                            password_confirmation:
                                _confirmPasswordController.text);
                        if (res) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => Home()),
                              (route) => false);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                                  Text('شو حبيب وين فايت بهالعجقة !!!!!')));
                        }

                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "ِAlready have an account?",
                        style: TextStyle(color: AppTheme.colors.purple),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: AppTheme.colors.purple,
                              fontWeight: FontWeight.bold,
                            ),
                          ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 120,
                        height: 1,
                        color: AppTheme.colors.purple,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          "OR",
                          style: TextStyle(color: AppTheme.colors.purple),
                        ),
                      ),
                      Container(
                        width: 120,
                        height: 1,
                        color: AppTheme.colors.purple,
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  CircleAvatar(
                    backgroundColor: AppTheme.colors.purple,
                    radius: 25,
                    child: IconButton(
                        color: Colors.white,
                        icon: const FaIcon(FontAwesomeIcons.google),
                        onPressed: () {}),
                  ),
                  const SizedBox(
                    height: 150,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}