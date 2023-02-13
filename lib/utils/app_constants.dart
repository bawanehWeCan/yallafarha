import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/utils/base/colors.dart';

const String kAdd = 'ADD';
const String kRemove = 'REMOVE';
final String kCurrency = 'Jo'.tr;

class AppConstants {
  static const differentCredentialMessage =
      "[firebase_auth/account-exists-with-different-credential] An account already exists with the same email address but different sign-in credentials. Sign in using a provider associated with this email address.";
  static const failedMessage = 'Something went wrong, please try again later';

  static const RoundedRectangleBorder bottomSheetShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
  );

  static showLoading(BuildContext context) {
    Loader.show(
      context,
      overlayColor: Colors.black26,
      progressIndicator: CircularProgressIndicator(
        color: BaseColors.primary,
      ),
    );
  }
}
