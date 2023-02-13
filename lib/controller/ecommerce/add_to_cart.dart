import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/model/ecommerce/add_to_card_model.dart';
import 'package:yallah_farha/network/ecommerce/add_to_cart.dart';
import 'package:yallah_farha/utils/app_constants.dart';

class AddToCartCtrl {
  static AddToCartModel? model;

  static Future fetchApiData({
    required int id,
    required int quantity,
    required BuildContext context,
  }) async {
    AppConstants.showLoading(context);
    model = await AddToCartApi.data(id: id, quantity: quantity);
    if (model == null) {
      Fluttertoast.showToast(msg: AppConstants.failedMessage);
      Loader.hide();
      return;
    }
    if (model!.errNum == 200) {
      Get.back();
      Fluttertoast.showToast(msg: 'Product Added'.tr);
    } else {
      Fluttertoast.showToast(msg: AppConstants.failedMessage);
    }
    Loader.hide();
  }
}
