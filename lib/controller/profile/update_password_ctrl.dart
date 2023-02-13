import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/binding/initial_binding.dart';
import 'package:yallah_farha/model/registration/change_password_model.dart';
import 'package:yallah_farha/model/profile/update_password_model.dart';
import 'package:yallah_farha/network/profile/update_password.dart';
import 'package:yallah_farha/ui/base_nav_bar.dart';
import 'package:yallah_farha/utils/app_constants.dart';
import 'package:yallah_farha/utils/shared_prefrences.dart';

class UpdatePasswordCtrl extends GetxController {
  static UpdatePasswordCtrl get find => Get.find();

  UpdatePasswordModel? updatePasswordModel;
  Future fetchUpdatePasswordData({
    required String oldPassword,
    required String newPassword,
    required BuildContext context,
  }) async {
    AppConstants.showLoading(context);
    updatePasswordModel = await UpdatePasswordApi().data(
      id: MySharedPreferences.userId,
        oldPassword: oldPassword, newPassword: newPassword);
    if (updatePasswordModel == null) {
      Fluttertoast.showToast(msg: AppConstants.failedMessage);
      Loader.hide();
      return;
    }
    if (updatePasswordModel!.code == 200) {
      Get.back();
      Fluttertoast.showToast(msg: 'Your password was updated successfully'.tr);
    } else {
      Fluttertoast.showToast(msg: AppConstants.failedMessage);
    }
    Loader.hide();
  }
}
