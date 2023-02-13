import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/controller/base_nav_bar_ctrl.dart';
import 'package:yallah_farha/ui/base_nav_bar.dart';
import 'package:yallah_farha/utils/base/border_radius.dart';
import 'package:yallah_farha/utils/base/images.dart';
import 'package:yallah_farha/utils/base/text_style.dart';

class FooterImagesWidget extends StatelessWidget {
  const FooterImagesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ListBody(
        children: [
          GestureDetector(
            onTap: () {
              // Get.to(() => const AboutUsScreen());
            },
            child: Hero(
              tag: "charity",
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BaseBorderRadius.border15,
                    child: Image.asset(
                      BaseImages.charity,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Text(
                    "Coming soon".tr,
                    style: BaseTextStyle.white38SemiBold,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              BaseNavBarCtrl.find.navBarController.index = 2;
            },
            child: ClipRRect(
              borderRadius: BaseBorderRadius.border15,
              child: Image.asset(
                BaseImages.yalaFarhaShop,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
