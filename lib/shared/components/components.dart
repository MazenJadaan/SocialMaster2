

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_master/shared/styles/colors.dart';

Widget MyTextFormField({
  required final Function() suffixOnPressed,
  required TextEditingController controller,
  required final String? Function(String? string) validate,
  final inputType = TextInputType.name,
  required final String label,
  final Icon? prefixIcon = null,
  FaIcon? suffixIcon = null,
  GlobalKey? key = null,
  bool obscureText = false,
  final String? hint = null,
  final int maxlines = 1,
}) =>
    Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 6, bottom: 6),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: TextFormField(
          textAlignVertical: TextAlignVertical.top,
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
              minWidth: 1,
              onPressed: suffixOnPressed,
              child: suffixIcon,
            ),
          ),
        ),
      ),
    );

Widget SmallTextFormField({
  required TextEditingController controller,
   final String? Function(String? string)? validate,
  final  inputType = TextInputType.name,
  required final String label,
  Icon? prefixIcon = null,
  GlobalKey? key = null,
  bool obscureText = false,
  final String? hint = null,
  final int maxlines = 1,
}) =>
    Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
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
            hintStyle:
                TextStyle(color: AppTheme.colors.darkPurple, fontSize: 8),
            label: Text(
              label,
              style: TextStyle(
                color: AppTheme.colors.purple,
              ),
            ),
            border: InputBorder.none,
            filled: true,
            fillColor: AppTheme.colors.opacityPurple,
            prefix: prefixIcon,
          ),
        ),
      ),
    );



Widget Comment({
  required TextEditingController controller,

  final  inputType = TextInputType.name,
  required final String hint,
  Icon? prefixIcon = null,
  GlobalKey? key = null,
  bool obscureText = false,

  final int maxlines = 1,
}) =>
    Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 5, bottom: 5),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: inputType,
          maxLines: maxlines,
          obscuringCharacter: '*',
          decoration: InputDecoration(
            hintText: hint,
            hintStyle:
            TextStyle(color: AppTheme.colors.darkPurple, fontSize: 16),

            // border: InputBorder.none,
            filled: false,
            fillColor: AppTheme.colors.opacityPurple,
            prefix: prefixIcon,
          ),
        ),
      ),
    );




Widget MyMaterialButton({
  required final String text,
  required final Function() onPressed,
  final double width = 120.0,
  final double height = 40.0,
  final double fontSize = 24,
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
            borderRadius: BorderRadius.circular(100),
            color: AppTheme.colors.purple,
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ));
