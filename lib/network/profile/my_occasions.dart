import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:yallah_farha/model/profile/my_occasion_model.dart';
import 'package:yallah_farha/utils/api_url.dart';
import 'package:yallah_farha/utils/shared_prefrences.dart';

class MyOccasionsApi {
  static Future<MyOccasionsModel?> data() async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.myOccasions}';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${MySharedPreferences.accessToken}',
      };
      log("Response:: MyOccasionsResponse\nUrl:: $url\nheaders:: $headers");
      http.Response response = await http.get(uri, headers: headers);
      log("MyOccasionsStatusCode:: ${response.statusCode}  MyOccasionsBody:: ${response.body}");
      MyOccasionsModel myOccasionsModel = MyOccasionsModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return myOccasionsModel;
      } else {
        throw "MyOccasions Error";
      }
    } catch (e) {
      log("MyOccasions Error $e");
      return null;
    }
  }
}
