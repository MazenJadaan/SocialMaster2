import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/obscure_model.dart';
import '../../../shared/components/components.dart';
import '../../../shared/styles/colors.dart';
import '../../../shared/validate/validate.dart';
import '../../app/home.dart';

class Reset3 extends StatelessWidget {
  final String _email;

  Reset3(this._email, {super.key});

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

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
      body: ChangeNotifierProvider(
        create: (context) => ObscureModel(),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 80,
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
              SizedBox(height: 25,),
              Consumer<ObscureModel>(builder: (context, model, child) {
                return MyTextFormField(
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
              SizedBox(height: 5,),
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
                    validate: Validate.passwordValidate,
                    obscureText: model.obscure3,
                    label: "Confirm Password");
              }),
            const Spacer(),
              MyMaterialButton(
                width: 240,
                text: 'Confirm',
                onPressed: () {
                  if (formKey.currentState!.validate()) {}
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
