import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/utils/base/images.dart';
import 'package:yallah_farha/utils/base/text_style.dart';

class ShareReviewDialog extends StatelessWidget {
  const ShareReviewDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(BaseImages.hand, height: 250),
        const SizedBox(height: 20),
        Text(
          'We’re happy to Share your experience with everyone!'.tr,
          textAlign: TextAlign.center,
          style: BaseTextStyle.black18Bold,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
