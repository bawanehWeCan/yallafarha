import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yallah_farha/binding/initial_binding.dart';
import 'package:yallah_farha/model/story/share_review_model.dart';
import 'package:yallah_farha/network/story/share_review.dart';
import 'package:yallah_farha/ui/base_nav_bar.dart';
import 'package:yallah_farha/utils/app_constants.dart';

class ShareReviewController extends GetxController {
  static ShareReviewController get to => Get.find();

  final isChecked = false.obs;
  final images = Rxn<List<XFile>>();
  final video = Rxn<XFile>();
  final isCheckErrorShown = false.obs;
  final isReviewFieldErrorShown = false.obs;
  final reviewText = "".obs;
  double rate = 3.0;
  int? occasionId;
  final showSnackBar = false.obs;

  void toggleReviewFieldError() {
    if (reviewText.value.isEmpty) {
      isReviewFieldErrorShown.value = true;
    } else {
      isReviewFieldErrorShown.value = false;
    }
    update();
  }

  void toggleCheckBox() {
    isChecked.value = !isChecked.value;
    update();
  }

  void toggleCheckBoxError() {
    if (isChecked.value) {
      isCheckErrorShown.value = false;
    } else {
      isCheckErrorShown.value = true;
    }
    update();
  }

  Future<void> uploadImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final List<XFile>? file = await picker.pickMultiImage();
    if (file == null) return;
    images.value = file;
    video.value = null;
    update();
  }

  Future<void> uploadVideo(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? file = await picker.pickVideo(source: source);
    if (file == null) return;
    video.value = file;
    images.value!.clear();
    images.value = null;
    update();
  }

  ShareReviewModel? shareReviewModel;

  Future<void> fetchApiData({
    required double points,
    required String short,
    required String name,
    required String content,
    required String email,
    required int occasionId,
    required File imageFile,
    required File videoFile,
    required BuildContext context,
  }) async {
    AppConstants.showLoading(context);
    await ShareReviewApi.data(
      image: imageFile,
      points: points,
      short: short,
      name: name,
      content: content,
      email: email,
      occasionId: occasionId,
      video: videoFile,
    ).then((value) async {
      if (value!.statusCode == 200) {
        Get.offAll(
          () => const BaseNavBar(),
          binding: BaseNavBinding(),
        );
        Fluttertoast.showToast(msg: 'Your review has been sent successfully'.tr);
      } else {
        Fluttertoast.showToast(msg: AppConstants.failedMessage);
      }
      Loader.hide();
    });
  }
}
