import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:yallah_farha/model/story/stories_model.dart';
import 'package:yallah_farha/utils/api_url.dart';
import 'package:yallah_farha/utils/shared_prefrences.dart';

class StoriesApi {
  static Future<StoriesModel?> data() async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.stories}';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${MySharedPreferences.accessToken}',
      };
      log("Response:: StoriesResponse\nUrl:: $url\nheaders:: $headers");
      http.Response response = await http.get(uri, headers: headers);
      log("StoriesStatusCode:: ${response.statusCode}  StoriesBody:: ${response.body}");
      StoriesModel model = StoriesModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return model;
      } else {
        throw "Stories Error";
      }
    } catch (e) {
      log("Stories Error $e");
      return null;
    }
  }
}
