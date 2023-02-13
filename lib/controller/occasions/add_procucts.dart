import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/binding/occassions/view_occasion.dart';
import 'package:yallah_farha/network/occasions/add_products.dart';
import 'package:yallah_farha/ui/screens/occasions/view_occasion.dart';
import 'package:yallah_farha/utils/app_constants.dart';

class AddProductsController {
  static Future<void> fetchAddProducts({
    required int id,
    required List<int> productsId,
    required BuildContext context,
  }) async {
    AppConstants.showLoading(context);
    await AddProductsApi.data(
      id: id,
      productsId: productsId,
    ).then((value) {
      if (value!.errNum == 200) {
        Get.off(
          () => const ViewOccasionScreen(backHome: true),
          binding: ViewOccasionBinding(id: id),
        );
      } else {
        Fluttertoast.showToast(msg: AppConstants.failedMessage);
      }
      Loader.hide();
    });
  }
}
