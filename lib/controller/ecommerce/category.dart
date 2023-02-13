import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/model/ecommerce/category_model.dart';
import 'package:yallah_farha/network/ecommerce/category.dart';

class CategoryController extends GetxController {
  static CategoryController get find => Get.find();

  final scrollCtrl = ScrollController();
  final category = <dynamic>[].obs;
  final loadMore = false.obs;
  final allLoaded = false.obs;
  final limit = 1.obs;
  int? id;

  CategoryModel? categoryModel;
  final isLoading = false.obs;

  void toggleLoading(String loadingCase, bool status) {
    switch (loadingCase) {
      case "load_more":
        {
          loadMore.value = status;
        }
        break;
      default:
        {
          isLoading.value = status;
        }
        break;
    }
  }

  Future fetchCategoryData({required int id, required String loadingCase, required int page}) async {
    this.id = id;
    toggleLoading(loadingCase, true);
    categoryModel = await CategoryApi.data(id, page);
    if (categoryModel!.category.products.isNotEmpty) {
      category.addAll(categoryModel!.category.products);
      limit.value++;
    } else {
      allLoaded.value = true;
    }
    toggleLoading(loadingCase, false);
  }

  @override
  void onInit() {
    super.onInit();
    scrollCtrl.addListener(() {
      if (scrollCtrl.offset >= scrollCtrl.position.maxScrollExtent) {
        if (!allLoaded.value) {
          fetchCategoryData(id: id!, loadingCase: "load_more", page: limit.value);
        }
      }
    });
  }
}
