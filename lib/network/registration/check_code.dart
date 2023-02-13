import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:yallah_farha/model/registration/forget_password_model.dart';
import 'package:yallah_farha/utils/api_url.dart';

class CheckCodeApi {
  static Future<ForgetPasswordModel?> data({
    required String otp,
    required String phone,
  }) async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.checkCode}';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
      };
      var body = jsonEncode({
        "otp": otp,
        "phone": phone,
      });
      log("Response:: CheckCodeResponse\nUrl:: $url\nheaders:: $headers\nbody:: $body");
      http.Response response = await http.post(uri, body: body, headers: headers);
      log("CheckCodeStatusCode:: ${response.statusCode}  CheckCodeBody:: ${response.body}");
      ForgetPasswordModel forgetPasswordModel = ForgetPasswordModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return forgetPasswordModel;
      } else if (response.statusCode == 404) {
        return forgetPasswordModel;
      } else {
        throw "CheckCode Error";
      }
    } catch (e) {
      log("CheckCode Error $e");
      return null;
    }
  }
}
