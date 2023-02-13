import 'package:flutter/material.dart';
import 'package:yallah_farha/utils/base/border_radius.dart';
import 'package:yallah_farha/utils/base/text_style.dart';

class AttachFileButton extends StatelessWidget {
  final String title;
  final Color color;
  final Function() onTap;

  const AttachFileButton({
    Key? key,
    required this.title,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: BaseBorderRadius.border20,
      child: InkWell(
        borderRadius: BaseBorderRadius.border20,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
          child: Center(
            child: Text(
              title,
              style: BaseTextStyle.white10,
            ),
          ),
        ),
      ),
    );
  }
}
