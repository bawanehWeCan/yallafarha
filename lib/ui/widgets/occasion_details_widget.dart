import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/utils/base/border_radius.dart';
import 'package:yallah_farha/utils/base/colors.dart';
import 'package:yallah_farha/utils/base/text_style.dart';

class OccasionsDetailsCard extends StatelessWidget {
  final String days;
  final double percent;
  final String needed;
  final String collected;
  final bool isShown;

  const OccasionsDetailsCard({
    Key? key,
    required this.days,
    required this.percent,
    required this.needed,
    required this.collected,
    required this.isShown,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BaseBorderRadius.border15,
        color: BaseColors.white,
        boxShadow: [
          BoxShadow(
            color: BaseColors.shadow.withOpacity(0.26),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(FontAwesomeIcons.clock),
              const SizedBox(width: 5),
              Text(
                "$days ${"Days left".tr}",
                style: BaseTextStyle.black14Bold,
              ),
              const Spacer(),
              Text(
                "${percent.floor()}%",
                style: BaseTextStyle.black14Bold,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  height: 15,
                  decoration: BoxDecoration(
                    color: BaseColors.greyDDD,
                    borderRadius: BaseBorderRadius.border20,
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: percent / 100,
                  child: Container(
                    height: 15,
                    decoration: BoxDecoration(
                      color: BaseColors.purple19F,
                      borderRadius: BaseBorderRadius.border20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (isShown)
            Row(
              children: [
                Text(
                  "Total fund needed".tr,
                  style: BaseTextStyle.black10Bold,
                ),
                const SizedBox(width: 5),
                Text(
                  needed,
                  style: BaseTextStyle.purple1019FBold,
                ),
                const Spacer(),
                Text(
                  "Collected".tr,
                  style: BaseTextStyle.black10Bold,
                ),
                const SizedBox(width: 5),
                Text(
                  collected,
                  style: BaseTextStyle.purple1019FBold,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
