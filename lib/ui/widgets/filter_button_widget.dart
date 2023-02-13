import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/utils/base/text_style.dart';

class FilterButtonWidget extends StatelessWidget {
  final Function() onPressed;

  const FilterButtonWidget({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Category".tr, style: BaseTextStyle.black20SemiBold),
          TextButton(
            onPressed: onPressed,
            child: Row(
              children: [
                const Icon(FontAwesomeIcons.filter),
                const SizedBox(width: 10),
                Text("Filter".tr),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
