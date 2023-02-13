import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/utils/base/colors.dart';

class CustomIconTextField extends StatelessWidget {
  final String label;
  final IconData icon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextDirection? textDirection;
  final TextInputType? keyboardType;
  final bool readOnly;
  final int maxLines;
  final Function()? onTap;
  final Widget? suffixIcon;
  final String? initialValue;
  final AutovalidateMode? autoValidateMode;
  final TextStyle? textStyle;

  const CustomIconTextField({
    Key? key,
    required this.label,
    required this.icon,
    this.controller,
    this.validator,
    this.obscureText = false,
    this.textDirection,
    this.keyboardType,
    this.readOnly = false,
    this.maxLines = 1,
    this.onTap,
    this.suffixIcon,
    this.autoValidateMode,
    this.textStyle,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      autovalidateMode: autoValidateMode,
      onTap: onTap,
      maxLines: maxLines,
      readOnly: readOnly,
      style: textStyle,
      keyboardType: keyboardType,
      textDirection: textDirection,
      obscureText: obscureText,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        label: Text(label),
        labelStyle: TextStyle(color: BaseColors.purple096),
        prefixIcon: Icon(icon, color: BaseColors.purple096),
        suffixIcon: suffixIcon,
        prefixIconConstraints: const BoxConstraints(
          maxHeight: 25,
          minWidth: 50,
        ),
        // hintText: hintText,
        hintStyle: TextStyle(
          color: BaseColors.purple096,
          fontSize: Get.width < 350 ? 15 : null,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: BaseColors.greyDDD),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: BaseColors.greyDDD),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: BaseColors.greyDDD),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Color(0xFFD74545)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Color(0xFFD74545)),
        ),
        errorStyle: const TextStyle(color: Color(0xFFD74545)),
        errorMaxLines: 2,
      ),
    );
  }
}
