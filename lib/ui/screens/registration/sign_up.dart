import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/controller/registration/sign_up.dart';
import 'package:yallah_farha/ui/screens/registration/sign_in.dart';
import 'package:yallah_farha/ui/widgets/custom_icon_text_field.dart';
import 'package:yallah_farha/ui/widgets/custom_rounded_button.dart';
import 'package:yallah_farha/utils/base/decoration.dart';
import 'package:yallah_farha/utils/base/images.dart';
import 'package:yallah_farha/utils/base/text_style.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailRegExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final usernameRegExp = RegExp(r'^[a-zA-Z0-9_\-=@,\.;]+$');
  final passwordRegExp = RegExp(r'^[a-zA-Z0-9_\-=@,\.;]+$');

  final List<Map<String, dynamic>> _info = [
    {
      "name": "Full name",
      "icon": FontAwesomeIcons.solidUser,
      "controller": TextEditingController(),
    },
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
    {
      "name": "Confirm password",
      "icon": FontAwesomeIcons.lock,
      "controller": TextEditingController(),
    },
  ];

  @override
  void dispose() {
    super.dispose();
    for (var element in _info) {
      element["controller"].dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                    Container(
                      margin: const EdgeInsets.fromLTRB(20, 50, 20, 0),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      decoration: BaseDecoration.whiteBubble,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            ..._info.map((element) {
                              final index = _info.indexOf(element);
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
                                child: CustomIconTextField(
                                  keyboardType: index == 1 ? TextInputType.emailAddress : null,
                                  textDirection: index > 0 ? TextDirection.ltr : null,
                                  obscureText: index == 3 || index == 4 ? true : false,
                                  controller: _info[index]["controller"],
                                  label: _info[index]["name"].toString().tr,
                                  icon: _info[index]["icon"],
                                  validator: (value) {
                                    switch (index) {
                                      case 0:
                                        {
                                          if (value!.isEmpty) {
                                            return "Enter your name".tr;
                                          }
                                        }
                                        break;
                                      case 1:
                                        {
                                          if (value!.isEmpty) {
                                            return "Enter your email".tr;
                                          } else if (!emailRegExp.hasMatch(value)) {
                                            return "invalid email".tr;
                                          }
                                        }
                                        break;
                                      case 2:
                                        {
                                          if (value!.isEmpty) {
                                            return "Enter your password".tr;
                                          } else if (value.length < 6) {
                                            return "password must be more than 5 characters".tr;
                                          } else if (!passwordRegExp.hasMatch(value)) {
                                            return "invalid password".tr;
                                          }
                                        }
                                        break;
                                      case 3:
                                        {
                                          if (value!.isEmpty) {
                                            return "Confirm your password".tr;
                                          } else if (value != _info[3]["controller"].text) {
                                            return "password does not match".tr;
                                          }
                                        }
                                        break;
                                    }
                                    return null;
                                  },
                                ),
                              );
                            }).toList(),
                            const SizedBox(height: 20),
                            CustomRoundedButton(
                              label: "Sign up".tr,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  SignUpController.fetchSignInData(
                                    email: _info[1]['controller'].text.trim(),
                                    password: _info[2]['controller'].text.trim(),
                                    name: _info[0]['controller'].text.trim(),
                                    context: context,
                                  );
                                }
                              },
                              heroTag: "879845",
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
              "Already have an account ?".tr,
              style: BaseTextStyle.pelorous14,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 15),
              child: CustomRoundedButton(
                onPressed: () {
                  Get.offAll(() => const SignInScreen(route: 'home'));
                },
                label: "Sign in".tr,
                status: "full_width",
                heroTag: "21321321",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
