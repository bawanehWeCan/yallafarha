import 'package:get/get.dart';
import 'package:yallah_farha/model/ecommerce/view_products.dart';
import 'package:yallah_farha/network/ecommerce/view_products.dart';

class ViewProductsController extends GetxController {
  static ViewProductsController get find => Get.find();

  ViewProductsModel? viewProductsModel;
  late Future<ViewProductsModel?> viewProductsData;

  final currentIndex = 0.obs;
  final quantity = 1.obs;
  final finalPrice = 0.0.obs;

  void toggleQuantity(String status) {
    var price = finalPrice.value / quantity.value;
    if (status == "add") {
      quantity.value += 1;
    } else {
      if (quantity.value == 1) return;
      quantity.value -= 1;
    }
    finalPrice.value = price * quantity.value;
    update();
  }

  void toggleIndex(int value) {
    currentIndex.value = value;
    update();
  }

  Future<ViewProductsModel?> fetchViewProductsData(int id) async {
    viewProductsModel = await ViewViewProductsApi.data(id);
    finalPrice.value = viewProductsModel!.product!.price!;
    return viewProductsModel;
  }

  Future init(int id) async {
    viewProductsData = fetchViewProductsData(id);
  }
}
