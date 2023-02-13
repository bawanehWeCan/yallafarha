import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/controller/become_supplier/become_supplier_ctrl.dart';
import 'package:yallah_farha/ui/widgets/base_app_bar.dart';
import 'package:yallah_farha/ui/widgets/custom_rounded_button.dart';
import 'package:yallah_farha/ui/widgets/custom_text_field.dart';
import 'package:yallah_farha/utils/base/strings.dart';
import 'package:yallah_farha/utils/base/text_style.dart';

class BecomeASupplierScreen extends StatefulWidget {
  const BecomeASupplierScreen({Key? key}) : super(key: key);

  @override
  State<BecomeASupplierScreen> createState() => _BecomeASupplierScreenState();
}

class _BecomeASupplierScreenState extends State<BecomeASupplierScreen> {
  late TextEditingController nameCtrl, phoneCtrl, emailCtrl, messageCtrl;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameCtrl = TextEditingController();
    emailCtrl = TextEditingController();
    phoneCtrl = TextEditingController();
    messageCtrl = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nameCtrl.dispose();
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
              Text(
                'Become a supplier'.tr,
                style: BaseTextStyle.black18Bold,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: nameCtrl,
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
                        controller: emailCtrl,
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
                        keyboardType: TextInputType.phone,
                        controller: phoneCtrl,
                        labelText: 'Phone number'.tr,
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
              const SizedBox(height: 40),
              CustomRoundedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    FocusManager.instance.primaryFocus?.unfocus();
                    BecomeSupplierCtrl.fetchBecomeSupplierData(
                      email: emailCtrl.text,
                      phone: phoneCtrl.text,
                      name: nameCtrl.text,
                      message: messageCtrl.text,
                      context: context,
                    );
                  }
                },
                label: "Send".tr,
                heroTag: "asdiajsdfaioj",
                status: "full_width",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
