import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/controller/registration/change_password_ctrl.dart';
import 'package:yallah_farha/controller/profile/update_password_ctrl.dart';
import 'package:yallah_farha/ui/widgets/custom_icon_text_field.dart';

class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({Key? key}) : super(key: key);

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  late TextEditingController oldPasswordCtrl;
  late TextEditingController newPasswordCtrl;
  late TextEditingController confirmPasswordCtrl;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    oldPasswordCtrl = TextEditingController();
    newPasswordCtrl = TextEditingController();
    confirmPasswordCtrl = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    oldPasswordCtrl.dispose();
    newPasswordCtrl.dispose();
    confirmPasswordCtrl.dispose();
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
                    "Update password".tr,
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      "Enter your old password and your new password.".tr,
                    ),
                  ),
                  CustomIconTextField(
                    controller: oldPasswordCtrl,
                    label: "Old password".tr,
                    icon: FontAwesomeIcons.lock,
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
                    controller: newPasswordCtrl,
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
                  CustomIconTextField(
                    controller: confirmPasswordCtrl,
                    label: "Confirm Password".tr,
                    icon: FontAwesomeIcons.lock,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Confirm your new password".tr;
                      }else if (value != newPasswordCtrl.text) {
                        return 'password does not match'.tr;
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
                        UpdatePasswordCtrl.find.fetchUpdatePasswordData(
                          oldPassword: oldPasswordCtrl.text,
                          newPassword: newPasswordCtrl.text,
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
