import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/usermodel.dart';
import '../../shared/components/components.dart';


class EditProfile extends StatelessWidget {
  EditProfile(this. user,{Key? key}) : super(key: key);
  UserModel user;
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Master",
          style: TextStyle(),
        )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Row(
              children: [
                Expanded(
                  child: smallTextFormField(
                    controller: _firstNameController,
                    label: user.lname,
                    initialValue: 'haha'
                  ),
                ),
                Expanded(
                  child: smallTextFormField(
                      controller: _lastNameController,
                      label: "last name",
                    initialValue: 'haha',
                  ),
                ),
              ],
            ),


          ],
        ),
      ),
    );
  }
}
