import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_master/shared/styles/colors.dart';

Widget myTextFormField({
  required final Function() suffixOnPressed,
  required TextEditingController controller,
  required final String? Function(String? string) validate,
  final inputType = TextInputType.name,
  required final String label,
  final Icon? prefixIcon,
  FaIcon? suffixIcon,
  GlobalKey? key,
  bool obscureText = false,
  final String? hint,
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


Widget smallTextFormField({
  required TextEditingController controller,
   final String? Function(String? string)? validate,
  final  inputType = TextInputType.name,
  required final String label,
  Icon? prefixIcon,
  GlobalKey? key,
  bool obscureText = false,

  final String? hint,
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






Widget captionTextFormField({
  required TextEditingController controller,
  final String? Function(String? string)? validate,
  final  inputType = TextInputType.name,
  required final String label,
  Icon? prefixIcon,
  GlobalKey? key,
  bool obscureText = false,

  final String? hint,
  final int maxlines = 1,
}) =>
    Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: TextFormField(
          maxLength: 250,
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





Widget myMaterialButton({
  bool isLoading=false,
  required final String text,
  required final Function() onPressed,
  final double width = 120.0,
  final double height = 40.0,
  final double fontSize = 24,
   GlobalKey? key,
}) =>
    MaterialButton(
        onPressed: onPressed,
        child: isLoading ? Center(
            child: CircularProgressIndicator(
              color: AppTheme.colors.purple,
              backgroundColor: AppTheme.colors.opacityPurple,
              strokeWidth: 2,

            ))
            :Container(
          alignment: AlignmentDirectional.center,
          width: width,
          height: height,
          key: key,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: AppTheme.colors.purple,
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child:
            Text(
            text,
            style: TextStyle(
              fontFamily: 'SignikaNegative',
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ));


Widget myCircularProgressIndicator()=>Center(
  child:   CircularProgressIndicator(
  color: AppTheme.colors.purple,
  backgroundColor: AppTheme.colors.opacityPurple,
  strokeWidth: 2,
  ),
);