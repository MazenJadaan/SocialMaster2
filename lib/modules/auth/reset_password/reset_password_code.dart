import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_master/modules/auth/reset_password/reset_password.dart';
import 'package:social_master/modules/auth/reset_password/reset_password_set_new.dart';
import 'package:social_master/shared/components/components.dart';
import 'package:social_master/shared/validate/validate.dart';
import '../../../shared/styles/colors.dart';

class Reset2 extends StatefulWidget {
  final String _email;

  const Reset2(this._email, {super.key});

  @override
  State<Reset2> createState() => _Reset2State();
}

class _Reset2State extends State<Reset2> {
  int timeLeft = 60;

  final TextEditingController _codeController = TextEditingController();

  void re() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text(' another code is send'),

    ));
    setState(() {
      startCountDown();
      timeLeft = 60;
    });
    print('resend');
  }

  void startCountDown() {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      timeLeft > 0
          ? setState(() {
              timeLeft-=5;
            })
          : timer.cancel();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    startCountDown();
    super.initState();
  }

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
            MyTextFormField(
                suffixOnPressed: () {},
                controller: _codeController,
                inputType: TextInputType.number,
                validate: Validate.emptyValidate,
                label: "enter your code"),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                timeLeft == 0
                    ? re()
                    : ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            'please wait $timeLeft seconds before request another code')));
                // Fluttertoast.showToast(msg: "Wait $timeLeft",gravity: ToastGravity.BOTTOM,toastLength: Toast.LENGTH_SHORT,backgroundColor: Colors.pink,timeInSecForIosWeb: 2,fontSize: 18);;
              },
              child: Text(
                'Resend the code in $timeLeft sec',
                style: TextStyle(
                  fontFamily: 'SignikaNegative',
                  fontSize: 16,
                  color: AppTheme.colors.darkPurple,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            MyMaterialButton(
              width: 250,
              text: "Confirm Code",
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Reset3(widget._email)));
                  print(widget._email);
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
