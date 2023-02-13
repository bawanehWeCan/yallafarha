import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/controller/make_order_ctrl.dart';
import 'package:yallah_farha/controller/my_order_ctrl.dart';
import 'package:yallah_farha/ui/screens/payments/chose_payment_screen.dart';
import 'package:yallah_farha/ui/screens/payments/payment.dart';
import 'package:yallah_farha/ui/screens/payments/payment_pages/zain_cash.dart';
import 'package:yallah_farha/ui/widgets/base_app_bar.dart';
import 'package:yallah_farha/ui/widgets/cart_bubble.dart';
import 'package:yallah_farha/ui/widgets/check_out_widget.dart';
import 'package:yallah_farha/ui/widgets/my_cart_text.dart';
import 'package:yallah_farha/utils/api_url.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MyCartText(),
          Expanded(
            child: GetX<MakeOrderCtrl>(
              builder: (controller) {
                return ListView.builder(
                  itemCount: controller.orderList.length,
                  itemBuilder: (context, index) {
                    final data = controller.orderList[index];
                    return CartBubble(
                      key: GlobalKey(),
                      imageUrl: '${ApiUrl.mainUrl}/storage/${data.image}',
                      itemName: data.name!,
                      initialPrice: data.price!,
                      description: data.description!,
                      initialQuantity: data.qty!,
                      index: index,
                    );
                  },
                );
              },
            ),
          ),
          GetBuilder<MyOrderCtrl>(
            builder: (controller) {
              return CheckOutWidget(
                totalPrice: '${controller.totalPrice.value}',
                onPressed: () {
                  // Get.to(
                  //   () => ZainCashPayment(id: 0, amount: controller.totalPrice.value.toString()),
                  // );
                  Get.to(
                    () => ChoosePaymentScreen(id: 0, amount: MyOrderCtrl.find.totalPrice.value.toString()),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
