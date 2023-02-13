import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/controller/registration/change_password_ctrl.dart';
import 'package:yallah_farha/ui/widgets/custom_icon_text_field.dart';

class ChangePasswordScreen extends StatefulWidget {
  final String route;
  const ChangePasswordScreen({Key? key,required this.route}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  late TextEditingController emailCtrl;
  late TextEditingController passCtrl;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailCtrl = TextEditingController();
    passCtrl = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailCtrl.dispose();
    passCtrl.dispose();
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
                    "Change password".tr,
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      "Enter your email and your new password.".tr,
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
                    controller: passCtrl,
                    label: "New Password".tr,
                    icon: FontAwesomeIcons.lock,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter your new password".tr;
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        FocusManager.instance.primaryFocus?.unfocus();
                        ChangePasswordCtrl.find.fetchChangePasswordData(
                          email: emailCtrl.text,
                          password: passCtrl.text,
                          context: context,
                        );
                      }
                    },
                    child: Text("Save".tr),
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
