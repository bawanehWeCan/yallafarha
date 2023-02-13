import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:yallah_farha/model/ecommerce/add_to_card_model.dart';
import 'package:yallah_farha/utils/api_url.dart';
import 'package:yallah_farha/utils/shared_prefrences.dart';

class AddToCartApi {
  static Future<AddToCartModel?> data({
    required int id,
    required int quantity,
  }) async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.addToCart}';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${MySharedPreferences.accessToken}',
      };
      var body = jsonEncode({
        "id": id,
        "qty": quantity,
      });
      log("Response:: AddToCartResponse\nUrl:: $url\nheaders:: $headers\nbody:: $body");
      http.Response response = await http.post(uri, body: body, headers: headers);
      log("AddToCartStatusCode:: ${response.statusCode}  AddToCartBody:: ${response.body}");
      AddToCartModel model = AddToCartModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return model;
      } else {
        throw "AddToCart Error";
      }
    } catch (e) {
      log("AddToCart Error $e");
      return null;
    }
  }
}
