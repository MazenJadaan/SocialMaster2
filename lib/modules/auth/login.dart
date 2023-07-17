import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_master/modules/auth/reset_password/reset_password.dart';
import 'package:social_master/modules/auth/signup.dart';
import 'package:social_master/shared/styles/colors.dart';
import '../../models/connection/login.dart';
import '../../provider/obscure_model.dart';
import '../../shared/components/components.dart';
import '../../shared/network/api/google_signin_api.dart';
import '../../shared/network/constant/constant.dart';
import '../../shared/shared_prefrences.dart';
import '../../shared/validate/validate.dart';
import '../app/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {


  Future<LoginResponse?> login(LoginParams params) async {
    var url = Uri.parse("${AppSetting.baseUrl}api/login");
    var response = await http.post(url, body: params.toJson());
    var data = json.decode(response.body);
    if (response.statusCode == 200) {
      LoginResponse loginResponse = LoginResponse.fromJson(data);
      return loginResponse;
    }
    return null;
  }

  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover),
          color: Colors.white,
        ),
        alignment: AlignmentDirectional.topCenter,
        child: ChangeNotifierProvider(
          create: (context) => ObscureModel(),
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.colors.purple,
                    ),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Lottie.asset("assets/images/welcomeani.json"),
                  myTextFormField(
                    obscureText: false,
                    label: 'E-mail or phone number',
                    suffixOnPressed: () {},
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: AppTheme.colors.purple,
                    ),
                    controller: _emailController,
                    inputType: TextInputType.emailAddress,
                    validate: Validate.emptyValidate,
                  ),
                  Consumer<ObscureModel>(builder: (context, model, child) {
                    return myTextFormField(
                      label: 'Password',
                      hint: 'enter your password',
                      suffixIcon: model.icon1,
                      suffixOnPressed: () {
                        model.dosomething1();
                      },
                      prefixIcon: Icon(
                        Icons.vpn_key_rounded,
                        color: AppTheme.colors.purple,
                      ),
                      controller: _passwordController,
                      inputType: TextInputType.emailAddress,
                      obscureText: model.obscure1,
                      validate: Validate.passwordValidate,
                    );
                  }),
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Reset1()));
                        },
                        child: Text(
                          'forget password?',
                          style: TextStyle(
                            color: AppTheme.colors.purple,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  myMaterialButton(
                    width: 240,
                    isLoading: isLoading,
                    text: 'Login',
                    onPressed: () async {
                      if (isLoading) {
                        setState(() => isLoading = false);

                      } else {
                        if (formKey.currentState!.validate()) {
                          setState(() => isLoading = true);
                          final LoginResponse? loginResponse = await login(
                            LoginParams(
                              emailORmobile: _emailController.text,
                              password: _passwordController.text,
                            ),
                          );
                          if (loginResponse != null) {
                            AppSetting.token = loginResponse.data?.token ?? "";
                            Prefs.setToken(loginResponse.data?.token);
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: (context) => Home()),
                                (route) => false);
                          } else {
                            setState(() => isLoading = false);
                            Fluttertoast.showToast(
                                msg: "Email or Pass is Wrong!",
                                gravity: ToastGravity.BOTTOM,
                                toastLength: Toast.LENGTH_SHORT,
                                backgroundColor: Colors.pink,
                                timeInSecForIosWeb: 2,
                                fontSize: 16);
                          }
                        }
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "don't have an account?",
                        style: TextStyle(color: AppTheme.colors.purple),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return Signup();
                            }));
                          },
                          child: Text(
                            'Signup',
                            style: TextStyle(
                              color: AppTheme.colors.purple,
                              fontWeight: FontWeight.bold,
                            ),
                          ))
                    ],
                  ),
                  const SizedBox(height: 5),
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
                  const SizedBox(height: 10),
                  CircleAvatar(
                    backgroundColor: AppTheme.colors.purple,
                    radius: 25,
                    child: IconButton(
                        color: Colors.white,
                        icon: const FaIcon(FontAwesomeIcons.google),
                        onPressed: signIn),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future signIn() async {
    final user = await GoogleSignInApi.login();
    // if(user == null){
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Sign in Failed')));
    // }else {
    //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Login(),
    //   ));
    // }
  }
}
