import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_master/shared/styles/colors.dart';

import '../../shared/components/components.dart';
import '../../shared/network/api/google_signin_api.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  bool _obscureText = true;
  bool _check = false;

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    //
    return Container(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(
            // gradient: LinearGradient(
            //   begin: Alignment.center,
            //   end: Alignment.bottomCenter,
            //   colors: [
            //     AppTheme.colors.lightPurple,
            //     AppTheme.colors.purple,
            //   ],
            // ),
            color: Colors.white,
          ),
          alignment: AlignmentDirectional.topCenter,
          child: Form(
            key: formKey,
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
                    fontFamily: 'Pacifico',
                    color: AppTheme.colors.purple,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Image(image: AssetImage("assets/images/logo.png"),
                //   width: 160,
                //    height: 100,
                //
                // ),
                Image(image: AssetImage("assets/images/man (1).png"),
                  width: 200,
                  height: 200,

                ),
                MyTextFormField(
                  obscureText: false,
                  hint: 'enter your user name',
                  label: 'user name',
                  suffixOnPressed: () {},
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: AppTheme.colors.purple,
                  ),
                  controller: _emailController,
                  inputType: TextInputType.emailAddress,
                  validate: emptyValidate,
                ),
                const SizedBox(height: 20),
                MyTextFormField(
                  label: 'Password',
                  hint: 'enter your password',
                  suffixIcon: Icon(Icons.remove_red_eye_outlined,
                      color: AppTheme.colors.purple),
                  suffixOnPressed: () {
                    _obscureText = !_obscureText;
                    setState(() {});
                  },
                  prefixIcon: Icon(
                    Icons.vpn_key_rounded,
                    color: AppTheme.colors.purple,
                  ),
                  controller: _passwordController,
                  inputType: TextInputType.emailAddress,
                  obscureText: _obscureText,
                  validate: emptyValidate,
                ),
                Row(
                  children: [
                    Checkbox(
                        value: _check,
                        // activeColor:Colors.white ,
                        onChanged: (not) {
                          _check = !_check;
                          setState(() {});
                        }),
                    Text(
                      'remmeber me?',
                      style: TextStyle(color: AppTheme.colors.purple),
                    )
                  ],
                ),
                // const SizedBox(
                //   height: 10,
                // ),
                MyMaterialButton(
                  width: 240,
                  text: 'Confirm',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return Login();
                      }));
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
                            return Login();
                          }));
                        },
                        child: Text(
                          'register',
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
                      width: 100,
                      height: 1,
                      color: AppTheme.colors.purple,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "OR",
                        style: TextStyle(color: AppTheme.colors.purple),
                      ),
                    ),
                    Container(
                      width: 100,
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
                        icon: FaIcon(FontAwesomeIcons.google),
                        onPressed: signIn),
                  ),

                const Spacer(),

                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? emptyValidate(String? value) {
    if (value!.isEmpty) {
      return "can't be empty";
    } else {
      return null;
    }
  }

  Future signIn() async {
    final user= await GoogleSignInApi.login();
     // if(user == null){
     //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Sign in Failed')));
     // }else {
     //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Login(),
     //   ));
     // }
  }
}
