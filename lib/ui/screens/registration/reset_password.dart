import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/controller/registration/forget_password_ctrl.dart';
import 'package:yallah_farha/ui/widgets/custom_icon_text_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  late TextEditingController emailCtrl;
  late TextEditingController phoneCtrl;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailCtrl = TextEditingController();
    phoneCtrl = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailCtrl.dispose();
    phoneCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 30, top: 30),
                    child: Icon(
                      FontAwesomeIcons.lock,
                      size: 80,
                    ),
                  ),
                  Text(
                    "Forgot password".tr,
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      "Enter your email and we will send you a code to reset your password."
                          .tr,
                    ),
                  ),
                  CustomIconTextField(
                    controller: emailCtrl,
                    label: "Email".tr,
                    icon: FontAwesomeIcons.solidEnvelope,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter your email".tr;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomIconTextField(
                    controller: phoneCtrl,
                    label: "Phone".tr,
                    icon: FontAwesomeIcons.phone,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter your phone number".tr;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  OutlinedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        FocusManager.instance.primaryFocus?.unfocus();
                        ForgetPasswordCtrl.find.fetchForgetPasswordData(
                          context,
                          email: emailCtrl.text,
                          phone: phoneCtrl.text,
                        );
                      }
                    },
                    child: Text("Send".tr),
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text("Back".tr),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
