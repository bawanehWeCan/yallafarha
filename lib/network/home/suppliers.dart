import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:yallah_farha/model/home/suppliers_model.dart';
import 'package:yallah_farha/utils/api_url.dart';
import 'package:yallah_farha/utils/shared_prefrences.dart';

class SuppliersApi {
  static Future<SuppliersModel?> data(String page) async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.suppliers}?page=$page';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${MySharedPreferences.accessToken}',
      };
      log("Response:: SuppliersResponse\nUrl:: $url\nheaders:: $headers");
      http.Response response = await http.get(uri, headers: headers);
      log("SuppliersStatusCode:: ${response.statusCode}  SuppliersBody:: ${response.body}");
      SuppliersModel suppliersModel = SuppliersModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return suppliersModel;
      } else {
        throw "Suppliers Error";
      }
    } catch (e) {
      log("Suppliers Error $e");
      return null;
    }
  }
}
