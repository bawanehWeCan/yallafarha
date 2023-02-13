import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:yallah_farha/model/home/slider_model.dart';
import 'package:yallah_farha/utils/api_url.dart';
import 'package:yallah_farha/utils/shared_prefrences.dart';

class SliderApi {
  static Future<SliderModel?> data() async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.slider}?page=1';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${MySharedPreferences.accessToken}',
      };
      log("Response:: SliderResponse\nUrl:: $url\nheaders:: $headers");
      http.Response response = await http.get(uri, headers: headers);
      log("SliderStatusCode:: ${response.statusCode}  SliderBody:: ${response.body}");
      SliderModel sliderModel = SliderModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return sliderModel;
      } else {
        throw "Slider Error";
      }
    } catch (e) {
      log("Slider Error $e");
      return null;
    }
  }
}
