import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:yallah_farha/model/payment/zain_cash/zain_cash_step2_model.dart';
import 'package:yallah_farha/utils/api_url.dart';
import 'package:yallah_farha/utils/shared_prefrences.dart';

class ZainCashStep2Api {
  static Future<ZainCashStep2Model?> data({
    required String name,
    required String phone,
    required String amount,
    required String id,
    required String content,
    required int code,
  }) async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.zainCashStep2}';
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
        "code": '$code',
      });
      log("Response:: ZainCashStep2Response\nUrl:: $url\nheaders:: $headers\nbody:: $body");
      http.Response response = await http.post(uri, body: body, headers: headers);
      log("ZainCashStep2StatusCode:: ${response.statusCode}  ZainCashStep2Body:: ${response.body}");
      ZainCashStep2Model zainCashStep2Model = ZainCashStep2Model.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return zainCashStep2Model;
      } else if (response.statusCode == 404) {
        return zainCashStep2Model;
      } else {
        throw "ZainCashStep2 Error";
      }
    } catch (e) {
      log("ZainCashStep2 Error $e");
      return null;
    }
  }
}
