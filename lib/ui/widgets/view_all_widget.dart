import 'package:flutter/material.dart';
import 'package:yallah_farha/ui/widgets/custom_text_arrow_button.dart';
import 'package:yallah_farha/utils/base/text_style.dart';

class ViewAllWidget extends StatelessWidget {
  final String title;
  final Function() onPressed;

  const ViewAllWidget({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 20, top: 20, end: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: BaseTextStyle.black20SemiBold,
          ),
          CustomTextArrowButton(
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
