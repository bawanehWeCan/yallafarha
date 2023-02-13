import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yallah_farha/utils/base/colors.dart';

class VerificationTextField extends StatelessWidget {
  final String? initialValue;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final TextAlign? textAlign;
  final TextStyle? style;
  final List<TextInputFormatter>? inputFormatters;

  const VerificationTextField({
    Key? key,
    this.initialValue,
    this.prefixIcon,
    this.onChanged,
    this.controller,
    this.focusNode,
    this.keyboardType,
    this.textAlign,
    this.style,
    this.inputFormatters,
  }) : super(key: key);

  static const _border = 19.0;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: style,
      textAlign: textAlign ?? TextAlign.start,
      keyboardType: keyboardType,
      focusNode: focusNode,
      textDirection: TextDirection.ltr,
      initialValue: initialValue,
      controller: controller,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        filled: true,
        fillColor: BaseColors.white,
        prefixIcon: prefixIcon,
        prefixIconConstraints: const BoxConstraints(
          maxHeight: 80,
          minWidth: 70,
          maxWidth: 70,
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
