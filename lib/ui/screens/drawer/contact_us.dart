import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/network/drawer/contact_us.dart';
import 'package:yallah_farha/ui/widgets/base_app_bar.dart';
import 'package:yallah_farha/ui/widgets/custom_rounded_button.dart';
import 'package:yallah_farha/ui/widgets/custom_text_field.dart';
import 'package:yallah_farha/utils/app_constants.dart';
import 'package:yallah_farha/utils/base/strings.dart';
import 'package:yallah_farha/utils/base/text_style.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  late TextEditingController fullNameCtrl, emailCtrl, phoneCtrl, messageCtrl;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _contactInfo = [
    {
      "title": "Amman, gardens",
      "icon": FontAwesomeIcons.locationPin,
    },
    {
      "title": "0781888411",
      "icon": FontAwesomeIcons.phone,
    },
  ];

  @override
  void initState() {
    super.initState();
    fullNameCtrl = TextEditingController();
    emailCtrl = TextEditingController();
    phoneCtrl = TextEditingController();
    messageCtrl = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    fullNameCtrl.dispose();
    emailCtrl.dispose();
    phoneCtrl.dispose();
    messageCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  'Contact us'.tr,
                  style: BaseTextStyle.black18Bold,
                ),
              ),
              CustomTextField(
                controller: emailCtrl,
                labelText: 'Full name'.tr,
                validator: (value) {
                  if (value!.isEmpty) {
                    return BaseStrings.requiredField;
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        textDirection: TextDirection.ltr,
                        controller: fullNameCtrl,
                        labelText: 'Email'.tr,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return BaseStrings.requiredField;
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CustomTextField(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10),
                        ],
                        controller: phoneCtrl,
                        labelText: 'Phone number'.tr,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return BaseStrings.requiredField;
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              CustomTextField(
                controller: messageCtrl,
                labelText: 'Message'.tr,
                maxLines: 5,
                validator: (value) {
                  if (value!.isEmpty) {
                    return BaseStrings.requiredField;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              CustomRoundedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    FocusManager.instance.primaryFocus?.unfocus();
                    log("values:: ${emailCtrl.text} -- ${fullNameCtrl.text}");
                    AppConstants.showLoading(context);
                    await SendEmailApi.sendEmailData(
                      email: emailCtrl.text,
                      name: fullNameCtrl.text,
                      subject: phoneCtrl.text,
                      message: messageCtrl.text,
                    );
                    emailCtrl.clear();
                    fullNameCtrl.clear();
                    phoneCtrl.clear();
                    messageCtrl.clear();
                    Loader.hide();
                    Fluttertoast.showToast(msg: "تم إرسال رسالتك بنجاح");
                  }
                },
                label: "Send".tr,
                heroTag: "asdiajsdfaioj",
                status: "full_width",
              ),
              // const SizedBox(height: 30),
              // ..._contactInfo.map((element) {
              //   return ListTile(
              //     leading: Icon(element["icon"] as IconData),
              //     title: Text(element["title"].toString()),
              //   );
              // }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
