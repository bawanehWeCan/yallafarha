import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:yallah_farha/model/payment/zain_cash/zain_cash_step1_model.dart';
import 'package:yallah_farha/utils/api_url.dart';
import 'package:yallah_farha/utils/shared_prefrences.dart';

class ZainCashStep1Api {
  static Future<ZainCashStep1Model?> data({
    required String name,
    required String phone,
    required String amount,
    required String id,
    required String content,
  }) async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.zainCashStep1}$id';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${MySharedPreferences.accessToken}',
      };
      var body = jsonEncode({
        "name": name,
        "content": content,
        "wishlist_id": id,
        "amount": amount,
        "phone": phone,
      });
      log("Response:: ZainCashStep1Response\nUrl:: $url\nheaders:: $headers\nbody:: $body");
      http.Response response = await http.post(uri, body: body, headers: headers);
      log("ZainCashStep1Code:: ${response.statusCode}  ZainCashStep1Body:: ${response.body}");
      ZainCashStep1Model zainCashStep1Model = ZainCashStep1Model.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return zainCashStep1Model;
      } else if (response.statusCode == 404) {
        return zainCashStep1Model;
      } else {
        throw "ZainCashStep1 Error";
      }
    } catch (e) {
      log("ZainCashStep1 Error $e");
      return null;
    }
  }
}
