import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:yallah_farha/model/profile/update_user_model.dart';
import 'package:yallah_farha/utils/api_url.dart';
import 'package:yallah_farha/utils/shared_prefrences.dart';

class UpdateUserApi {
  static Future<UpdateUserModel?> data({
    required String email,
    required String userName,
    required String fullName,
  }) async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.updateProfile}${MySharedPreferences.userId}';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
      };
      var body = jsonEncode({
        "email": email,
        "username": userName,
        "full_name":fullName,
      });
      log("Response:: UpdateUserResponse\nUrl:: $url\nheaders:: $headers\nbody:: $body");
      http.Response response = await http.post(uri, body: body, headers: headers);
      log("UpdateUserStatusCode:: ${response.statusCode}  UpdateUserBody:: ${response.body}");
      UpdateUserModel updateUserModel = UpdateUserModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return updateUserModel;
      } else if (response.statusCode == 404) {
        return updateUserModel;
      } else {
        throw "UpdateUser Error";
      }
    } catch (e) {
      log("UpdateUser Error $e");
      return null;
    }
  }
}
