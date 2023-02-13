import 'package:flutter/material.dart';
import 'package:yallah_farha/utils/base/border_radius.dart';
import 'package:yallah_farha/utils/base/colors.dart';

class CustomRoundedButton extends StatelessWidget {
  final Function()? onPressed;
  final String label;
  final String status;
  final Object heroTag;

  const CustomRoundedButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.status = "default",
    required this.heroTag,
  }) : super(key: key);

  static double _width(String status) {
    switch (status) {
      case "full_width":
        {
          return double.infinity;
        }
      default:
        {
          return 144;
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: _width(status),
        child: FloatingActionButton.extended(
          heroTag: heroTag,
          backgroundColor: onPressed == null ? BaseColors.disabledButton : BaseColors.purple3B7,
          onPressed: onPressed,
          label: Text(
            label,
            style: TextStyle(color: onPressed == null ? BaseColors.disabledTextButton : Colors.white),
          ),
          shape: RoundedRectangleBorder(borderRadius: BaseBorderRadius.border20),
        ),
      ),
    );
  }
}
