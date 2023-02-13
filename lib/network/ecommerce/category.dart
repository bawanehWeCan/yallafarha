import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:yallah_farha/model/ecommerce/category_model.dart';
import 'package:yallah_farha/utils/api_url.dart';
import 'package:yallah_farha/utils/shared_prefrences.dart';

class CategoryApi {
  static Future<CategoryModel?> data(int id, int page) async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.category}$id?page=$page';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${MySharedPreferences.accessToken}',
      };
      log("Response:: CategoryResponse\nUrl:: $url\nheaders:: $headers");
      http.Response response = await http.get(uri, headers: headers);
      log("CategoryStatusCode:: ${response.statusCode}  CategoryBody:: ${response.body}");
      CategoryModel categoryModel = CategoryModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return categoryModel;
      } else {
        throw "Category Error";
      }
    } catch (e) {
      log("Category Error $e");
      return null;
    }
  }
}
