import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:yallah_farha/model/occasions/add_products.dart';
import 'package:yallah_farha/utils/api_url.dart';

class AddProductsApi {
  static Future<AddProductsModel?> data({
    required int id,
    required List<int> productsId,
  }) async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.addProducts}';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
      };
      var body = jsonEncode({
        "id": id,
        "product_id": productsId,
      });
      log("Response:: AddProductsResponse\nUrl:: $url\nheaders:: $headers\nbody:: $body");
      http.Response response = await http.post(uri, body: body, headers: headers);
      log("AddProductsStatusCode:: ${response.statusCode}  AddProductsBody:: ${response.body}");
      AddProductsModel addProductsModel = AddProductsModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return addProductsModel;
      } else {
        throw "AddProducts Error";
      }
    } catch (e) {
      log("AddProducts Error $e");
      return null;
    }
  }
}
