import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yallah_farha/utils/base/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextDirection? textDirection;
  final TextInputType? keyboardType;
  final int maxLines;
  final String labelText;
  final String? hintText;
  final int? maxLength;
  final bool readOnly;
  final TextStyle? counterStyle;
  final Function()? onTap;
  final String? Function(String?)? validator;
  final AutovalidateMode? autoValidateMode;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField({
    Key? key,
    this.controller,
    this.textDirection,
    this.keyboardType,
    this.maxLines = 1,
    required this.labelText,
    this.validator,
    this.autoValidateMode,
    this.hintText,
    this.floatingLabelBehavior,
    this.maxLength,
    this.readOnly = false,
    this.onTap,
    this.inputFormatters,
    this.counterStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      readOnly: readOnly,
      onTap: onTap,
      maxLength: maxLength,
      autovalidateMode: autoValidateMode,
      validator: validator,
      maxLines: maxLines,
      keyboardType: keyboardType,
      textDirection: textDirection,
      controller: controller,
      decoration: InputDecoration(
        floatingLabelBehavior: floatingLabelBehavior,
        alignLabelWithHint: true,
        labelText: labelText,
        // label: Text(label),
        counterStyle: counterStyle,
        labelStyle: TextStyle(color: BaseColors.purple096),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.black,
          fontSize: 12,
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
      ),
    );
  }
}
