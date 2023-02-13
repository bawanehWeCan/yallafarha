import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/utils/base/colors.dart';
import 'package:yallah_farha/utils/base/text_style.dart';

class OccasionTimeLine extends StatelessWidget {
  final String start;
  final String end;

  const OccasionTimeLine({
    Key? key,
    required this.start,
    required this.end,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(FontAwesomeIcons.calendarDays, color: BaseColors.purple19F),
        const SizedBox(width: 5),
        Text("Start".tr, style: BaseTextStyle.grey14SemiBold),
        const SizedBox(width: 5),
        Text(start, style: BaseTextStyle.grey12UltraLight),
        const Spacer(),
        Icon(FontAwesomeIcons.calendarDays, color: BaseColors.purple19F),
        const SizedBox(width: 5),
        Text("End".tr, style: BaseTextStyle.grey14SemiBold),
        const SizedBox(width: 5),
        Text(end, style: BaseTextStyle.grey12UltraLight),
      ],
    );
  }
}
