import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:yallah_farha/model/occasions/occasion_categories_model.dart';
import 'package:yallah_farha/utils/api_url.dart';
import 'package:yallah_farha/utils/shared_prefrences.dart';

class OccasionCategoriesApi {
  static Future<OccasionCategoriesModel?> data(int page) async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.occasionCategories}?page=$page';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${MySharedPreferences.accessToken}',
      };
      log("Response:: OccasionCategoriesResponse\nUrl:: $url\nheaders:: $headers");
      http.Response response = await http.get(uri, headers: headers);
      log("OccasionCategoriesStatusCode:: ${response.statusCode}  OccasionCategoriesBody:: ${response.body}");
      OccasionCategoriesModel occasionCategoriesModel = OccasionCategoriesModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return occasionCategoriesModel;
      } else {
        throw "OccasionCategories Error";
      }
    } catch (e) {
      log("OccasionCategories Error $e");
      return null;
    }
  }
}
