import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:social_master/modules/auth/reset_password/reset_password_code.dart';
import 'package:social_master/shared/components/components.dart';
import '../../../models/connection/auth/reset_password.dart';
import '../../../shared/network/constant/constant.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/validate/validate.dart';
import 'package:http/http.dart' as http;

class Reset1 extends StatelessWidget {
  Reset1({Key? key}) : super(key: key);



  Future<ResetResponse?> resetPassword(ResetParams params) async {
    var url = Uri.parse("${AppSetting.baseUrl}${AppSetting.forgotPasswordApi}");
    var response = await http.post(url, body: params.toJson());
    var data = json.decode(response.body);
    if (response.statusCode == 200) {
      ResetResponse resetResponse = ResetResponse.fromJson(data);
      return resetResponse;
    }else {
      return null;
    }
  }






  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppTheme.colors.purple,
        title: Center(
          child: Text('Reset your Password',
              style: TextStyle(
                fontFamily: 'SignikaNegative',
                fontSize: 20,
                color: AppTheme.colors.darkPurple,
                fontWeight: FontWeight.bold
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
              height: 50,
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
            myTextFormField(
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
            myMaterialButton(
                width: 250,
                text: "Send Code",
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    final ResetResponse? resetResponse = await resetPassword(
                      ResetParams(
                        email: _emailController.text,
                      ),
                    );
                    if (resetResponse != null) {

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Reset2(_emailController.text)));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Failed')));
                      // Fluttertoast.showToast(msg: "Email or Pass is Wrong !",gravity: ToastGravity.BOTTOM,toastLength: Toast.LENGTH_SHORT,backgroundColor: Colors.pink,timeInSecForIosWeb: 2,fontSize: 18);
                    }
                  }

                }),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
