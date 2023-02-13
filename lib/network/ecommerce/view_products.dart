import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:yallah_farha/model/ecommerce/view_products.dart';
import 'package:yallah_farha/utils/api_url.dart';
import 'package:yallah_farha/utils/shared_prefrences.dart';

class ViewViewProductsApi {
  static Future<ViewProductsModel?> data(int id) async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.viewProducts}$id';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${MySharedPreferences.accessToken}',
      };
      log("Response:: ViewProductsResponse\nUrl:: $url\nheaders:: $headers");
      http.Response response = await http.get(uri, headers: headers);
      log("ViewProductsStatusCode:: ${response.statusCode}  ViewProductsBody:: ${response.body}");
      ViewProductsModel viewProductsModel = ViewProductsModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return viewProductsModel;
      } else {
        throw "ViewProducts Error";
      }
    } catch (e) {
      log("ViewProducts Error $e");
      return null;
    }
  }
}
