import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/ui/widgets/custom_network_image.dart';
import 'package:yallah_farha/utils/base/border_radius.dart';
import 'package:yallah_farha/utils/base/colors.dart';
import 'package:yallah_farha/utils/base/text_style.dart';

class OpenOccasionBox extends StatelessWidget {
  final String title;
  final String image;
  final String start;
  final String end;
  final String percent;
  final Function() onPressed;

  const OpenOccasionBox({
    Key? key,
    required this.title,
    required this.image,
    required this.start,
    required this.end,
    required this.percent,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: BaseTextStyle.black14Bold),
                  const SizedBox(height: 7),
                  CustomNetworkImage(
                    url: image,
                    height: 100,
                    border: 15,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: SizedBox(
                height: 155,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.calendarDays,
                          color: BaseColors.purple19F,
                          size: 15,
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 50,
                          child: Text(
                            "Start".tr,
                            style: BaseTextStyle.grey14SemiBold,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          start,
                          style: BaseTextStyle.grey12UltraLight,
                        ),
                        const Spacer(flex: 2),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.calendarDays,
                          color: BaseColors.purple19F,
                          size: 15,
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 50,
                          child: Text(
                            "End".tr,
                            style: BaseTextStyle.grey14SemiBold,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          end,
                          style: BaseTextStyle.grey12UltraLight,
                        ),
                        const Spacer(flex: 2),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      "$percent%",
                    ),
                    Stack(
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
                          widthFactor: int.parse(percent) / 100,
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
                    const Spacer(),
                    SizedBox(
                      width: 100,
                      child: ElevatedButton(
                        onPressed: onPressed,
                        child: Text("Open".tr),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
