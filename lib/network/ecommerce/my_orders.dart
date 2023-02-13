import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:yallah_farha/model/ecommerce/my_orders.dart';
import 'package:yallah_farha/utils/api_url.dart';
import 'package:yallah_farha/utils/shared_prefrences.dart';

class MyOrdersApi {
  static Future<MyOrdersModel?> data() async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.myOrders}';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${MySharedPreferences.accessToken}',
      };
      log("Response:: MyOrdersResponse\nUrl:: $url\nheaders:: $headers");
      http.Response response = await http.get(uri, headers: headers);
      log("MyOrdersStatusCode:: ${response.statusCode}  MyOrdersBody:: ${response.body}");
      MyOrdersModel myOrdersModel = MyOrdersModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return myOrdersModel;
      } else {
        throw "MyOrders Error";
      }
    } catch (e) {
      log("MyOrders Error $e");
      return null;
    }
  }
}
