import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/controller/notification_badge_ctrl.dart';
import 'package:yallah_farha/ui/screens/registration/sign_in.dart';
import 'package:yallah_farha/utils/shared_prefrences.dart';

class CheckUserSignIn {
  static bool check(BuildContext context) {
    if (MySharedPreferences.isLogIn) {
      return true;
    } else {
      show(context);
      return false;
    }
  }

  static Future<void> show(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            'Sign in to continue'.tr,
            style: const TextStyle(fontSize: 20),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'.tr),
              onPressed: () {
                Get.back();
              },
            ),
            TextButton(
              child: Text('Sign in'.tr),
              onPressed: () {
                Get.back();
                Get.to(() => const SignInScreen(route: 'back'))!.then((value) {
                  NotificationBadgeCtrl.find.toggle();
                });
              },
            ),
          ],
        );
      },
    );
  }
}
