import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/binding/initial_binding.dart';
import 'package:yallah_farha/model/payment/zain_cash/zain_cash_step2_model.dart';
import 'package:yallah_farha/network/payment/zain_cash/step2.dart';
import 'package:yallah_farha/ui/base_nav_bar.dart';
import 'package:yallah_farha/utils/app_constants.dart';

class ZainCashStep2Controller extends GetxController {
  static ZainCashStep2Controller get find => Get.find();

  ZainCashStep2Model? zainCashStep2Model;
  final isLoading = false.obs;

  void toggleLoading(bool status) {
    isLoading.value = status;
    update();
  }

  Future fetchZainCashStep2Data({
    required String name,
    required String phone,
    required String amount,
    required String id,
    required int code,
    required String content,
    required BuildContext context,
  }) async {
    toggleLoading(true);
    zainCashStep2Model = await ZainCashStep2Api.data(
      name: name,
      phone: phone,
      amount: amount,
      id: id,
      content: content,
      code: code,
    );
    if (zainCashStep2Model == null) {
      Get.back();
      Fluttertoast.showToast(msg: AppConstants.failedMessage);
      toggleLoading(false);
      return;
    }
    if (zainCashStep2Model!.errNum == 200) {
      Get.back();
      Get.offAll(() => const BaseNavBar(), binding: BaseNavBinding());
      Fluttertoast.showToast(msg: "You have paid successfully".tr);
    } else {
      Get.back();
      toggleLoading(false);
      Fluttertoast.showToast(msg: "incorrect code".tr);
    }
    toggleLoading(false);
  }
}
