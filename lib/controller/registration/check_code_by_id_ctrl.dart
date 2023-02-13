import 'package:flutter/cupertino.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/binding/initial_binding.dart';
import 'package:yallah_farha/model/registration/forget_password_model.dart';
import 'package:yallah_farha/network/registration/check_code_by_id.dart';
import 'package:yallah_farha/ui/base_nav_bar.dart';
import 'package:yallah_farha/utils/app_constants.dart';
import 'package:yallah_farha/utils/shared_prefrences.dart';

class CheckCodeByIdCtrl extends GetxController {
  static CheckCodeByIdCtrl get find => Get.find();

  ForgetPasswordModel? forgetPasswordModel;

  Future fetchCheckCodeData(
    BuildContext context, {
    required String otp,
  }) async {
    AppConstants.showLoading(context);
    forgetPasswordModel = await CheckCodeByIdApi.data(
      otp: otp,
      id: MySharedPreferences.userId,
    );
    if (forgetPasswordModel == null) {
      Fluttertoast.showToast(msg: AppConstants.failedMessage);
      Loader.hide();
      return;
    }
    if (forgetPasswordModel!.code == 200) {
      Get.offAll(
        () => const BaseNavBar(),
        binding: BaseNavBinding(),
      );
      Fluttertoast.showToast(msg: 'Success'.tr);
    } else if (forgetPasswordModel!.code == 500) {
      Fluttertoast.showToast(msg: forgetPasswordModel!.msg!);
    } else {
      Fluttertoast.showToast(msg: AppConstants.failedMessage);
    }
    Loader.hide();
  }
}
