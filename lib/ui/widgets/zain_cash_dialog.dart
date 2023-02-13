import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/controller/payment/zain_cash/step2.dart';
import 'package:yallah_farha/ui/widgets/custom_rounded_button.dart';
import 'package:yallah_farha/ui/widgets/custom_text_field.dart';

class ZainCashDialog extends StatefulWidget {
  final String name, phone, amount, id, content;

  const ZainCashDialog({
    Key? key,
    required this.name,
    required this.phone,
    required this.amount,
    required this.id,
    required this.content,
  }) : super(key: key);

  @override
  State<ZainCashDialog> createState() => _ZainCashDialogState();
}

class _ZainCashDialogState extends State<ZainCashDialog> {
  late TextEditingController otpCtrl;

  @override
  void initState() {
    otpCtrl = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    otpCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Enter the code that has been sent to your phone number.".tr),
        Padding(
          padding: const EdgeInsets.only(top: 12.0, bottom: 20),
          child: CustomTextField(
            controller: otpCtrl,
            keyboardType: TextInputType.phone,
            labelText: '',
          ),
        ),
        GetBuilder<ZainCashStep2Controller>(builder: (controller) {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          return CustomRoundedButton(
            onPressed: () {
              if (otpCtrl.text.isEmpty) {
                Fluttertoast.showToast(msg: "Enter the verification code".tr);
                return;
              }
              FocusManager.instance.primaryFocus?.unfocus();
              controller.fetchZainCashStep2Data(
                name: widget.name,
                phone: widget.phone,
                amount: widget.amount,
                id: widget.id,
                content: widget.content,
                context: context,
                code: int.parse(otpCtrl.text),
              );
            },
            label: "Confirm".tr,
            heroTag: "a5sdf41as6",
          );
        }),
      ],
    );
  }
}
