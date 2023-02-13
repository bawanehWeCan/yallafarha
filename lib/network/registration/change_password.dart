import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:yallah_farha/model/registration/change_password_model.dart';
import 'package:yallah_farha/utils/api_url.dart';

class ChangePasswordApi {
  static Future<ChangePasswordModel?> data({
    required String email,
    required String password,
  }) async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.changePassword}';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
      };
      var body = jsonEncode({
        "email": email,
        "password": password,
      });
      log("Response:: ChangePasswordResponse\nUrl:: $url\nheaders:: $headers\nbody:: $body");
      http.Response response = await http.post(uri, body: body, headers: headers);
      log("ChangePasswordStatusCode:: ${response.statusCode}  ChangePasswordBody:: ${response.body}");
      ChangePasswordModel changePasswordModel = ChangePasswordModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return changePasswordModel;
      } else if (response.statusCode == 404) {
        return changePasswordModel;
      } else {
        throw "ChangePassword Error";
      }
    } catch (e) {
      log("ChangePassword Error $e");
      return null;
    }
  }
}
