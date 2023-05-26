

import 'package:flutter/material.dart';
import 'package:social_master/models/validate.dart';

import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';

class Signup_Details extends StatelessWidget {
   Signup_Details({Key? key}) : super(key: key);
  final _phoneNumberController = TextEditingController();
  var dropDownValue;

  @override
  Widget build(BuildContext context) {


    DateTime date = DateTime.now();

    return Scaffold(
      body:   Container(
        child: Column(
          children: [
            MyTextFormField(
                suffixOnPressed: () {},
                prefixIcon: Icon(
                  Icons.phone,
                  color: AppTheme.colors.purple,
                ),
                controller: _phoneNumberController,
                validate: Validate.emptyValidate,
                label: "Phone Number"),

            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                DropdownButton(
                    items: ["male", "female"]
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    value: dropDownValue,
                    hint: const Text("gender"),
                    onChanged: (val) {
                      //*****provider state management is missing
                      dropDownValue = val!;
                    }),
                const SizedBox(
                  width: 40,
                ),
                Column(
                  children: [
                    Text(
                      '${date.day}/${date.month}/${date.year}',
                      style: const TextStyle(fontSize: 24),
                    ),
                    MyMaterialButton(
                        text: 'Select birthday',
                        width: 140,
                        fontSize: 12,
                        onPressed: () async {
                          DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime(2001, 7, 30),
                            firstDate: DateTime(1930),
                            lastDate: DateTime(date.year),
                          );
                          if (newDate == null) return;
                          date = newDate;
                        //  ****provider state management is missing
                        }),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
