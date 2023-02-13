import 'package:flutter/material.dart';

class BaseColors {
  static Color _getColor(String hex) {
    var hexadecimal = int.parse("0xFF$hex");
    return Color(hexadecimal);
  }

  static Color get primary => _getColor("FD0096");

  //white
  static Color get white => _getColor("FFFFFF");

  //black
  static Color get black => _getColor("000000");
  static Color get black939Opacity70 => _getColor("393939").withOpacity(0.70);

  //purple
  static Color get purple09D => _getColor("CD409D");
  static Color get purple1A6 => _getColor("BD41A6");
  static Color get purple096 => _getColor("FD0096");
  static Color get purple9E0 => _getColor("5C49E0");
  static Color get purple3B7 => _getColor("A243B7");
  static Color get purple55C => _getColor("94155C");
  static Color get purple08D => _getColor("E4208D");
  static Color get purple18D => _getColor("AF218D");
  static Color get purple38D => _getColor("85238D");
  static Color get purple48D => _getColor("67248D");
  static Color get purple58E => _getColor("4F258E");
  static Color get purpleF98 => _getColor("D83F98");
  static Color get purple3B3 => _getColor("A943B3");
  static Color get purple6C4 => _getColor("8E46C4");
  static Color get purpleBE9 => _getColor("514BE9");
  static Color get purple4A4 => _getColor("C644A4");
  static Color get purple7CC => _getColor("8147CC");
  static Color get purple0A1 => _getColor("C740A1");
  static Color get purple8CF => _getColor("7C48CF");
  static Color get purple19F => _getColor("D3319F");
  static Color get purple09E => _getColor("D3309E");
  static Color get purple7A2 => _getColor("CC37A2");

  //grey
  static Color get greyDDD => _getColor("DDDDDD");
  static Color get grey2F2 => _getColor("F2F2F2");
  static Color get greyA9A => _getColor("9A9A9A");
  static Color get greyEDB => _getColor("DEDEDB");
  static Color get greyDF2 => _getColor("E9EDF2");

  //pelorous
  static Color get pelorous => _getColor("74BFC7");
  static Color get pelorousDark => _getColor("76BCC6");

  //red
  static Color get red202 => _getColor("FD0202");

  //yellow
  static Color get yellowE1F => _getColor("FFEE1F");
  static Color get yellowE3D => _getColor("FFEE3D");

  //shadow color
  static Color get shadow => _getColor("D2309E");

  //facebook
  static Color get facebook => _getColor("4267B2");

  static Color get disabledButton => _getColor("DCDCDC");
  static Color get disabledTextButton => _getColor("888888");
}
