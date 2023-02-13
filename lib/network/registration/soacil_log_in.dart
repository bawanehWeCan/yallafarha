import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:yallah_farha/model/registration/social_log_in.dart';
import 'package:yallah_farha/utils/api_url.dart';

class SocialLogInApi {
  static Future<SocialLogInModel?> data({
    required String email,
    required String name,
  }) async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.socialLogIn}';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
      };
      var body = jsonEncode({
        "email": email,
        "name": name,
      });
      log("Response:: SocialLogInResponse\nUrl:: $url\nheaders:: $headers\nbody:: $body");
      http.Response response = await http.post(uri, body: body, headers: headers);
      log("SocialLogInStatusCode:: ${response.statusCode}  SocialLogInBody:: ${response.body}");
      SocialLogInModel model = SocialLogInModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return model;
      } else if (response.statusCode == 404) {
        return model;
      } else {
        throw "SocialLogIn Error";
      }
    } catch (e) {
      log("SocialLogIn Error $e");
      return null;
    }
  }
}
