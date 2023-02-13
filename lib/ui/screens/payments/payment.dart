import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:yallah_farha/controller/payments/payment.dart';
import 'package:yallah_farha/ui/widgets/base_app_bar.dart';
import 'package:yallah_farha/ui/widgets/custom_rounded_button.dart';
import 'package:yallah_farha/ui/widgets/custom_text_field.dart';
import 'package:yallah_farha/utils/base/colors.dart';
import 'package:yallah_farha/utils/base/strings.dart';
import 'package:yallah_farha/utils/base/text_style.dart';
import 'package:yallah_farha/utils/shared_prefrences.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late TextEditingController amountCtrl, cardNumberCtrl, ccvCtrl, endDateCtrl, messageCtrl;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _paymentMethods = [
    "PayTabs".tr,
    "Zain cash".tr,
  ];

  Future<void> _showEndDatePicker(BuildContext context) async {
    DateTime? endDate = await showDatePicker(
      context: context,
      locale: Locale(MySharedPreferences.language),
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
    );

    if (endDate == null) return;

    String formattedDate = DateFormat('dd-MM-yyyy').format(endDate);

    endDateCtrl.text = formattedDate;
  }

  @override
  void initState() {
    super.initState();
    amountCtrl = TextEditingController();
    cardNumberCtrl = TextEditingController();
    ccvCtrl = TextEditingController();
    endDateCtrl = TextEditingController();
    messageCtrl = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    amountCtrl.dispose();
    cardNumberCtrl.dispose();
    ccvCtrl.dispose();
    endDateCtrl.dispose();
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
              GetX<PaymentController>(
                init: PaymentController(),
                builder: (paymentCtrl) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          paymentCtrl.isOpen.value = !paymentCtrl.isOpen.value;
                        },
                        child: Container(
                          width: Get.width / 1.5,
                          height: 40,
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            border: Border.all(color: BaseColors.greyDDD),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(width: 10),
                              Text(
                                'Payment method'.tr,
                                style: BaseTextStyle.black18Bold,
                              ),
                              const Spacer(),
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: BaseColors.greyDF2,
                                  border: MySharedPreferences.language == "en"
                                      ? Border(
                                          left: BorderSide(color: BaseColors.greyDDD),
                                        )
                                      : Border(
                                          right: BorderSide(color: BaseColors.greyDDD),
                                        ),
                                ),
                                child: Icon(
                                  paymentCtrl.isOpen.value ? Icons.expand_more : Icons.expand_less,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        height: paymentCtrl.isOpen.value ? 230 : 0,
                        width: Get.width / 1.5,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide.none,
                            bottom: BorderSide(color: BaseColors.greyDDD),
                            left: BorderSide(color: BaseColors.greyDDD),
                            right: BorderSide(color: BaseColors.greyDDD),
                          ),
                        ),
                        child: ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          children: _paymentMethods.map((element) {
                            final index = _paymentMethods.indexOf(element);
                            return ListTile(
                              iconColor: paymentCtrl.selectedTileIndex.value == index ? BaseColors.purple09E : Colors.black,
                              textColor: paymentCtrl.selectedTileIndex.value == index ? BaseColors.purple09E : Colors.black,
                              onTap: () {
                                paymentCtrl.selectedTileIndex.value = index;
                                paymentCtrl.isOpen.value = false;
                              },
                              leading: const Icon(
                                FontAwesomeIcons.circleDot,
                              ),
                              title: Text(element),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: CustomTextField(
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  textDirection: ui.TextDirection.ltr,
                  keyboardType: TextInputType.number,
                  controller: amountCtrl,
                  labelText: 'Amount'.tr,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return BaseStrings.requiredField;
                    }
                    return null;
                  },
                ),
              ),
              CustomTextField(
                autoValidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.number,
                textDirection: ui.TextDirection.ltr,
                controller: cardNumberCtrl,
                labelText: 'Card number'.tr,
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
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        keyboardType: TextInputType.number,
                        textDirection: ui.TextDirection.ltr,
                        controller: ccvCtrl,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(3),
                        ],
                        labelText: 'ccv'.tr,
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
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        textDirection: ui.TextDirection.ltr,
                        controller: endDateCtrl,
                        labelText: 'End date'.tr,
                        readOnly: true,
                        onTap: () {
                          _showEndDatePicker(context);
                        },
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
                autoValidateMode: AutovalidateMode.onUserInteraction,
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
              const SizedBox(height: 20),
              CustomRoundedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    FocusManager.instance.primaryFocus?.unfocus();
                    // PayController.fetchPaymentData(
                    //   name: 'name',
                    //   phone: 'phone',
                    //   amount: 'amount',
                    //   id: 'id',
                    //   content: 'password',
                    //   context: context,
                    // );
                  }
                },
                label: "Send now".tr,
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
