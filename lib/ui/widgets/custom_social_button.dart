import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yallah_farha/utils/base/border_radius.dart';
import 'package:yallah_farha/utils/base/icons.dart';

class CustomSocialButton extends StatelessWidget {
  final Color color;
  final bool isGoogle;
  final IconData? icon;
  final Function() onTap;

  const CustomSocialButton({
    Key? key,
    required this.color,
    this.isGoogle = false,
    this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final border10 = BaseBorderRadius.border10;
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: color,
        borderRadius: border10,
        border: isGoogle ? Border.all(color: Colors.grey) : null,
      ),
      child: Material(
        borderRadius: border10,
        color: Colors.transparent,
        child: InkWell(
          borderRadius: border10,
          onTap: onTap,
          child: isGoogle
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    BaseIcon.google,
                  ),
                )
              : Icon(icon, color: Colors.white),
        ),
      ),
    );
  }
}
