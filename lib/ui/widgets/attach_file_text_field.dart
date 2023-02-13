import 'package:flutter/material.dart';
import 'package:yallah_farha/utils/base/colors.dart';

class AttachFileTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String labelText;
  final String hintText;
  final String? Function(String?)? validator;
  final Function(String) onChanged;
  final Color color;

  const AttachFileTextField({
    Key? key,
    this.controller,
    required this.labelText,
    this.validator,
    required this.hintText,
    required this.onChanged,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      maxLines: 5,
      keyboardType: TextInputType.multiline,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: hintText,
        alignLabelWithHint: true,
        labelText: labelText,
        labelStyle: TextStyle(color: BaseColors.purple096),
        hintStyle: const TextStyle(
          color: Colors.black,
          fontSize: 12,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(5)),
          borderSide: BorderSide(color: color),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(5)),
          borderSide: BorderSide(color: color),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(5)),
          borderSide: BorderSide(color: color),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
          borderSide: BorderSide(color: Color(0xFFD74545)),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
          borderSide: BorderSide(color: Color(0xFFD74545)),
        ),
        errorStyle: const TextStyle(color: Color(0xFFD74545)),
      ),
    );
  }
}
