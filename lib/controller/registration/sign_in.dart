import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yallah_farha/binding/initial_binding.dart';
import 'package:yallah_farha/model/registration/sign_in_model.dart';
import 'package:yallah_farha/model/registration/social_log_in.dart';
import 'package:yallah_farha/network/registration/sign_in.dart';
import 'package:yallah_farha/network/registration/soacil_log_in.dart';
import 'package:yallah_farha/ui/base_nav_bar.dart';
import 'package:yallah_farha/utils/app_constants.dart';
import 'package:yallah_farha/utils/shared_prefrences.dart';

class SignInController {
  // static SignInController get find => Get.find();

  static SignInModel? signInModel;
  static SocialLogInModel? socialLogInModel;

  static Future signInWithGoogle(BuildContext context, {required String route}) async {
    try {
      AppConstants.showLoading(context);
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      if (googleAuth?.accessToken == null) {
        Loader.hide();
        return;
      }

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential).then((value) {
        fetchSocialLogInData(email: value.user!.email!, name: value.user!.displayName!, context: context, route: route);
      }).catchError((onError) {
        if (onError.toString() == AppConstants.differentCredentialMessage) {
          log("FirebaseAuthException:: $onError");
          fetchSocialLogInData(email: onError.email!, name: onError.displayName!, context: context, route: route);
        } else {
          log("FirebaseAuthException:: $onError");
          Loader.hide();
          Fluttertoast.showToast(msg: "$onError");
        }
      });
    } catch (e) {
      log("FirebaseAuthException:: $e");
      Loader.hide();
      Fluttertoast.showToast(msg: "$e");
    }
  }

  static Future signInWithFacebook(BuildContext context, {required String route}) async {
    try {
      AppConstants.showLoading(context);
      final LoginResult loginResult = await FacebookAuth.instance.login();

      if (loginResult.accessToken?.token == null) {
        Loader.hide();
        return;
      }

      final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential).then((value) {
        fetchSocialLogInData(email: value.user!.email!, name: value.user!.displayName!, context: context, route: route);
      }).catchError((onError) {
        if (onError.toString() == AppConstants.differentCredentialMessage) {
          log("FirebaseAuthException:: $onError");
          fetchSocialLogInData(email: onError.email!, name: onError.displayName!, context: context, route: route);
        } else {
          log("FirebaseAuthException:: $onError");
          Loader.hide();
          Fluttertoast.showToast(msg: AppConstants.failedMessage);
        }
      });
    } catch (e) {
      log("FirebaseAuthException:: $e");
      Loader.hide();
      Fluttertoast.showToast(msg: AppConstants.failedMessage);
    }
  }

  static Future fetchSocialLogInData({
    required String email,
    required String name,
    required BuildContext context,
    required String route,
  }) async {
    AppConstants.showLoading(context);
    socialLogInModel = await SocialLogInApi.data(email: email, name: name);
    if (socialLogInModel == null) {
      Fluttertoast.showToast(msg: AppConstants.failedMessage);
      Loader.hide();
      return;
    }
    if (socialLogInModel!.code == 200) {
      MySharedPreferences.accessToken = socialLogInModel!.data!.token!;
      MySharedPreferences.email = socialLogInModel!.data!.user!.email!;
      MySharedPreferences.userName = socialLogInModel!.data!.user!.username!;
      MySharedPreferences.userId = socialLogInModel!.data!.user!.id!;
      //TODO: return full name from api
      MySharedPreferences.fullName = socialLogInModel!.data!.user!.firstName!;
      MySharedPreferences.isLogIn = true;
      if (route == 'home') {
        Get.offAll(() => const BaseNavBar(), binding: BaseNavBinding());
      } else if (route == 'back') {
        Get.back();
      }
    } else {
      Fluttertoast.showToast(msg: AppConstants.failedMessage);
    }
    Loader.hide();
  }

  static Future fetchSignInData({
    required String email,
    required String password,
    required BuildContext context,
    required String route,
  }) async {
    AppConstants.showLoading(context);
    signInModel = await SignInApi.data(email: email, password: password);
    if (signInModel == null) {
      Fluttertoast.showToast(msg: AppConstants.failedMessage);
      Loader.hide();
      return;
    }
    if (signInModel!.status == 200) {
      MySharedPreferences.accessToken = signInModel!.data!.token!;
      MySharedPreferences.email = signInModel!.data!.user!.email!;
      MySharedPreferences.userName = signInModel!.data!.user!.username!;
      MySharedPreferences.userId = signInModel!.data!.user!.id!;
      //TODO: return full name from api
      MySharedPreferences.fullName = signInModel!.data!.user!.firstName!;
      MySharedPreferences.isLogIn = true;
      if (route == 'home') {
        Get.offAll(() => const BaseNavBar(), binding: BaseNavBinding());
      } else if (route == 'back') {
        Get.back();
      }
    } else if (signInModel!.status == 404) {
      Fluttertoast.showToast(msg: 'Incorrect email or password'.tr);
    } else {
      Fluttertoast.showToast(msg: AppConstants.failedMessage);
    }
    Loader.hide();
  }
}
