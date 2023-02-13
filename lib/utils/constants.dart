import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/utils/base/colors.dart';

final occasionDropDownDec = InputDecoration(
  labelText: "Occasion*".tr,
  hintText: "Occasion name: wedding".tr,
  labelStyle: TextStyle(color: BaseColors.purple096),
  floatingLabelStyle: TextStyle(color: BaseColors.purple096),
  hintStyle: const TextStyle(
    color: Colors.black,
    fontSize: 12,
  ),
  floatingLabelBehavior: FloatingLabelBehavior.always,
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
);
