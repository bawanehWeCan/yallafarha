import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yallah_farha/model/profile/update_user_image_model.dart';
import 'package:yallah_farha/network/profile/update_image.dart';
import 'package:yallah_farha/utils/app_constants.dart';
import 'package:yallah_farha/utils/shared_prefrences.dart';

class UpdateImageCtrl extends GetxController {
  static UpdateImageCtrl get find => Get.find();

  UpdateUserImageModel? updateUserImageModel;
  Future fetchUpdateImageData({
    required int userId,
    required File? image,
    required BuildContext context,
  }) async {
    AppConstants.showLoading(context);
    updateUserImageModel = await UpdateImageApi.dataWithImage(
      id: userId,
      image: image,
    );
    if (updateUserImageModel == null) {
      Fluttertoast.showToast(msg: AppConstants.failedMessage);
      Loader.hide();
      return;
    }
    if (updateUserImageModel!.code == 200) {
      MySharedPreferences.userImage = updateUserImageModel!.user!.image!;
      Get.back();
      Fluttertoast.showToast(msg: 'Image Updated successfully');
    } else {
      Fluttertoast.showToast(msg: AppConstants.failedMessage);
    }
    Loader.hide();
  }
}
