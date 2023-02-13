import 'package:flutter/material.dart';
import 'package:yallah_farha/utils/base/border_radius.dart';
import 'package:yallah_farha/utils/base/colors.dart';

class BaseDecoration {
  static const AlignmentGeometry _centerLeft = Alignment.centerLeft;
  static const AlignmentGeometry _centerRight = Alignment.centerRight;
  static const AlignmentGeometry _topLeft = Alignment.topLeft;
  static const AlignmentGeometry _bottomRight = Alignment.bottomRight;

  static final List<Color> _registrationBackgroundColors = [BaseColors.purple09D, BaseColors.purple1A6, BaseColors.purple9E0];
  static final List<Color> _introBackground0Colors = [BaseColors.purple55C, BaseColors.purple08D];
  static final List<Color> _introBackground1And3Colors = [BaseColors.purple08D, BaseColors.purple18D, BaseColors.purple38D, BaseColors.purple48D, BaseColors.purple58E];
  static final List<Color> _introBackground2Colors = [BaseColors.purple38D, BaseColors.purple38D];
  static final List<Color> _baseGradientColors = [BaseColors.purpleF98, BaseColors.purple3B3, BaseColors.purple6C4, BaseColors.purpleBE9];

  static BoxDecoration _getDecoration({
    required Color color,
    BorderRadius? radius,
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: radius,
    );
  }

  static BoxDecoration _getGradientDecoration({
    required List<Color> colors,
    required AlignmentGeometry begin,
    required AlignmentGeometry end,
    BorderRadius? radius,
  }) {
    return BoxDecoration(
      borderRadius: radius,
      gradient: LinearGradient(
        colors: colors,
        begin: begin,
        end: end,
      ),
    );
  }

  static BoxDecoration get introBackground0 => _getGradientDecoration(colors: _registrationBackgroundColors, begin: _topLeft, end: _bottomRight);
  static BoxDecoration get registrationBackground =>
      _getGradientDecoration(colors: _registrationBackgroundColors, begin: _topLeft, end: _bottomRight, radius: const BorderRadius.vertical(bottom: Radius.circular(23)));
  static BoxDecoration get introBackground1 => _getGradientDecoration(colors: _introBackground0Colors, begin: _centerLeft, end: _centerRight);
  static BoxDecoration get introBackground2And4 => _getGradientDecoration(colors: _introBackground1And3Colors, begin: _centerLeft, end: _centerRight);
  static BoxDecoration get introBackground3 => _getGradientDecoration(colors: _introBackground2Colors, begin: _centerLeft, end: _centerRight);
  // static BoxDecoration get baseGradient => _getGradientDecoration(colors: _baseGradientColors, begin: _centerLeft, end: _centerRight);
  static BoxDecoration get baseGradient => _getGradientDecoration(colors: [const Color(0xFFEF2098), const Color(0xFF7B3DBA)], begin: _centerLeft, end: _centerRight);
  static BoxDecoration get whiteBubble => _getDecoration(color: Colors.white, radius: BaseBorderRadius.border20);
  static BoxDecoration get myProfileBubble => _getGradientDecoration(colors: _baseGradientColors, begin: _topLeft, end: _bottomRight);

  static BoxDecoration get storyCircle => BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: BaseColors.purpleF98, width: 5),
      );

  static BoxDecoration get categoryCard => BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            BaseColors.purple0A1,
            BaseColors.purple8CF,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      );
}
