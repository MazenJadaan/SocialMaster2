import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_master/shared/components/components.dart';
import '../../shared/styles/colors.dart';
import 'package:social_master/models/obscure_model.dart';

class Signup extends StatefulWidget {
  Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _firstNameController = TextEditingController();

  final _lastNameController = TextEditingController();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final _confirmPasswordController = TextEditingController();

  final _phoneNumberController = TextEditingController();

  var _dropDownValue;

  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    return ChangeNotifierProvider(
      create: (context) => ObscureModel(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/test.png"),
                  fit: BoxFit.cover)),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(
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
                const SizedBox(
                  height: 50,
                ),
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
                    label: "E-mail or Phone Number"),
                Consumer<ObscureModel>(builder: (context, model, child) {
                  return MyTextFormField(
                    controller: _passwordController,
                    validate: emptyValidate,
                    label: "Password",
                    hint: 'enter your password',
                    obscureText: model.obscure2,
                    suffixIcon: Icon(Icons.remove_red_eye_outlined,
                        color: AppTheme.colors.purple),
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
                      suffixIcon: Icon(Icons.remove_red_eye_outlined),
                      suffixOnPressed: () {
                        model.dosomething3();
                      },
                      controller: _confirmPasswordController,
                      validate: emptyValidate,
                      obscureText: model.obscure3,
                      label: "Confirm Password");
                }),
                MyTextFormField(
                    suffixOnPressed: () {},
                    controller: _phoneNumberController,
                    validate: emptyValidate,
                    label: "Phone Number"),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    DropdownButton(
                        items: ["male", "female"]
                            .map((e) => DropdownMenuItem(
                                  child: Text("$e"),
                                  value: e,
                                ))
                            .toList(),
                        value: _dropDownValue,
                        hint: const Text("gender"),
                        onChanged: (val) {
                          //*****provider state management is missing
                          _dropDownValue = val!;
                        }),
                    SizedBox(
                      width: 40,
                    ),
                    Column(
                      children: [
                        Text(
                          '${date.day}/${date.month}/${date.year}',
                          style: const TextStyle(fontSize: 30),
                        ),
                        MyMaterialButton(
                            text: 'Select birthday',
                            width: 100,
                            onPressed: () async {
                              DateTime? newDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime(2001,7,30),
                                firstDate: DateTime(1930),
                                lastDate: DateTime(date.year),
                              );
                              if (newDate == null) return;
                              date = newDate;
                              setState(() {});
                            }),
                      ],
                    )
                  ],
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
}
