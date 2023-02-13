import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/controller/make_order_ctrl.dart';
import 'package:yallah_farha/controller/my_order_ctrl.dart';
import 'package:yallah_farha/ui/surfaces/signin_dialog.dart';
import 'package:yallah_farha/utils/app_constants.dart';
import 'package:yallah_farha/utils/base/colors.dart';

class ViewCartButton extends StatelessWidget {
  const ViewCartButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: GetBuilder<MyOrderCtrl>(
        builder: (controller) {
          return ElevatedButton(
            onPressed: () {
              if (CheckUserSignIn.check(context)) {
                if (controller.orderList.isEmpty) {
                  Get.snackbar(
                    '',
                    'Cart is empty'.tr,
                    colorText: Colors.white,
                    backgroundColor: BaseColors.purple48D,
                    titleText: const SizedBox.shrink(),
                    margin: const EdgeInsets.all(10.0),
                  );
                } else {
                  MakeOrderCtrl.find.fetchData(context: context);
                }
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: BaseColors.purple0A1,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
              fixedSize: const Size(double.infinity, 50),
              minimumSize: const Size(double.infinity, 50),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 35,
                  width: 35,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: BaseColors.purple48D,
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: GetBuilder<MyOrderCtrl>(
                    builder: (controller) {
                      return Text(
                        controller.totalQuantity.value.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      );
                    },
                  ),
                ),
                Text(
                  "View Cart".tr,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                GetBuilder<MyOrderCtrl>(
                  builder: (controller) {
                    return Opacity(
                      opacity: controller.orderList.isEmpty ? 0.0 : 1,
                      child: Text(
                        "${controller.totalPrice.value} $kCurrency",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
