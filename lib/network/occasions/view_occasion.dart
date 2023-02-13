import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:yallah_farha/model/occasions/view_occasion_model.dart';
import 'package:yallah_farha/utils/api_url.dart';
import 'package:yallah_farha/utils/shared_prefrences.dart';

class ViewOccasionApi {
  static Future<ViewOccasionModel?> data(int id) async {
    try {
      String url = '${ApiUrl.mainUrl}${ApiUrl.viewOccasion}$id';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${MySharedPreferences.accessToken}',
      };
      log("Response:: ViewOccasionResponse\nUrl:: $url\nheaders:: $headers");
      http.Response response = await http.get(uri, headers: headers);
      log("ViewOccasionStatusCode:: ${response.statusCode}  ViewOccasionBody:: ${response.body}");
      ViewOccasionModel viewOccasionModel = ViewOccasionModel.fromJson(json.decode(response.body));
      if (response.statusCode == 200) {
        return viewOccasionModel;
      } else {
        throw "ViewOccasion Error";
      }
    } catch (e) {
      log("ViewOccasion Error $e");
      return null;
    }
  }
}
