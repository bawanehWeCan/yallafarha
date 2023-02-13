import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/utils/base/colors.dart';

class MyCartText extends StatelessWidget {
  const MyCartText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
      child: Text(
        "My cart".tr,
        style: Theme.of(context).textTheme.headline4!.copyWith(
              fontWeight: FontWeight.bold,
              color: BaseColors.black,
            ),
      ),
    );
  }
}
