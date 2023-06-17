import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:social_master/modules/auth/reset_password/reset_password_set_new.dart';
import 'package:social_master/shared/components/components.dart';
import 'package:social_master/shared/validate/validate.dart';
import '../../../models/connection/reset_password.dart';
import '../../../shared/network/constant/constant.dart';
import '../../../shared/styles/colors.dart';

class Reset2 extends StatelessWidget {
  final String _email;

  Reset2(this._email, {super.key});

  Future<CodeResponse?> sendCode(CodeParams params) async {
    var url = Uri.parse("${AppSetting.baseUrl}api/code-check");
    var response = await http.post(url, body: params.toJson());
    var data = json.decode(response.body);
    if (response.statusCode == 200) {
      CodeResponse codeResponse = CodeResponse.fromJson(data);
      return codeResponse;
    } else {
      return null;
    }
  }

  final TextEditingController _codeController = TextEditingController();

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
                  fontWeight: FontWeight.bold)),
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
                  'We will send you verification code to your email address',
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
                controller: _codeController,
                inputType: TextInputType.number,
                validate: Validate.emptyValidate,
                label: "enter your code"),
            const SizedBox(
              height: 10,
            ),
            const Spacer(),
            myMaterialButton(
              width: 250,
              text: "Confirm Code",
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  final CodeResponse? codeResponse = await sendCode(
                    CodeParams(
                      code: _codeController.text,
                    ),
                  );
                  if (codeResponse != null) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Reset3(_email)));
                  } else {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text('Failed')));
                    // Fluttertoast.showToast(msg: "Email or Pass is Wrong !",gravity: ToastGravity.BOTTOM,toastLength: Toast.LENGTH_SHORT,backgroundColor: Colors.pink,timeInSecForIosWeb: 2,fontSize: 18);
                  }
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
