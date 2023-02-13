import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/binding/initial_binding.dart';
import 'package:yallah_farha/model/become_supplier/become_supplier_model.dart';
import 'package:yallah_farha/network/become_supplier/become_supplier.dart';
import 'package:yallah_farha/ui/base_nav_bar.dart';
import 'package:yallah_farha/utils/app_constants.dart';

class BecomeSupplierCtrl {
  static BecomeSupplierModel? becomeSupplierModel;

  static Future fetchBecomeSupplierData({
    required String email,
    required String phone,
    required String name,
    required String message,
    required BuildContext context,
  }) async {
    AppConstants.showLoading(context);
    becomeSupplierModel = await BecomeSupplierApi.data(email: email, phone: phone, name: name, message: message);
    if (becomeSupplierModel == null) {
      Fluttertoast.showToast(msg: AppConstants.failedMessage);
      Loader.hide();
      return;
    }
    if (becomeSupplierModel!.errNum == 200) {
      Get.to(() => const BaseNavBar(), binding: BaseNavBinding());
      Fluttertoast.showToast(msg: 'Your request was sent successfully'.tr);
    } else {
      Fluttertoast.showToast(msg: AppConstants.failedMessage);
    }
    Loader.hide();
  }
}
