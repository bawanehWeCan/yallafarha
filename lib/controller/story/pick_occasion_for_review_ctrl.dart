import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/model/occasions/occasion_categories_model.dart';
import 'package:yallah_farha/network/occasions/occassion_categories.dart';

class PickOccasionForReviewController extends GetxController {
  static PickOccasionForReviewController get find => Get.find();

  final isGrid = true.obs;

  void toggleView() {
    isGrid.value = !isGrid.value;
    update();
  }

  OccasionCategoriesModel? occasionCategoriesModel;

  final scrollCtrl = ScrollController();
  final occasionCategories = <dynamic>[].obs;
  final loadMore = false.obs;
  final isLoading = false.obs;
  final allLoaded = false.obs;
  final limit = 1.obs;

  void toggleLoading(String loadingCase, bool status) {
    switch (loadingCase) {
      case "load_more":
        {
          loadMore.value = status;
          update();
        }
        break;
      default:
        {
          isLoading.value = status;
          update();
        }
        break;
    }
  }

  Future<OccasionCategoriesModel?> fetchCategoriesData(int page, String loadingCase) async {
    toggleLoading(loadingCase, true);
    occasionCategoriesModel = await OccasionCategoriesApi.data(page);
    if (occasionCategoriesModel!.categories!.isNotEmpty) {
      occasionCategories.addAll(occasionCategoriesModel!.categories!);
      limit.value++;
    } else {
      allLoaded.value = true;
    }
    toggleLoading(loadingCase, false);
    return occasionCategoriesModel;
  }
}
