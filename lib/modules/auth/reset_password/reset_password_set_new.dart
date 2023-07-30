import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_master/modules/app/home.dart';
import '../../../models/connection/reset_password.dart';
import '../../../models/provider/obscure_model.dart';
import '../../../shared/components/components.dart';
import '../../../shared/network/constant/constant.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/validate/validate.dart';
import 'package:http/http.dart' as http;

class Reset3 extends StatelessWidget {
  final String _email;

  Reset3(this._email, {super.key});

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();



  Future<SetNewResponse?> setNewPassword(SetNewParams params) async {
    var url = Uri.parse("${AppSetting.baseUrl}${AppSetting.updatePasswordApi}");
    var response = await http.post(url, body: params.toJson());
    var data = json.decode(response.body);
    if (response.statusCode == 200) {
      SetNewResponse setNewResponse = SetNewResponse.fromJson(data);
      return setNewResponse;
    }else {
      return null;
    }
  }





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
      body: ChangeNotifierProvider(
        create: (context) => ObscureModel(),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Now you can enter your new password',
                    style: TextStyle(
                      fontFamily: 'SignikaNegative',
                      fontSize: 20,
                      color: AppTheme.colors.darkPurple,
                    )),
              ),
              const SizedBox(
                height: 25,
              ),
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
              const SizedBox(
                height: 5,
              ),
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
              const Spacer(),
              myMaterialButton(
                width: 240,
                text: 'Confirm',
                onPressed: () async{
                  if (formKey.currentState!.validate()) {
                    final SetNewResponse? setNewResponse = await setNewPassword(
                      SetNewParams(
                        email: _email,
                        password: _passwordController.text,
                        passwordConfirmation: _confirmPasswordController.text
                      ),
                    );
                    if (setNewResponse != null) {

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>  Home()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Failed')));
                      // Fluttertoast.showToast(msg: "Email or Pass is Wrong !",gravity: ToastGravity.BOTTOM,toastLength: Toast.LENGTH_SHORT,backgroundColor: Colors.pink,timeInSecForIosWeb: 2,fontSize: 18);
                    }


                  }
                },
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
