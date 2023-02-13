import 'package:flutter/material.dart';
import 'package:yallah_farha/utils/base/border_radius.dart';
import 'package:yallah_farha/utils/base/colors.dart';
import 'package:yallah_farha/utils/base/text_style.dart';

class ViewPayButton extends StatelessWidget {
  final String title;

  const ViewPayButton({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: BaseColors.purple0A1,
      borderRadius: BaseBorderRadius.border20,
      child: InkWell(
        borderRadius: BaseBorderRadius.border20,
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Center(
            child: Text(
              title,
              style: BaseTextStyle.white14,
            ),
          ),
        ),
      ),
    );
  }
}
