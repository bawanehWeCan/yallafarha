import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:yallah_farha/binding/initial_binding.dart';
import 'package:yallah_farha/ui/base_nav_bar.dart';
import 'package:yallah_farha/utils/api_url.dart';
import 'package:yallah_farha/utils/app_constants.dart';
import 'package:yallah_farha/utils/shared_prefrences.dart';

class PayTabsCheckOutApi {
  Future<void> fetch(BuildContext context, double amount, int id) async {
    try {
      AppConstants.showLoading(context);
      String url = '${ApiUrl.mainUrl}${ApiUrl.deviceToken}${MySharedPreferences.userId}';
      Uri uri = Uri.parse(url);
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${MySharedPreferences.accessToken}',
      };
      var body = jsonEncode({
        'user_id': MySharedPreferences.userId,
        'name': '',
        'content': '',
        'amount': amount,
        'wishlist_id': id,
      });
      log("Response:: PayTabsCheckOutResponse\nUrl:: $url\nheaders:: $headers");
      http.Response response = await http.post(uri, body: body, headers: headers);
      log("PayTabsCheckOutStatusCode:: ${response.statusCode} PayTabsCheckOutBody:: ${response.body}");
      if (response.statusCode == 200) {
        Loader.hide();
        Get.offAll(() => const BaseNavBar(), binding: BaseNavBinding());
        Fluttertoast.showToast(msg: "You have paid successfully".tr);
      } else {
        throw "SignIn Error";
      }
    } catch (e) {
      Loader.hide();
      Fluttertoast.showToast(msg: AppConstants.failedMessage);
      log("PayTabsCheckOutError:: $e");
    }
  }
}
