import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/controller/my_order_ctrl.dart';
import 'package:yallah_farha/ui/screens/payments/payment_pages/pay_tabs_screen.dart';
import 'package:yallah_farha/ui/screens/payments/payment_pages/zain_cash.dart';
import 'package:yallah_farha/ui/widgets/base_app_bar.dart';
import 'package:yallah_farha/ui/widgets/custom_rounded_button.dart';

class ChoosePaymentScreen extends StatefulWidget {
  final int id;
  final String? amount;

  const ChoosePaymentScreen({Key? key, required this.id, this.amount}) : super(key: key);

  @override
  State<ChoosePaymentScreen> createState() => _ChoosePaymentScreenState();
}

class _ChoosePaymentScreenState extends State<ChoosePaymentScreen> {
  //
  // @override
  // void initState() {
  //   initPayTabs();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        children: [
          Center(
            child: Text(
              "Choose payment method".tr,
              style: const TextStyle(fontSize: 22),
            ),
          ),
          const SizedBox(height: 50.0),
          CustomRoundedButton(
            heroTag: '5544',
            label: 'Zain Cash',
            onPressed: () {
              Get.to(
                () => ZainCashPayment(id: widget.id, amount: widget.amount),
              );
            },
          ),
          const SizedBox(height: 20.0),
          CustomRoundedButton(
            heroTag: '55844444',
            label: 'PayTabs',
            onPressed: () {
              Get.to(
                () => PayTabsScreen(id: widget.id, amount: widget.amount),
              );
            },
          ),
        ],
      ),
    );
  }
}
