import 'package:flutter/material.dart';
import 'package:social_master/shared/styles/colors.dart';

Widget MyTextFormField({
  required Function() suffixOnPressed,
  required TextEditingController controller,
  required String? Function(String? string) validate,
  inputType = TextInputType.name,
  required String label,
  Icon? prefixIcon = null,
  Icon? suffixIcon = null,
  GlobalKey? key = null,
  bool obscureText = false,
  String? hint = null,
  int maxlines = 1,
}) =>
    Padding(
      padding: const EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            keyboardType: inputType,
            validator: validate,
            maxLines: maxlines,
            obscuringCharacter: '*',
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: AppTheme.colors.darkPurple),
              label: Text(
                label,
                style: TextStyle(color: AppTheme.colors.purple),
              ),
              border: InputBorder.none,
              filled: true,
              fillColor: const Color(0x40917fb3),
              prefix: prefixIcon,
              suffixIcon: MaterialButton(
                onPressed: suffixOnPressed,
                child: suffixIcon,
              ),
            ),
          ),
        ),
      
    );

Widget MyMaterialButton({
  required String text,
  required Function() onPressed,
  double width = 120.0,
  double height = 40.0,
  GlobalKey? key = null,
}) =>
    MaterialButton(
        onPressed: onPressed,
        child: Container(
          alignment: AlignmentDirectional.center,
          width: width,
          height: height,
          key: key,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppTheme.colors.purple,
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Pangolin'
            ),
          ),
        ));
