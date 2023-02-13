import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:yallah_farha/model/become_supplier/become_supplier_model.dart';
import 'package:yallah_farha/utils/api_url.dart';

class BecomeSupplierApi {
  static Future<BecomeSupplierModel?> data({
    required String email,
    required String phone,
    required String name,
    required String message,
  }) async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.becomeSupplier}';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
      };
      var body = jsonEncode({
        "email": email,
        "phone": phone,
        "name": name,
        "content": message,
      });
      log("Response:: BecomeSupplierResponse\nUrl:: $url\nheaders:: $headers\nbody:: $body");
      http.Response response = await http.post(uri, body: body, headers: headers);
      log("BecomeSupplierStatusCode:: ${response.statusCode}  BecomeSupplierBody:: ${response.body}");
      BecomeSupplierModel becomeSupplierModel = BecomeSupplierModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return becomeSupplierModel;
      } else {
        throw "BecomeSupplier Error";
      }
    } catch (e) {
      log("BecomeSupplier Error $e");
      return null;
    }
  }
}
