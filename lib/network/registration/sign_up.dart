import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:yallah_farha/model/registration/sign_up_model.dart';
import 'package:yallah_farha/utils/api_url.dart';

class SignUpApi {
  static Future<SignUpModel?> data({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.signUp}';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
      };
      var body = jsonEncode({
        "email": email,
        "password": password,
        "name": name,
      });
      log("Response:: SignUpResponse\nUrl:: $url\nheaders:: $headers\nbody:: $body");
      http.Response response = await http.post(uri, body: body, headers: headers);
      log("SignUpStatusCode:: ${response.statusCode}  SignUpBody:: ${response.body}");
      var signUpModel = SignUpModel.fromJson(jsonDecode(response.body));
      print("alsfjiaslfj:: ${response.statusCode}");
      if (response.statusCode == 200) {
        return signUpModel;
      } else if (response.statusCode == 422) {
        return signUpModel;
      } else {
        throw "SignUp Error";
      }
    } catch (e) {
      log("SignUp Error $e");
      return null;
    }
  }
}
