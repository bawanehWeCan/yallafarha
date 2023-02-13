import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RefundPolicyScreen extends StatelessWidget {
  const RefundPolicyScreen({Key? key}) : super(key: key);

  static const double _space = 10;

  @override
  Widget build(BuildContext context) {
    final headline = Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.bold);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Refund policy".tr,
          style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Return Policy:", style: headline),
              Text("Refund", style: headline),
              const Text("After the event is cancelled and if you do not wish to purchase any other services, the amount received for the accounts from which the money was sent will be refunded, by opening a ticket at the Yalla Farha Help Center and after deducting the procedural fees."),
              const Text("The return process is subject to several conditions, including:"),
              const Text("• The balances are available for return within 90 days from the date of transfer up to a maximum if the transfer method provides an option for return."),
              const Text("• The refunds are returned through the Refund process for the payment method that has been used exclusively and cannot be returned to any account or other different card."),
              const Text("• Yalla  Farha shall not incur any commissions imposed as a result of the refund through the payment method used exclusively."),
              const Text("• The customer with the occasion shall be responsible for the payment of goods and transportation costs if the cancellation of the occasion results in the return of the goods to the stores from which the goods were purchased and the owner of the event shall be responsible for the payment of goods and transportation costs in case of return."),
              const SizedBox(height: 12),
              Text("canceling the occasion:", style: headline),
              const Text("• You must inform Yalla Farha Company when the event is cancelled by sending a message from your personal mail and calling Yalla Farha Company to stop the occasion directly and The company does not incur any amounts arising from the cancellation of the occasion."),
              const Text("If the event is cancelled by the owner of the event, the refund will be returned through the Refund process to the payment method that has been used exclusively. No other account or card can be returned. It also does not incur any amounts incurred as a result of the appropriate cancellation."),
              const Text("If the cancellation of the occasion is a result of circumstances beyond t he control of Yalla Farha and the owner of the occasion, Thus, the situation is restored to what it was without the company bearing any amounts, commissions or any legal consequences as a result of cancellation."),
              const Text("The return process is subject to several conditions, including:"),
              const Text("-The balances are available for return within 90 days from the date of transfer up to a maximum if the transfer method provides an option for return."),
              const Text("-The refunds are returned through the Refund process for the payment method that has been used exclusively and cannot be returned to any account or other different card."),
            ],
          ),
        ),
      ),
    );
  }
}
