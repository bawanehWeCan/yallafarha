import 'dart:developer';

import 'package:get/get.dart';
import 'package:yallah_farha/model/items_model.dart';

class MyOrderCtrl extends GetxController {
  static MyOrderCtrl get find => Get.find();

  final orderList = <ItemsModel>[].obs;
  final totalPrice = 0.0.obs;
  final totalQuantity = 0.obs;

  void addItem(int id, double price, int quantity) {
    orderList.add(ItemsModel(
      id: id,
      quantity: quantity,
      price: price,
    ));
    update();
  }

  void removeItem(int index) {
    orderList.removeAt(index);
    update();
  }

  void calculateTotalPrice(double price, {required String status}) {
    if (status == 'add') {
      totalPrice.value = totalPrice.value + price;
    } else {
      totalPrice.value = totalPrice.value - price;
    }
    log("totalPrice:: ${totalPrice.value}");
    update();
  }

  void calculateTotalQuantity(int quantity, {required String status}) {
    if (status == 'add') {
      totalQuantity.value = totalQuantity.value + quantity;
    } else {
      totalQuantity.value = totalQuantity.value - quantity;
    }
    log("totalQuantity:: ${totalQuantity.value}");
    update();
  }
}
