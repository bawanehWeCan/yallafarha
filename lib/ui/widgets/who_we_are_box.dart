import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/ui/screens/shared/who_we_are.dart';
import 'package:yallah_farha/ui/web_content_screen.dart';
import 'package:yallah_farha/utils/base/border_radius.dart';
import 'package:yallah_farha/utils/base/decoration.dart';
import 'package:yallah_farha/utils/base/text_style.dart';

class WhoWeAreBox extends StatelessWidget {
  const WhoWeAreBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      decoration: BaseDecoration.baseGradient.copyWith(borderRadius: BaseBorderRadius.border15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("WHO WE ARE".tr, style: BaseTextStyle.white28SemiBold),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Text(
              "Our mission is to support and achieve social solidarity and facilitating the process of the people getting married, having weddings and other happy events by taking advantage of the development of technology in order to transform".tr,
              style: BaseTextStyle.white12,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 144,
            child: Material(
              borderRadius: BaseBorderRadius.border20,
              color: Colors.white.withOpacity(0.19),
              child: InkWell(
                borderRadius: BaseBorderRadius.border20,
                onTap: () {
                  Get.to(() => const WebContentScreen(url: 'https://yalafarha.com/about-us'));
                },
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Read more".tr,
                      style: BaseTextStyle.white14,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
