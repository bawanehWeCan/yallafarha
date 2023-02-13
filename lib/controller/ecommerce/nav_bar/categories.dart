import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/controller/ecommerce/nav_bar/category.dart';
import 'package:yallah_farha/model/ecommerce/categories_model.dart';
import 'package:yallah_farha/network/ecommerce/categories.dart';

class CategoriesNavBarController extends GetxController {
  static CategoriesNavBarController get find => Get.find();
  final selection = [].obs;
  List<GlobalKey> itemKeys = [];

  CategoriesModel? categoriesModel;
  late Future<CategoriesModel?> categoriesData;

  //pagination
  final scrollCtrl = ScrollController();
  final categories = <Categories>[].obs;
  final loadMore = false.obs;
  final allLoaded = false.obs;
  final limit = 1.obs;
  //....

  void toggleLoadMore(bool status) {
    loadMore.value = status;
    update();
  }

  Future scrollToItem(index) async {
    await Scrollable.ensureVisible(
      itemKeys[index].currentContext!,
      alignment: 0.02,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void toggleSelection(int index, int id) {
    if (selection.contains(index)) {
      selection.remove(index);
      update();
    } else {
      selection.clear();
      selection.add(index);
      CategoryNavBarController.find.fetchCategoryData(id: id, loadingCase: "default", page: 1);
    }
    update();
  }

  Future<CategoriesModel?> fetchCategoriesData(int page, bool isPagination) async {
    if (isPagination) {
      toggleLoadMore(true);
    }
    categoriesModel = await CategoriesApi.data(page);
    if (categoriesModel!.categories!.isNotEmpty) {
      categories.addAll(categoriesModel!.categories!);
      for (int i = 0; i < categoriesModel!.categories!.length; i++) {
        itemKeys.add(GlobalKey());
      }
      limit.value++;
    } else {
      allLoaded.value = true;
    }
    if (isPagination) {
      toggleLoadMore(false);
    }
    return categoriesModel;
  }

  @override
  void onInit() {
    categoriesData = fetchCategoriesData(1, false);
    scrollCtrl.addListener(() {
      if (scrollCtrl.offset >= scrollCtrl.position.maxScrollExtent) {
        if (!allLoaded.value) {
          fetchCategoriesData(limit.value, true);
        }
      }
    });
    super.onInit();
  }
}
