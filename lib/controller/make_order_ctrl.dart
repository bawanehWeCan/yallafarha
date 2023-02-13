import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/model/ecommerce/make_order_model.dart';
import 'package:yallah_farha/network/ecommerce/make_order_api.dart';
import 'package:yallah_farha/ui/screens/ecommerce/cart.dart';
import 'package:yallah_farha/utils/app_constants.dart';

class MakeOrderCtrl extends GetxController {
  static MakeOrderCtrl get find => Get.find();

  MakeOrderModel? model;
  final orderList = <ProductList>[].obs;

  void showLoading() {
    EasyLoading.instance
      ..loadingStyle = EasyLoadingStyle.custom
      ..maskType = EasyLoadingMaskType.custom
      ..indicatorColor = Colors.transparent
      ..textColor = Colors.transparent
      ..maskColor = Colors.black26
      ..backgroundColor = Colors.transparent
      ..boxShadow = [];
    EasyLoading.show(
      indicator: const CircularProgressIndicator(),
    );
  }

  Future fetchData({
    required BuildContext context,
  }) async {
    showLoading();
    model = await MakeOrderApi.data();
    if (model == null) {
      Fluttertoast.showToast(msg: AppConstants.failedMessage);
      EasyLoading.dismiss();
      return;
    }
    EasyLoading.dismiss();
    if (model!.errNum == 200) {
      orderList.value = model!.data!.products!;
      log('orderList:: $orderList');
      Get.to(() => const CartScreen());
    } else {
      Fluttertoast.showToast(msg: model!.msg!);
    }
  }
}
