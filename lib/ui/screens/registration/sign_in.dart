import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/binding/initial_binding.dart';
import 'package:yallah_farha/binding/registration/forget_password.dart';
import 'package:yallah_farha/controller/registration/sign_in.dart';
import 'package:yallah_farha/main.dart';
import 'package:yallah_farha/ui/base_nav_bar.dart';
import 'package:yallah_farha/ui/screens/registration/reset_password.dart';
import 'package:yallah_farha/ui/screens/registration/sign_up.dart';
import 'package:yallah_farha/ui/widgets/custom_divider.dart';
import 'package:yallah_farha/ui/widgets/custom_icon_text_field.dart';
import 'package:yallah_farha/ui/widgets/custom_rounded_button.dart';
import 'package:yallah_farha/ui/widgets/custom_social_button.dart';
import 'package:yallah_farha/utils/base/colors.dart';
import 'package:yallah_farha/utils/base/decoration.dart';
import 'package:yallah_farha/utils/base/images.dart';
import 'package:yallah_farha/utils/base/text_style.dart';

class SignInScreen extends StatefulWidget {
  final bool? initializeLink;
  final String route;

  const SignInScreen({
    Key? key,
    this.initializeLink = false,
    required this.route,
  }) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final List<Map<String, dynamic>> _info = [
    {
      "name": "Email",
      "icon": FontAwesomeIcons.solidEnvelope,
      "controller": TextEditingController(),
    },
    {
      "name": "Password",
      "icon": FontAwesomeIcons.lock,
      "controller": TextEditingController(),
    },
  ];

  Future initLinks() async {
    if (!uniLinksHelper.isInitialized) {
      print("isInitialized:: ${uniLinksHelper.isInitialized}");
      uniLinksHelper.handleBackgroundState(context);
      await uniLinksHelper.handleTerminatedState(context);
    }
  }

  @override
  void initState() {
    initLinks();
    super.initState();
  }

  @override
  void dispose() {
    if (!uniLinksHelper.isInitialized) {
      uniLinksHelper.sub!.cancel();
    }
    _info[0]["controller"].dispose();
    _info[1]["controller"].dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("isPaused:: ${uniLinksHelper.sub!.isPaused}");
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 30),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              padding: const EdgeInsets.symmetric(vertical: 30),
              decoration: BaseDecoration.registrationBackground,
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(BaseImages.logo),
                    Form(
                      key: _formKey,
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(20, 50, 20, 0),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        decoration: BaseDecoration.whiteBubble,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ..._info.map((element) {
                              final index = _info.indexOf(element);
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: CustomIconTextField(
                                  textDirection: TextDirection.ltr,
                                  keyboardType: index == 0 ? TextInputType.emailAddress : null,
                                  obscureText: index == 1 ? true : false,
                                  controller: _info[index]["controller"] as TextEditingController,
                                  label: _info[index]["name"].toString().tr,
                                  icon: _info[index]["icon"] as IconData,
                                  validator: (value) {
                                    switch (index) {
                                      case 0:
                                        {
                                          if (value!.isEmpty) {
                                            return "Enter your email".tr;
                                          }
                                        }
                                        break;
                                      case 1:
                                        {
                                          if (value!.isEmpty) {
                                            return "Enter your password".tr;
                                          }
                                        }
                                        break;
                                    }
                                    return null;
                                  },
                                ),
                              );
                            }).toList(),
                            Row(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Get.to(() => const ResetPasswordScreen(),binding: ForgetPasswordBinding());
                                  },
                                  child: Text("Forgot your password ?".tr),
                                ),
                                const Spacer(),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: CustomRoundedButton(
                                label: "Log in".tr,
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    FocusManager.instance.primaryFocus?.unfocus();
                                    SignInController.fetchSignInData(
                                      email: _info[0]['controller'].text.trim(),
                                      password: _info[1]['controller'].text.trim(),
                                      context: context,
                                      route: widget.route,
                                    );
                                  }
                                },
                                heroTag: "875684",
                              ),
                            ),
                            const CustomDivider(),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Text(
                                "Sign in with".tr,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomSocialButton(
                                  isGoogle: true,
                                  color: BaseColors.white,
                                  onTap: () {
                                    SignInController.signInWithGoogle(context, route: widget.route);
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: CustomSocialButton(
                                    icon: FontAwesomeIcons.facebookF,
                                    color: BaseColors.facebook,
                                    onTap: () {
                                      SignInController.signInWithFacebook(context, route: widget.route);
                                    },
                                  ),
                                ),
                                if (Platform.isIOS)
                                  CustomSocialButton(
                                    icon: FontAwesomeIcons.apple,
                                    color: Colors.black,
                                    onTap: () {},
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              "Don't have an account ?".tr,
              style: BaseTextStyle.pelorous14,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 30),
              child: CustomRoundedButton(
                onPressed: () {
                  Get.to(() => const SignUpScreen());
                },
                label: "Sign up now".tr,
                status: "full_width",
                heroTag: "63816",
              ),
            ),
            CustomRoundedButton(
              onPressed: () {
                Get.offAll(() => const BaseNavBar(), binding: BaseNavBinding());
              },
              label: "Skip".tr,
              status: "",
              heroTag: "as6d8a4sd6",
            ),
          ],
        ),
      ),
    );
  }
}
