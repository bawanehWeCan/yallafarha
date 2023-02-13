import 'package:flutter/cupertino.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/binding/registration/check_code.dart';
import 'package:yallah_farha/model/registration/forget_password_model.dart';
import 'package:yallah_farha/network/registration/forget_password.dart';
import 'package:yallah_farha/ui/screens/registration/check_code.dart';
import 'package:yallah_farha/utils/app_constants.dart';

class ForgetPasswordCtrl extends GetxController {
  static ForgetPasswordCtrl get find => Get.find();

  ForgetPasswordModel? forgetPasswordModel;

  Future fetchForgetPasswordData(
    BuildContext context, {
    required String email,
    required String phone,
  }) async {
    AppConstants.showLoading(context);
    forgetPasswordModel = await ForgetPasswordApi.data(email: email, phone: phone);
    if(forgetPasswordModel==null){
      Fluttertoast.showToast(msg: AppConstants.failedMessage);
      Loader.hide();
      return;
    }
    if(forgetPasswordModel!.code == 200){
      Get.off(()=>CheckCodeScreen(phone: phone,),binding: CheckCodeBinding());
      Fluttertoast.showToast(msg: 'Success'.tr);
    } else {
      Fluttertoast.showToast(msg: AppConstants.failedMessage);
    }
    Loader.hide();
  }
}
