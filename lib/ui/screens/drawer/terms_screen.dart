import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({Key? key}) : super(key: key);

  static const double _space = 10;

  @override
  Widget build(BuildContext context) {
    final headline = Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.bold);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Terms and conditions".tr,
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
              Text("Sender:", style: headline),
              const Text("We are committed to protect your rights and ensure that you receive the service that was sent as long as the transaction took place within the site and did not violate any of the terms of use."),
              const SizedBox(height: 12),
              Text("Request for personal documents:", style: headline),
              const Text("To prove the identity, we sometimes ask the user to authenticate his account with the personal identity, including his registered personal phone number. This procedure is routine and we may ask all users on site to achieve a safe working environment.If the event is cancelled by the occasion holder, the refund will be returned through the Refund process to the payment method used exclusively and no other account or card can be returned."),
              const Text("The return process is subject to several conditions, including:"),
              const Text("• The balances are available for return within 90 days from the date of transfer up to a maximum if the transfer method provides an option for return."),
              const Text("The refunds are returned through the Refund process for the payment method that has been used exclusively and cannot be returned to any account or other different card"),
              const SizedBox(height: 12),
              Text("Recipient:", style: headline),
              const Text("Service Receipt Guarantee:"),
              const Text("At Yalla Farha, we are committed to protect your rights and ensure that you receive the service you have requested as long as the agreement with the seller occurred on the site and did not violate any of the terms of use."),
              const Text("Request for personal documents:"),
              const Text("For proof of identity, we sometimes ask the user to authenticate his account with personal identity. This procedure is routine and we may ask all users on site to achieve a safe working environment."),
              const Text("Procedural fees:"),
              const Text("A minimum of 5% procedural fee is deducted on each order, to cover the cost of the electronic payment gateways used by the buyer when making payments.At Yalla Farha we commit to the advertised price unless any change is made from the seller on the price, if the purchase is made at the advertised price there will be no redemption on the price."),
              const Text("Reasons to discontinue account:"),
              const Text("Yalla Farha retains the right to permanently freeze or suspend the buyer’s account if it is used illegally. Examples of these uses include:Use of a stolen or non-user-owned payment method• Offer to pay for service to seller off Yalla Farha"),
              const Text("• Request for implementation of services contrary to the Terms of Use.The owner of the event is committed to buying at least 80% of the products on his list from Yalla Farha merchants. If the list contains only 3 products, the owner of the event is obliged to purchase all products.If the total amount is higher than the value of the purchases, the remaining amount will be sent to the owner’s wallet no later than 14 working days after the end of the event."),
              const SizedBox(height: 12),
              Text("Seller:", style: headline),
              const Text(
                  "Guaranteeing Rights Adherence to the terms of use of the website and the terms of the warranty page, it helps us to ensure your right to receive profits from the services you have performed. In the event of a dispute between you and the buyer, you can contact the support team to provide assistance, bearing in mind that the decision made will be binding on both parties. Account Identity Verification To ensure a reliable working environment for all users and prevent fraud we may ask the seller to verify their account by uploading the company logo on the Yalla Farha website. This procedure is compulsory in the event of an alert requesting it. Prohibited Services All services in Yalla Farha are permitted, except services that contain a form of fraud and misinformation and do not provide a real benefit to the buyer, or cause harm to the site and users. Attempting to provide services contrary to the terms of use may offer the seller’s account and the owner suitable for freezing or suspension in full. These services include but are not limited to: Political, sectarian, services contrary to public laws and State regulations, the conditions of other sites relating to them, or the teachings of Islam •\nSpam, meaningless services and mysterious and misleading services for buyers\n• Low Quality Services\n• Services that infringe intellectual property rights\n• Services that directly or indirectly harm Yalla Farha or its users\n• Services that lead to dealing and paying off the Yalla Farha site\n• Fully copied services from other vendors, due to a violation of rights and a violation of the terms of use of the site. Service Violation At Yalla Farha we try to accept all clear and unambiguous services/products to prevent any misunderstandings or problems that may occur between the parties. So the service may be temporarily denied and then send a message to the seller identifying the shortcomings in its service to be able to modify it. Examples of such irregularities include: Services that contain sentences for exaggeration or temporary or unclear offers in the address such as: best service, exclusive offer, limited time, gift.\n• Services in which the description has been repeated several times to fill the vacuum Use special characters, symbols and embellishments, distances in service address, or over character.\n• Services that do not contain a business model with a necessity, such as design services, so that the buyer can view examples of the quality of the work and the seller’s experience before purchasing Add a low quality photo or video, write the product title in the image, use the background color of the image in the same color as the site background, frame setting, signals, stars or any effects on the service image gives the impression that it is issued from the site as an attempt to distinguish it from others If the image of the service or its business forms contains the logo of companies or any entities such as government institutions, or the logo of Yalla Farha.\n• The service shall contain means of communication or request for it even if it is in the field of instructions. Reasons to discontinue account: The account shall be permanently frozen or suspended in the event of any such use: Send a request to receive the service or persuade the buyer to accept the receipt to obtain the amount of the service before it is fully executed.\n• Vendor offer unskilled services, or low service execution. Like selling a copied product.\n• Request to communicate or pay for services outside Yalla Farha Acting as an intermediary in Yalla Farha, so that the seller receives and executes requests from the buyer with another seller\n• Cancellation of orders for no apparent reason, if the seller does not wish to receive purchase orders for a specified period, it can temporarily discontinue the service after notifying Yalla Farha through email.\n• Accepting the implementation of services that violates the terms of use. After-sales Services\n•In case of delivery by the seller, the customer will coordinate and determine the delivery date.\n•The seller is obliged to deliver the product in good condition and confirm it with the customer and otherwise the owner bears the responsibility of the sale. Discontinued Account Profits Sellers can withdraw their profits from their suspended accounts after 30 days starting from the day of the last payment received by the seller in his account, The duration is assessed at Yalla Farha during which the support team scrutinizes the source of the profits and the methods for obtaining them and the services delivered, provided that the seller documents the identity of his account if not previously documented"),
              const SizedBox(height: 12),
              Text("Shipping and Delivery:", style: headline),
              const Text("Delivery is carried out by the distributor or by a delivery company."),
              const Text("Delivery is subject to the following conditions:"),
              const Text("- If delivery is made directly from the distributor, the buyer must check the condition of the product upon delivery and before signing the delivery paper."),
              const Text("- In the event that the product has been delivered and the product is in good condition, the distributor or Yalla Farha shall not bear any responsibility in this regard."),
              const Text("- The customer can refuse delivery if the product does not conform to the agreed specifications or if there is a defect, break or damage to the product."),
              const Text("- The buyer has the right to submit a request that there is a problem with the product, within a period not exceeding 3 days from delivery, by communicating with Yalla Farha or with the distributor directly, the product is verified and the necessary action is taken."),
              const Text("- In the event that it is proven that there was misuse that occurred after delivery, the buyer is not entitled to return the product."),
              const Text("- The buyer bears the delivery costs, unless the delivery is free."),
            ],
          ),
        ),
      ),
    );
  }
}
