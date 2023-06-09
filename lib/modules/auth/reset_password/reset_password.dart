import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_master/modules/auth/reset_password/reset_password_code.dart';
import 'package:social_master/shared/components/components.dart';

import '../../../shared/styles/colors.dart';
import '../../../shared/validate/validate.dart';

class Reset1 extends StatelessWidget {
  Reset1({Key? key}) : super(key: key);

  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppTheme.colors.purple,
        title: Center(
          child: Text('Reset your Password',
              style: TextStyle(
                fontFamily: 'SignikaNegative',
                fontSize: 20,
                color: AppTheme.colors.darkPurple,
              )),
        ),
        actions: const [
          SizedBox(
            width: 50,
          ),
        ],
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                  'If you want to reset your password that you forgot enter your email',
                  style: TextStyle(
                    fontFamily: 'SignikaNegative',
                    fontSize: 20,
                    color: AppTheme.colors.darkPurple,
                  )),
            ),
            const SizedBox(
              height: 25,
            ),
            MyTextFormField(
                suffixOnPressed: () {},
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: AppTheme.colors.purple,
                ),
                inputType: TextInputType.emailAddress,
                controller: _emailController,
                validate: Validate.emptyValidate,
                label: "E-mail"),
            const Spacer(),
            MyMaterialButton(
              width: 250,
              text: "Send Code",
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Reset2(_emailController.text)));
                }
              },
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
