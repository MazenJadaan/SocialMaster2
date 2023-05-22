import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_master/shared/components/components.dart';

import '../../shared/styles/colors.dart';
import 'login.dart';

class Signup extends StatelessWidget {
  Signup({Key? key}) : super(key: key);
  var _firstNameController = TextEditingController();
  var _lastNameController = TextEditingController();
  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  var _confirmPasswordController = TextEditingController();
  var _phoneNumberController = TextEditingController();
  var _dropDownValue;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    return Container(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/test.png"),
                  fit: BoxFit.cover)),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Signup",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Pacifico',
                    color: AppTheme.colors.purple,
                  ),
                ),
                SizedBox(height: 50,),
                Row(
                  children: [
                    Container(
                      width: 150,
                      child: SmallTextFormField(
                        controller: _firstNameController,
                        validate: emptyValidate,
                        label: "first name",
                      ),
                    ),

                    Container(
                      width: 150,
                      child: SmallTextFormField(
                          controller: _lastNameController,
                          validate: emptyValidate,
                          label: "last name"),
                    ),
                  ],
                ),

                MyTextFormField(
                    suffixOnPressed: () {},
                    controller: _emailController,
                    validate: emptyValidate,
                    label: "E-mail"),

                MyTextFormField(

                  controller: _passwordController,
                  validate: emptyValidate,
                  label: "Password",
                  hint: 'enter your password',
                  suffixIcon: Icon(Icons.remove_red_eye_outlined,
                      color: AppTheme.colors.purple),
                  suffixOnPressed: () {
                    _obscureText = !_obscureText;
                  },
                  prefixIcon: Icon(
                    Icons.vpn_key_rounded,
                    color: AppTheme.colors.purple,
                  ),),

                MyTextFormField(
                    suffixOnPressed: () {},
                    controller: _confirmPasswordController,
                    validate: emptyValidate,
                    label: "Confirm Password"),

                MyTextFormField(
                    suffixOnPressed: () {},
                    controller: _phoneNumberController,
                    validate: emptyValidate,
                    label: "Phone Number"),

                DropdownButton(
                    items: ["male", "female"]
                        .map((e) => DropdownMenuItem(
                              child: Text("$e"),
                              value: e,
                            ))
                        .toList(),
                    value: _dropDownValue,

                    hint: Text("gender"),
                    onChanged: (val) {
                      _dropDownValue = val!;
                    }),
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
}
