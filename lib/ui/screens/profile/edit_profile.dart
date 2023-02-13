import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/binding/update_password.dart';
import 'package:yallah_farha/controller/profile/update_user_ctrl.dart';
import 'package:yallah_farha/ui/screens/profile/update_password.dart';
import 'package:yallah_farha/ui/widgets/base_app_bar.dart';
import 'package:yallah_farha/ui/widgets/custom_icon_text_field.dart';
import 'package:yallah_farha/ui/widgets/custom_rounded_button.dart';
import 'package:yallah_farha/ui/widgets/profile_pic_widget.dart';
import 'package:yallah_farha/utils/base/strings.dart';
import 'package:yallah_farha/utils/base/text_style.dart';
import 'package:yallah_farha/utils/shared_prefrences.dart';


class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController fullNameCtrl, userNameCtrl, emailCtrl;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final profilePicWidgetStateKey = GlobalKey<ProfilePicWidgetState>();
  final emailRegExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final usernameRegExp = RegExp(r'^[a-zA-Z0-9_\-=@,\.;]+$');
  final passwordRegExp = RegExp(r'^[a-zA-Z0-9_\-=@,\.;]+$');

  @override
  void initState() {
    fullNameCtrl = TextEditingController(text: MySharedPreferences.fullName);
    userNameCtrl = TextEditingController(text: MySharedPreferences.userName);
    emailCtrl = TextEditingController(text: MySharedPreferences.email);

    super.initState();
  }

  @override
  void dispose() {
    fullNameCtrl.dispose();
    userNameCtrl.dispose();
    emailCtrl.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const SizedBox(height: 20),
          Center(child: ProfilePicWidget(key: profilePicWidgetStateKey)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: Text(
                MySharedPreferences.fullName,
                style: BaseTextStyle.black20SemiBold,
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomIconTextField(
                  controller: fullNameCtrl,
                  label: 'Full name'.tr,
                  icon: FontAwesomeIcons.solidUser,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return BaseStrings.requiredField;
                    } else if (value == MySharedPreferences.fullName) {
                      return null;
                    }
                    return null;
                  },
                ),
                MySharedPreferences.userName.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: CustomIconTextField(
                          controller: userNameCtrl,
                          label: 'Username'.tr,
                          icon: FontAwesomeIcons.solidUser,
                          readOnly: false,
                        ),
                      )
                    : const SizedBox(height: 10),
                CustomIconTextField(
                  controller: emailCtrl,
                  label: 'Email'.tr,
                  readOnly: true,
                  icon: FontAwesomeIcons.solidEnvelope,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 30.0),
            child: OutlinedButton(
              onPressed: () {
                Get.to(
                  () => const UpdatePasswordScreen(),
                  binding: UpdatePasswordBinding(),
                );
              },
              child: const Text("Change Password"),
            ),
          ),
          Center(
            child: CustomRoundedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  FocusManager.instance.primaryFocus?.unfocus();
                  if (fullNameCtrl.text != MySharedPreferences.fullName || userNameCtrl.text != MySharedPreferences.userName) {
                    UpdateUserCtrl.find.fetchUpdateUserData(
                      context,
                      userName: userNameCtrl.text,
                      fullName: fullNameCtrl.text,
                      email: emailCtrl.text,
                    );
                  }
                }
              },
              label: "Save".tr,
              heroTag: "asoduij8",
            ),
          ),
        ],
      ),
    );
  }
}
