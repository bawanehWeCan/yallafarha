import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yallah_farha/binding/products.dart';
import 'package:yallah_farha/controller/ecommerce/categories.dart';
import 'package:yallah_farha/network/occasions/create_occasion.dart';
import 'package:yallah_farha/ui/screens/ecommerce/products.dart';
import 'package:yallah_farha/utils/app_constants.dart';

class CreateOccasionController extends GetxController {
  static CreateOccasionController get find => Get.find();

  final image = Rxn<XFile>();

  Future<void> pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? file = await picker.pickImage(source: source);
    if (file == null) return;
    image.value = file;
    update();
  }

  Future<void> createOccasion({
    required File imageFile,
    required String name,
    required String occasionImage,
    required String description,
    required String start,
    required String end,
    required int categoryId,
    required BuildContext context,
  }) async {
    AppConstants.showLoading(context);
    await CreateOccasionApi.data(
      imageFile: imageFile,
      name: name,
      description: description,
      start: start,
      end: end,
      categoryId: categoryId,
    ).then((value) async {
      if (value!.statusCode == 200) {
        final respStr = await value.stream.bytesToString();
        final decodedMap = json.decode(respStr);
        final id = decodedMap['wishlist']['id'];
        print("myId:: $id");
        Get.delete<CategoriesController>();
        Get.to(
          () => ProductsScreen(occasionId: id, occasionImage: occasionImage),
          binding: ProductsBinding(),
        );
      } else {
        Fluttertoast.showToast(msg: AppConstants.failedMessage);
      }
      Loader.hide();
    });
  }
}
