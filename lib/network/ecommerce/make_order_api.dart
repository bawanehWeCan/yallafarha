import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:yallah_farha/controller/my_order_ctrl.dart';
import 'package:yallah_farha/model/ecommerce/make_order_model.dart';
import 'package:yallah_farha/utils/api_url.dart';
import 'package:yallah_farha/utils/shared_prefrences.dart';

class MakeOrderApi {
  static Future<MakeOrderModel?> data() async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.makeOrder}';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${MySharedPreferences.accessToken}',
      };
      var body = jsonEncode({
        'total_price': MyOrderCtrl.find.totalPrice.value,
        'total_quantity': MyOrderCtrl.find.totalQuantity.value,
        'products': MyOrderCtrl.find.orderList.map((element) => element.toJson()).toList(),
      });
      log("Response:: CartResponse\nUrl:: $url\nheaders:: $headers");
      http.Response response = await http.post(uri, body: body, headers: headers);
      log("CartStatusCode:: ${response.statusCode}  CartBody:: ${response.body}");
      MakeOrderModel model = MakeOrderModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return model;
      } else {
        throw "Cart Error";
      }
    } catch (e) {
      log("Cart Error $e");
      return null;
    }
  }
}
