import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:social_master/models/obscure_model.dart';
import 'package:social_master/shared/styles/colors.dart';

import '../../shared/components/components.dart';
import '../../shared/network/api/google_signin_api.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  bool _check = false;

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    //
    return ChangeNotifierProvider(
      create: (context) => ObscureModel(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/test.png"), fit: BoxFit.cover),
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

                const Image(
                  image: AssetImage("assets/images/monitoring.png"),
                  width: 200,
                  height: 180,
                ),
                // const Spacer(),
                MyTextFormField(
                  obscureText: false,
                  hint: 'E-mail or Phone Number',
                  label: 'E-mail or Phone Number',
                  suffixOnPressed: () {},
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: AppTheme.colors.purple,
                  ),
                  controller: _emailController,
                  inputType: TextInputType.emailAddress,
                  validate: emptyValidate,
                ),

                Consumer<ObscureModel>(builder: (context, model, child) {
                  return MyTextFormField(
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
                    validate: emptyValidate,
                  );
                }),
                Row(
                  children: [
                    Checkbox(
                        value: _check,
                        // activeColor:Colors.white ,
                        onChanged: (not) {
                          // ***** provider state managment missing
                          _check = !_check;
                        }),
                    Text(
                      'remember me?',
                      style: TextStyle(color: AppTheme.colors.purple),
                    )
                  ],
                ),
                // const SizedBox(
                //   height: 10,
                // ),
                MyMaterialButton(
                  width: 240,
                  text: 'Login',
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
    final user = await GoogleSignInApi.login();
    // if(user == null){
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Sign in Failed')));
    // }else {
    //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Login(),
    //   ));
    // }
  }
}
