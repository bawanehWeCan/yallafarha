import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/utils/base/colors.dart';
import 'package:yallah_farha/utils/base/text_style.dart';
import 'package:yallah_farha/utils/shared_prefrences.dart';

class CustomTextArrowButton extends StatelessWidget {
  final Function() onPressed;

  const CustomTextArrowButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        children: [
          Text(
            "View all".tr,
            style: BaseTextStyle.purple7CC,
          ),
          const SizedBox(width: 2),
          Icon(
            MySharedPreferences.language == "en" ? FontAwesomeIcons.circleRight : FontAwesomeIcons.circleLeft,
            size: 20,
            color: BaseColors.purple7CC,
          ),
        ],
      ),
    );
  }
}
