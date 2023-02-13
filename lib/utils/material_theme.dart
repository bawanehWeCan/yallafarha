import 'package:flutter/material.dart';
import 'package:yallah_farha/utils/base/colors.dart';

class AppThemeData {
  ThemeData get materialTheme {
    return ThemeData(
      fontFamily: "Tajawal",
      colorScheme: ColorScheme.fromSeed(
        seedColor: BaseColors.primary,
        primary: BaseColors.primary,
        secondary: BaseColors.primary,
      ),
      // textTheme: const TextTheme(
      //   bodyText2: TextStyle(
      //     color: MyColors.textColor,
      //   ),
      //   headline6: TextStyle(color: MyColors.textColor),
      //   headline5: TextStyle(color: MyColors.textColor),
      //   headline4: TextStyle(color: MyColors.textColor),
      // ),
    );
  }
}
