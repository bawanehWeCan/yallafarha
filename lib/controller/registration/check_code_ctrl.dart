import 'package:flutter/cupertino.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/binding/registration/change_password.dart';
import 'package:yallah_farha/model/registration/forget_password_model.dart';
import 'package:yallah_farha/network/registration/check_code.dart';
import 'package:yallah_farha/ui/screens/registration/change_password.dart';
import 'package:yallah_farha/utils/app_constants.dart';

class CheckCodeCtrl extends GetxController {
  static CheckCodeCtrl get find => Get.find();

  ForgetPasswordModel? forgetPasswordModel;

  Future fetchCheckCodeData(
      BuildContext context, {
        required String otp,
        required String phone,
      }) async {
    AppConstants.showLoading(context);
    forgetPasswordModel = await CheckCodeApi.data(otp: otp, phone: phone);
    if(forgetPasswordModel==null){
      Fluttertoast.showToast(msg: AppConstants.failedMessage);
      Loader.hide();
      return;
    }
    if(forgetPasswordModel!.code == 200){
      Get.off(()=>const ChangePasswordScreen(route: 'checkCode'),binding: ChangePasswordBinding());
      Fluttertoast.showToast(msg: 'Success'.tr);
    } else if(forgetPasswordModel!.code==500){
      Fluttertoast.showToast(msg: forgetPasswordModel!.msg!);
    }
    else{
      Fluttertoast.showToast(msg: AppConstants.failedMessage);
    }
    Loader.hide();
  }
}
