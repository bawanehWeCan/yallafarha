import 'package:flutter/material.dart';
import 'package:yallah_farha/utils/base/border_radius.dart';
import 'package:yallah_farha/utils/base/text_style.dart';

class CustomMaterialRoundedButton extends StatelessWidget {
  final String title;
  final Color color;
  final Function() onTap;
  final bool isAdded;

  const CustomMaterialRoundedButton({
    Key? key,
    required this.title,
    required this.color,
    required this.onTap,
    required this.isAdded,
  }) : super(key: key);

  static Widget _toggleWidget(String title, bool isAdded) {
    if (isAdded) {
      return FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: BaseTextStyle.white14,
            ),
            const SizedBox(width: 5),
            const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 10,
              child: Icon(
                Icons.check,
                color: Colors.black,
                size: 15,
              ),
            ),
          ],
        ),
      );
    } else {
      return FittedBox(
        child: Text(
          title,
          style: BaseTextStyle.white14,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Material(
        color: color,
        borderRadius: BaseBorderRadius.border20,
        child: InkWell(
          borderRadius: BaseBorderRadius.border20,
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Center(
              child: _toggleWidget(title, isAdded),
            ),
          ),
        ),
      ),
    );
  }
}
