import 'package:flutter/cupertino.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/model/profile/update_user_model.dart';
import 'package:yallah_farha/network/profile/update_user.dart';
import 'package:yallah_farha/utils/app_constants.dart';
import 'package:yallah_farha/utils/shared_prefrences.dart';

class UpdateUserCtrl extends GetxController {
  static UpdateUserCtrl get find => Get.find();

  UpdateUserModel? updateUserModel;

  Future fetchUpdateUserData(
    BuildContext context, {
    required String userName,
    required String fullName,
        required String email,
  }) async {
    AppConstants.showLoading(context);
    updateUserModel = await UpdateUserApi.data(
      userName: userName,
      fullName: fullName,
      email: email,
    );
    if (updateUserModel == null) {
      Fluttertoast.showToast(msg: AppConstants.failedMessage);
      Loader.hide();
      return;
    }
    if (updateUserModel!.code == 200) {
      MySharedPreferences.userName = updateUserModel!.user!.username!;
      MySharedPreferences.fullName = updateUserModel!.user!.firstName;
      Get.back();
      Fluttertoast.showToast(msg: 'Your profile was updated successfully'.tr);
    } else {
      Fluttertoast.showToast(msg: AppConstants.failedMessage);
    }
    Loader.hide();
  }
}
