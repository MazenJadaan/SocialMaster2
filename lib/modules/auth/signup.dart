import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:social_master/shared/components/components.dart';
import '../../models/validate.dart';
import '../../shared/styles/colors.dart';
import 'package:social_master/models/obscure_model.dart';

import 'login.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneNumberController = TextEditingController();

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
                  MyTextFormField(
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: AppTheme.colors.purple,
                      ),
                      suffixOnPressed: () {},
                      controller: _emailController,
                      validate: Validate.emptyValidate,
                      label: "E-mail"),
                  MyTextFormField(
                      suffixOnPressed: () {},
                      prefixIcon: Icon(
                        Icons.phone,
                        color: AppTheme.colors.purple,
                      ),
                      controller: _phoneNumberController,
                      validate: Validate.emptyValidate,
                      label: "Phone Number"),
                  Consumer<ObscureModel>(builder: (context, model, child) {
                    return MyTextFormField(
                      controller: _passwordController,
                      validate: Validate.emptyValidate,
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
                        validate: Validate.emptyValidate,
                        obscureText: model.obscure3,
                        label: "Confirm Password");
                  }),
                  const SizedBox(height: 5),
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
                        "ِAlready have an account?",
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
                            'login',
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
