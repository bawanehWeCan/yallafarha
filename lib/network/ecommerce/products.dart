import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:yallah_farha/model/ecommerce/products_model.dart';
import 'package:yallah_farha/utils/api_url.dart';
import 'package:yallah_farha/utils/shared_prefrences.dart';

class ProductsApi {
  static Future<ProductsModel?> data(int page) async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.products}?page=$page';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${MySharedPreferences.accessToken}',
      };
      log("Response:: ProductsResponse\nUrl:: $url\nheaders:: $headers");
      http.Response response = await http.get(uri, headers: headers);
      log("ProductsStatusCode:: ${response.statusCode}  ProductsBody:: ${response.body}");
      ProductsModel productsModel = ProductsModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return productsModel;
      } else {
        throw "Products Error";
      }
    } catch (e) {
      log("Products Error $e");
      return null;
    }
  }
}
