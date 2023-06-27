import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:social_master/modules/auth/signup_details.dart';
import 'package:social_master/shared/components/components.dart';
import 'package:social_master/shared/network/constant/constant.dart';
import '../../models/connection/register.dart';
import '../../provider/obscure_model.dart';
import '../../shared/styles/colors.dart';
import 'package:http/http.dart' as http;
import '../../shared/validate/validate.dart';

class Signup extends StatelessWidget {
  Signup({Key? key}) : super(key: key);

  Future<RegisterResponse?> login(RegisterParams params) async {
    var url = Uri.parse("${AppSetting.baseUrl}api/register");
    var response = await http.post(url, body: params.toJson());
    var data = json.decode(response.body);
    if (response.statusCode == 200) {
      RegisterResponse loginResponse = RegisterResponse.fromJson(data);
      return loginResponse;
    }
    return null;
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
                  Container(height: 200,
                      width: 200,
                      child: Lottie.asset("assets/images/signani.json")),
                  Row(
                    children: [
                      Expanded(
                        child: smallTextFormField(
                          controller: _firstNameController,
                          validate: Validate.emptyValidate,
                          label: "first name",
                        ),
                      ),
                      Expanded(
                        child: smallTextFormField(
                            controller: _lastNameController,
                            validate: Validate.emptyValidate,
                            label: "last name"),
                      ),
                    ],
                  ),
                  myTextFormField(
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
                    return myTextFormField(
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
                    return myTextFormField(
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
                  myMaterialButton(
                    width: 240,
                    text: 'Signup',
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        final RegisterResponse? loginResponse = await login(
                          RegisterParams(
                              email: _emailController.text,
                              firstName: _firstNameController.text,
                              lastName: _lastNameController.text,
                              password: _passwordController.text,
                              passwordConfirmation:
                                  _confirmPasswordController.text),
                        );
                        if (loginResponse != null) {
                          print(loginResponse.data?.token);
                          AppSetting.token = loginResponse.data?.token ?? "";
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return const SignupDetails();
                          }));
                        } else {
                          Fluttertoast.showToast(
                              msg: "any Text Faild",
                              gravity: ToastGravity.BOTTOM,
                              toastLength: Toast.LENGTH_SHORT,
                              backgroundColor: Colors.pink,
                              timeInSecForIosWeb: 2,
                              fontSize: 18);
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
