import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/utils/base/text_style.dart';

class CheckOutWidget extends StatelessWidget {
  final String totalPrice;
  final Function() onPressed;

  const CheckOutWidget({
    Key? key,
    required this.onPressed,
    required this.totalPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      height: 80,
      width: double.infinity,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.black,
            width: 1.5,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FittedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Total price".tr,
                  style: BaseTextStyle.grey14SemiBold,
                ),
                const SizedBox(height: 8),
                Text(
                  "$totalPrice ${"JD".tr}",
                  style: BaseTextStyle.black14Bold,
                ),
              ],
            ),
          ),
          const SizedBox(width: 30),
          Expanded(
            child: FloatingActionButton.extended(
              heroTag: "9i4ssi",
              onPressed: onPressed,
              label: Text("Checkout".tr),
            ),
          ),
        ],
      ),
    );
  }
}
