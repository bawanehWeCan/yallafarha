import 'package:flutter/material.dart';
import 'package:yallah_farha/utils/base/colors.dart';

class BaseTextStyle {
  static TextStyle _getStyle(double size, Color color, FontWeight fontWeight) {
    return TextStyle(fontSize: size, color: color, fontWeight: fontWeight);
  }

  //pelorous
  static final pelorous14 = TextStyle(color: BaseColors.pelorous, fontSize: 14);
  static final pelorous18Bold = TextStyle(color: BaseColors.pelorousDark, fontSize: 18, fontWeight: FontWeight.bold);

  //white
  static final white10 = TextStyle(color: BaseColors.white, fontSize: 10);
  static final white12 = TextStyle(color: BaseColors.white, fontSize: 12);
  static final white14 = TextStyle(color: BaseColors.white, fontSize: 14);
  static final white16 = TextStyle(color: BaseColors.white, fontSize: 16, fontWeight: FontWeight.w200);
  static final white16UltraBold = TextStyle(color: BaseColors.white, fontSize: 16, fontWeight: FontWeight.w900);
  static final white28SemiBold = TextStyle(color: BaseColors.white, fontSize: 28, fontWeight: FontWeight.w600);
  static final white28SemiBoldTest = _getStyle(28, Colors.white, FontWeight.w600);
  static final white48SemiBold = TextStyle(color: BaseColors.white, fontSize: 48, fontWeight: FontWeight.w600);
  static final white20UltraLight = TextStyle(color: BaseColors.white, fontSize: 20, fontWeight: FontWeight.w200);
  static final white20UltraBold = TextStyle(color: BaseColors.white, fontSize: 20, fontWeight: FontWeight.w900);
  static final white20Bold = TextStyle(color: BaseColors.white, fontSize: 20, fontWeight: FontWeight.bold);
  static final white38SemiBold = TextStyle(color: BaseColors.white, fontSize: 38, fontWeight: FontWeight.w600);

  //black
  static final black10Bold = TextStyle(color: BaseColors.black, fontSize: 10, fontWeight: FontWeight.bold);
  static final black11 = TextStyle(color: BaseColors.black, fontSize: 11);
  static final black14 = TextStyle(color: BaseColors.black, fontSize: 14);
  static final black20SemiBold = TextStyle(color: BaseColors.black, fontSize: 20, fontWeight: FontWeight.w600);
  static final black20UltraLight = TextStyle(color: BaseColors.black, fontSize: 20, fontWeight: FontWeight.w200);
  static final black14Bold = TextStyle(color: BaseColors.black, fontSize: 14, fontWeight: FontWeight.bold);
  static final black18Bold = TextStyle(color: BaseColors.black, fontSize: 18, fontWeight: FontWeight.bold);
  static final black16UltraBold = TextStyle(color: BaseColors.black, fontSize: 16, fontWeight: FontWeight.w600);

  //purple
  static final purple7CC = TextStyle(color: BaseColors.purple7CC);
  static final purple1019FBold = TextStyle(color: BaseColors.purple19F, fontSize: 10, fontWeight: FontWeight.bold);
  static final purple127ACUltraLight = TextStyle(color: BaseColors.purple7A2, fontSize: 10, fontWeight: FontWeight.w200);

  //grey
  static final grey14SemiBold = TextStyle(color: BaseColors.greyA9A, fontSize: 14, fontWeight: FontWeight.w600);
  static final grey12UltraLight = TextStyle(color: BaseColors.greyA9A, fontSize: 12, fontWeight: FontWeight.w200);
}
