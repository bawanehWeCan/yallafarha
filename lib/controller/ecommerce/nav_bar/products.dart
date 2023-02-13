import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/model/ecommerce/products_model.dart';
import 'package:yallah_farha/network/ecommerce/products.dart';

class ProductsNavBarController extends GetxController {
  static ProductsNavBarController get find => Get.find();

  ProductsModel? productsModel;
  final addedProductIds = <int>[].obs;
  final isLoading = false.obs;

  final scrollCtrl = ScrollController();
  final products = <dynamic>[].obs;
  final loadMore = false.obs;
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

  Future fetchProductsData(int page, String loadingCase) async {
    toggleLoading(loadingCase, true);
    productsModel = await ProductsApi.data(page);
    if (productsModel!.products!.isNotEmpty) {
      products.addAll(productsModel!.products!);
      limit.value++;
    } else {
      allLoaded.value = true;
    }
    update();
    toggleLoading(loadingCase, false);
  }

  void toggleAddedItem(int id) {
    if (addedProductIds.contains(id)) {
      addedProductIds.remove(id);
    } else {
      addedProductIds.add(id);
    }
    update();
  }

  @override
  void onInit() {
    fetchProductsData(1, "default");
    super.onInit();
  }
}
