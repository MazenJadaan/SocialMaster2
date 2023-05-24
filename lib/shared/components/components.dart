import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_master/shared/styles/colors.dart';


Widget MyTextFormField({
  required Function() suffixOnPressed,
  required TextEditingController controller,
  required String? Function(String? string) validate,
  inputType = TextInputType.name,
  required String label,
  Icon? prefixIcon = null,
  FaIcon? suffixIcon = null,
  GlobalKey? key = null,
  bool obscureText = false,
  String? hint = null,
  int maxlines = 1,
}) =>
    Padding(
      padding: const EdgeInsets.only(left: 10,right: 10,top: 6,bottom: 6),
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
  required String? Function(String? string) validate,
  inputType = TextInputType.name,
  required String label,
  Icon? prefixIcon = null,
  GlobalKey? key = null,
  bool obscureText = false,
  String? hint = null,
  int maxlines = 1,
}) =>
    Padding(
      padding: const EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
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
            hintStyle: TextStyle(color: AppTheme.colors.darkPurple,fontSize: 8),
            label: Text(
              label,
              style: TextStyle(color: AppTheme.colors.purple,),
            ),
            border: InputBorder.none,
            filled: true,
            fillColor: const Color(0x40917fb3),
            prefix: prefixIcon,

          ),
        ),
      ),

    );



Widget MyMaterialButton({
  required String text,
  required Function() onPressed,
  double width = 120.0,
  double height = 40.0,
  double fontSize = 24,
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
            style:  TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,

            ),
          ),
        ));
