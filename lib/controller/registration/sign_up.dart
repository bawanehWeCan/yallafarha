import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/binding/registration/check_code_by_id.dart';
import 'package:yallah_farha/model/registration/sign_up_model.dart';
import 'package:yallah_farha/network/registration/sign_up.dart';
import 'package:yallah_farha/ui/screens/registration/check_code_by_id.dart';
import 'package:yallah_farha/utils/app_constants.dart';
import 'package:yallah_farha/utils/shared_prefrences.dart';

class SignUpController {
  static SignUpModel? signUpModel;

  static Future fetchSignInData({
    required String email,
    required String password,
    required String name,
    required BuildContext context,
  }) async {
    AppConstants.showLoading(context);
    signUpModel = await SignUpApi.data(
      email: email,
      password: password,
      name: name,
    );
    if (signUpModel == null) {
      Fluttertoast.showToast(msg: AppConstants.failedMessage);
      Loader.hide();
      return;
    }
    if (signUpModel!.errNum == 200) {
      MySharedPreferences.accessToken = signUpModel!.data!.token!;
      MySharedPreferences.email = signUpModel!.data!.user!.email!;
      //TODO: return full name from api
      MySharedPreferences.fullName = signUpModel!.data!.user!.firstName!;
      MySharedPreferences.userName = signUpModel!.data!.user!.username!;
      MySharedPreferences.userId = signUpModel!.data!.user!.id!;
      MySharedPreferences.isLogIn = true;
      Get.offAll(() => const CheckCodeByIdScreen(), binding: CheckCodeByIdBinding());
    } else if (signUpModel!.errNum == 422) {
      Fluttertoast.showToast(msg: 'Email or username is already registered'.tr);
    } else {
      Fluttertoast.showToast(msg: AppConstants.failedMessage);
    }
    Loader.hide();
  }
}
