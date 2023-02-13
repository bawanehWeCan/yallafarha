import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/controller/payment/zain_cash/step2.dart';
import 'package:yallah_farha/model/payment/zain_cash/zain_cash_step1_model.dart';
import 'package:yallah_farha/network/payment/zain_cash/step1.dart';
import 'package:yallah_farha/ui/widgets/zain_cash_dialog.dart';
import 'package:yallah_farha/utils/app_constants.dart';

class ZainCashStep1Controller {
  static ZainCashStep1Model? zainCashStep1Model;

  static _showDialog({
    required String name,
    required String phone,
    required String amount,
    required String id,
    required String content,
    required BuildContext context,
  }) {
    Get.lazyPut(() => ZainCashStep2Controller());
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(16.0),
      title: "Verification Code".tr,
      content: ZainCashDialog(
        name: name,
        phone: phone,
        amount: amount,
        id: id,
        content: content,
      ),
    ).then((value) {
      Get.delete<ZainCashStep2Controller>();
    });
  }

  static Future fetchZainCashStep1Data({
    required String name,
    required String phone,
    required String amount,
    required String id,
    required String content,
    required BuildContext context,
  }) async {
    AppConstants.showLoading(context);
    zainCashStep1Model = await ZainCashStep1Api.data(
      name: name,
      phone: phone,
      amount: amount,
      id: id,
      content: content,
    );
    if (zainCashStep1Model == null) {
      Fluttertoast.showToast(msg: AppConstants.failedMessage);
      Loader.hide();
      return;
    }
    if (zainCashStep1Model!.errNum == 200) {
      _showDialog(
        name: name,
        phone: phone,
        amount: amount,
        id: id,
        content: content,
        context: context,
      );
    } else {
      Fluttertoast.showToast(msg: AppConstants.failedMessage);
    }
    Loader.hide();
  }
}
