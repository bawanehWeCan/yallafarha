import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:yallah_farha/model/profile/update_password_model.dart';
import 'package:yallah_farha/utils/api_url.dart';

class UpdatePasswordApi {
  Future<UpdatePasswordModel?> data({
    required int id,
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.updatePassword}$id';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
      };
      var body = jsonEncode({
        "old_password": oldPassword,
        "new_password": newPassword,
      });
      log("Response:: UpdatePasswordResponse\nUrl:: $url\nheaders:: $headers\nbody:: $body");
      http.Response response = await http.post(uri, body: body, headers: headers);
      log("UpdatePasswordStatusCode:: ${response.statusCode}  UpdatePasswordBody:: ${response.body}");
      UpdatePasswordModel updatePasswordModel = UpdatePasswordModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return updatePasswordModel;
      } else if (response.statusCode == 404) {
        return updatePasswordModel;
      } else {
        throw "UpdatePassword Error";
      }
    } catch (e) {
      log("UpdatePassword Error $e");
      return null;
    }
  }
}
