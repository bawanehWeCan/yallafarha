import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/utils/base/colors.dart';

class IntroBody extends StatelessWidget {
  final Function() onPressedLeft;
  final Function() onPressedRight;
  final String image;

  const IntroBody({
    Key? key,
    required this.onPressedLeft,
    required this.onPressedRight,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover
        )
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: onPressedLeft,
              icon: Icon(
                Icons.navigate_before,
                color: BaseColors.white,
                size: 40,
              ),
            ),
            IconButton(
              onPressed: onPressedRight,
              icon: Icon(
                Icons.navigate_next,
                color: BaseColors.white,
                size: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:yallah_farha/utils/base/colors.dart';
// import 'package:yallah_farha/utils/base/images.dart';
// import 'package:yallah_farha/utils/base/text_style.dart';
//
// class IntroBody extends StatelessWidget {
//   final String stepNum;
//   final String title;
//   final Function() onPressedLeft;
//   final Function() onPressedRight;
//   final int index;
//
//   const IntroBody({
//     Key? key,
//     required this.stepNum,
//     required this.title,
//     required this.onPressedLeft,
//     required this.onPressedRight,
//     required this.index,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text("Yalla Farha".tr, style: BaseTextStyle.white48SemiBold),
//         const SizedBox(height: 50),
//         Text(stepNum.tr, style: BaseTextStyle.white20UltraLight),
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 30),
//           child: Text(title.tr, style: BaseTextStyle.white20UltraBold),
//         ),
//         // Text(description, style: BaseTextStyle.white16),
//         Padding(
//           padding: const EdgeInsets.symmetric(vertical: 30),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               IconButton(
//                 onPressed: onPressedLeft,
//                 icon: Icon(
//                   Icons.navigate_before,
//                   color: BaseColors.white,
//                   size: 40,
//                 ),
//               ),
//               IconButton(
//                 onPressed: onPressedRight,
//                 icon: Icon(
//                   Icons.navigate_next,
//                   color: BaseColors.white,
//                   size: 40,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Flexible(
//           child: Align(
//             alignment: Alignment.bottomCenter,
//             child: Image.asset(
//               BaseImages.mobile,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
