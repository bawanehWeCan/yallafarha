import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/controller/payment/zain_cash/step1.dart';
import 'package:yallah_farha/ui/surfaces/signin_dialog.dart';
import 'package:yallah_farha/ui/widgets/base_app_bar.dart';
import 'package:yallah_farha/ui/widgets/custom_rounded_button.dart';
import 'package:yallah_farha/ui/widgets/custom_text_field.dart';
import 'package:yallah_farha/utils/base/strings.dart';

class ZainCashPayment extends StatefulWidget {
  final int id;
  final String? amount;

  const ZainCashPayment({Key? key, required this.id, this.amount}) : super(key: key);

  @override
  State<ZainCashPayment> createState() => _ZainCashPaymentState();
}

class _ZainCashPaymentState extends State<ZainCashPayment> {
  late TextEditingController amountCtrl, phoneCtrl, nameCtrl, messageCtrl;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    nameCtrl = TextEditingController();
    messageCtrl = TextEditingController();
    amountCtrl = TextEditingController(text: widget.amount);
    phoneCtrl = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    messageCtrl.dispose();
    phoneCtrl.dispose();
    amountCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                autoValidateMode: AutovalidateMode.onUserInteraction,
                textDirection: ui.TextDirection.ltr,
                keyboardType: TextInputType.text,
                controller: nameCtrl,
                labelText: 'Name'.tr,
                validator: (value) {
                  if (value!.isEmpty) {
                    return BaseStrings.requiredField;
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CustomTextField(
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  textDirection: ui.TextDirection.ltr,
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  controller: phoneCtrl,
                  labelText: 'Phone number'.tr,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return BaseStrings.requiredField;
                    } else if (value.length < 10) {
                      return "Invalid phone number";
                    }
                    return null;
                  },
                ),
              ),
              CustomTextField(
                autoValidateMode: AutovalidateMode.onUserInteraction,
                textDirection: ui.TextDirection.ltr,
                keyboardType: TextInputType.number,
                controller: amountCtrl,
                labelText: 'Amount'.tr,
                readOnly: widget.amount != null ? true : false,
                validator: (value) {
                  if (value!.isEmpty) {
                    return BaseStrings.requiredField;
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 40),
                child: CustomTextField(
                  maxLines: 5,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  textDirection: ui.TextDirection.ltr,
                  keyboardType: TextInputType.multiline,
                  controller: messageCtrl,
                  labelText: 'Message'.tr,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return BaseStrings.requiredField;
                    }
                    return null;
                  },
                ),
              ),
              CustomRoundedButton(
                onPressed: () {
                  if (CheckUserSignIn.check(context)) {
                    if (_formKey.currentState!.validate()) {
                      FocusManager.instance.primaryFocus?.unfocus();
                      ZainCashStep1Controller.fetchZainCashStep1Data(
                        name: nameCtrl.text,
                        phone: phoneCtrl.text,
                        amount: amountCtrl.text,
                        id: widget.id.toString(),
                        content: messageCtrl.text,
                        context: context,
                      );
                    }
                  }
                },
                label: "Send".tr,
                heroTag: "893rj38r",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
