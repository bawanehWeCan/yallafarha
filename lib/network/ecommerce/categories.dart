import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:yallah_farha/model/ecommerce/categories_model.dart';
import 'package:yallah_farha/utils/api_url.dart';
import 'package:yallah_farha/utils/shared_prefrences.dart';

class CategoriesApi {
  static Future<CategoriesModel?> data(int page) async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.categories}?page=$page';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${MySharedPreferences.accessToken}',
      };
      log("Response:: CategoriesResponse\nUrl:: $url\nheaders:: $headers");
      http.Response response = await http.get(uri, headers: headers);
      log("CategoriesStatusCode:: ${response.statusCode}  CategoriesBody:: ${response.body}");
      CategoriesModel categoriesModel = CategoriesModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return categoriesModel;
      } else {
        throw "Categories Error";
      }
    } catch (e) {
      log("Categories Error $e");
      return null;
    }
  }
}
