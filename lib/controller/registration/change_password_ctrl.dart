import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/binding/initial_binding.dart';
import 'package:yallah_farha/model/registration/change_password_model.dart';
import 'package:yallah_farha/network/registration/change_password.dart';
import 'package:yallah_farha/ui/base_nav_bar.dart';
import 'package:yallah_farha/ui/screens/registration/sign_in.dart';
import 'package:yallah_farha/utils/app_constants.dart';

class ChangePasswordCtrl extends GetxController {
  static ChangePasswordCtrl get find => Get.find();

  ChangePasswordModel? changePasswordModel;
  Future fetchChangePasswordData({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    AppConstants.showLoading(context);
    changePasswordModel = await ChangePasswordApi.data(email: email, password: password);
    if (changePasswordModel == null) {
      Fluttertoast.showToast(msg: AppConstants.failedMessage);
      Loader.hide();
      return;
    }
    if (changePasswordModel!.code == 200) {
      Get.offAll(()=>const SignInScreen(route: 'home'));
      Fluttertoast.showToast(msg: 'Your password was changed successfully'.tr);
    } else {
      Fluttertoast.showToast(msg: AppConstants.failedMessage);
    }
    Loader.hide();
  }
}
