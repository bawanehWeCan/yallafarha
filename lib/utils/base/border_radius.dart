import 'package:flutter/cupertino.dart';

class BaseBorderRadius {
  static BorderRadius _getRadius(double radius) {
    return BorderRadius.circular(radius);
  }

  static BorderRadius get border10 => _getRadius(10);
  static BorderRadius get border15 => _getRadius(15);
  static BorderRadius get border18 => _getRadius(18);
  static BorderRadius get border20 => _getRadius(20);
}
