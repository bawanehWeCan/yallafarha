import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/utils/base/colors.dart';
import 'package:yallah_farha/utils/base/text_style.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(child: Divider(color: BaseColors.greyDDD)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Text("OR".tr, style: BaseTextStyle.pelorous18Bold),
        ),
        Expanded(child: Divider(color: BaseColors.greyDDD)),
      ],
    );
  }
}
