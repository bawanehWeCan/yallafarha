import 'dart:developer';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/binding/initial_binding.dart';
import 'package:yallah_farha/controller/payment/zain_cash/step1.dart';
import 'package:yallah_farha/network/pay_tabs_api.dart';
import 'package:yallah_farha/ui/base_nav_bar.dart';
import 'package:yallah_farha/ui/surfaces/signin_dialog.dart';
import 'package:yallah_farha/ui/widgets/base_app_bar.dart';
import 'package:yallah_farha/ui/widgets/custom_rounded_button.dart';
import 'package:yallah_farha/ui/widgets/custom_text_field.dart';
import 'package:yallah_farha/utils/app_constants.dart';
import 'package:yallah_farha/utils/base/strings.dart';
import 'package:flutter_paytabs_bridge/BaseBillingShippingInfo.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkConfigurationDetails.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkLocale.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkTokenFormat.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkTokeniseType.dart';
import 'package:flutter_paytabs_bridge/flutter_paytabs_bridge.dart';
import 'package:flutter_paytabs_bridge/IOSThemeConfiguration.dart';
import 'package:flutter_paytabs_bridge/PaymentSDKSavedCardInfo.dart';
import 'package:flutter_paytabs_bridge/PaymentSdkTransactionClass.dart';
import 'package:flutter_paytabs_bridge/PaymentSDKQueryConfiguration.dart';

class PayTabsScreen extends StatefulWidget {
  final int id;
  final String? amount;

  const PayTabsScreen({Key? key, required this.id, this.amount}) : super(key: key);

  @override
  State<PayTabsScreen> createState() => _PayTabsScreenState();
}

class _PayTabsScreenState extends State<PayTabsScreen> {
  late TextEditingController amountCtrl;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late PaymentSdkConfigurationDetails configuration;

  void initPayTabs() {
    var billingDetails = BillingDetails(
      "billing name",
      "billing email",
      "billing phone",
      "address line",
      "country",
      "city",
      "state",
      "zip code",
    );

    var shippingDetails = ShippingDetails(
      "shipping name",
      "shipping email",
      "shipping phone",
      "address line",
      "country",
      "city",
      "state",
      "zip code",
    );
    configuration = PaymentSdkConfigurationDetails(
      profileId: "110552",
      serverKey: "SWJNHJNMJ9-JG9R669RTW-TNKZRLLBDN",
      clientKey: "CKKM99-2PKB6T-PRGGPR-RNGMNB",
      cartId: "289368377",
      cartDescription: "cart desc",
      merchantName: "yallafarha",
      screentTitle: "Pay with Card",
      billingDetails: billingDetails,
      shippingDetails: shippingDetails,
      locale: PaymentSdkLocale.EN, //PaymentSdkLocale.AR or PaymentSdkLocale.DEFAULT
      amount: double.parse(amountCtrl.text),
      currencyCode: "JOD",
      merchantCountryCode: "JO",
    );
    configuration.showBillingInfo = true;
    configuration.showShippingInfo = true;
    var theme = IOSThemeConfigurations();
    theme.logoImage = "assets/logo_y.png";
    configuration.iOSThemeConfigurations = theme;
  }

  @override
  void initState() {
    amountCtrl = TextEditingController(text: widget.amount);
    super.initState();
  }

  @override
  void dispose() {
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
              const SizedBox(height: 50.0),
              CustomRoundedButton(
                onPressed: () {
                  if (CheckUserSignIn.check(context)) {
                    if (_formKey.currentState!.validate()) {
                      FocusManager.instance.primaryFocus?.unfocus();
                      initPayTabs();
                      FlutterPaytabsBridge.startCardPayment(configuration, (event) {
                        setState(() {
                          if (event["status"] == "success") {
                            // Handle transaction details here.
                            var transactionDetails = event["data"];
                            log('TransactionDetails:: $transactionDetails');
                            if (transactionDetails["isSuccess"]) {
                              log("successful transaction");
                              PayTabsCheckOutApi().fetch(context, double.parse(amountCtrl.text), widget.id);
                            } else {
                              log("failed transaction");
                            }
                          } else if (event["status"] == "error") {
                            Fluttertoast.showToast(msg: AppConstants.failedMessage);
                            log("asklfjasklfj ${event["status"]}");
                            // Handle error here.
                          } else if (event["status"] == "event") {
                            log("asklfjasklf893ur893r");
                          }
                        });
                      });
                    }
                  }
                },
                label: "Pay".tr,
                heroTag: "893rj38r",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
