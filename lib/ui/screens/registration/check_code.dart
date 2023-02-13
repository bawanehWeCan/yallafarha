import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/controller/registration/check_code_ctrl.dart';
import 'package:yallah_farha/ui/widgets/custom_icon_text_field.dart';
import 'package:yallah_farha/ui/widgets/verification_text_field.dart';
import 'package:yallah_farha/utils/base/colors.dart';

class CheckCodeScreen extends StatefulWidget {
  final String phone;
  const CheckCodeScreen({Key? key,required this.phone}) : super(key: key);

  @override
  State<CheckCodeScreen> createState() => _CheckCodeScreenState();
}

class _CheckCodeScreenState extends State<CheckCodeScreen> {

  List<CodeField> codeFields = [
    CodeField(focusNode: FocusNode(), controller: TextEditingController()),
    CodeField(focusNode: FocusNode(), controller: TextEditingController()),
    CodeField(focusNode: FocusNode(), controller: TextEditingController()),
    CodeField(focusNode: FocusNode(), controller: TextEditingController()),
  ];


  @override
  void dispose() {
    for (var element in codeFields) {
      element.controller.dispose();
      element.focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 30, top: 30),
                child: Icon(
                  FontAwesomeIcons.message,
                  size: 80,
                ),
              ),
              Text(
                "Check your SMS".tr,
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  "A verification code has been sent to your phone.".tr,
                ),
              ),
              Text(
                "Please enter the 4-digit code".tr,
              ),
              const SizedBox(height: 20,),
              Row(
                textDirection: TextDirection.ltr,
                children: codeFields.map((element) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: VerificationTextField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                          ],
                          style: const TextStyle(fontSize: 18),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          focusNode: element.focusNode,
                          controller: element.controller,
                          onChanged: (value) {
                            if (value.length == 1) {
                              element.focusNode.nextFocus();
                            }
                          },
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {
                  for (var element in codeFields) {
                    if (element.controller.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: BaseColors.red202,
                          content: Text(
                            "Please enter the 4-digit verification code".tr,
                          ),
                        ),
                      );
                      return;
                    }
                  }
                  FocusManager.instance.primaryFocus?.unfocus();
                  CheckCodeCtrl.find.fetchCheckCodeData(
                    context,
                    otp:
                        '${codeFields[0].controller.text}${codeFields[1].controller.text}${codeFields[2].controller.text}${codeFields[3].controller.text}'
                            .trim(),
                    phone: widget.phone,
                  );
                },
                child: Text("Send".tr),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CodeField {
  final TextEditingController controller;
  final FocusNode focusNode;

  CodeField({
    required this.focusNode,
    required this.controller,
  });
}
