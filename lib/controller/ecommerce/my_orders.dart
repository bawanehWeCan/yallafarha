import 'package:yallah_farha/model/ecommerce/my_orders.dart';
import 'package:yallah_farha/network/ecommerce/my_orders.dart';

class MyOrdersController {
  static MyOrdersModel? myOrdersModel;
  static late Future<MyOrdersModel?> myOrdersData;

  static Future<MyOrdersModel?> fetchSliderData() async {
    myOrdersModel = await MyOrdersApi.data();
    return myOrdersModel;
  }
}
