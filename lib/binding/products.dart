import 'package:get/get.dart';
import 'package:yallah_farha/controller/ecommerce/category.dart';
import 'package:yallah_farha/controller/ecommerce/products.dart';

class ProductsBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(CategoriesController());
    Get.lazyPut(() => CategoryController());
    Get.lazyPut(() => ProductsController());
  }
}
