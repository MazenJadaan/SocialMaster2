

import 'package:flutter/material.dart';
import 'package:social_master/models/validate.dart';

import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';

class Signup_Details extends StatelessWidget {
  const Signup_Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _firstNameController = TextEditingController();
    final _lastNameController = TextEditingController();
    var dropDownValue;
    DateTime date = DateTime.now();

    return Scaffold(
      body:   Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 178,
                  child: SmallTextFormField(
                    controller: _firstNameController,
                    validate: Validate.emptyValidate,
                    label: "first name",
                  ),
                ),
                Container(
                  width: 178,
                  child: SmallTextFormField(
                      controller: _lastNameController,
                      validate: Validate.emptyValidate,
                      label: "last name"),
                ),
              ],
            ),

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
