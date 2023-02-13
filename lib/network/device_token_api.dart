import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:yallah_farha/utils/api_url.dart';
import 'package:yallah_farha/utils/shared_prefrences.dart';

class DeviceTokenService {
  Future<void> updateDeviceToken(String token) async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.deviceToken}${MySharedPreferences.userId}';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
      };
      var body = jsonEncode({
        'email' : MySharedPreferences.email,
        'token': token,
      });
      log("Response:: updateDeviceTokenResponse\nUrl:: $url\nheaders:: $headers\nbody:: $body");
      http.Response response = await http.post(uri, body: body, headers: headers);
      log("updateDeviceTokenStatusCode:: ${response.statusCode} updateTokenBody:: ${response.body}");
    } catch (e) {
      log("deviceTokenError:: $e");
    }
  }
}
