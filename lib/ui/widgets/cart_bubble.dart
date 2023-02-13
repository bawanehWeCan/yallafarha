import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/controller/make_order_ctrl.dart';
import 'package:yallah_farha/controller/my_order_ctrl.dart';
import 'package:yallah_farha/ui/widgets/custom_network_image.dart';
import 'package:yallah_farha/ui/widgets/quantity_button.dart';
import 'package:yallah_farha/utils/base/colors.dart';

class CartBubble extends StatefulWidget {
  final String imageUrl, itemName, description;
  final double initialPrice;
  final int initialQuantity, index;

  const CartBubble({
    Key? key,
    required this.initialPrice,
    required this.itemName,
    required this.imageUrl,
    required this.description,
    required this.initialQuantity,
    required this.index,
  }) : super(key: key);

  @override
  State<CartBubble> createState() => _CartBubbleState();
}

class _CartBubbleState extends State<CartBubble> {
  late double originalPrice;
  late int quantity;
  late double newPrice;

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('Delete Item'.tr),
        content: Text('Are you sure you want to delete the item from the basket ?'.tr),
        actions: <Widget>[
          TextButton(
            onPressed: () => Get.back(),
            child: Text('Cancel'.tr),
          ),
          TextButton(
            onPressed: () {
              MakeOrderCtrl.find.orderList.removeAt(widget.index);
              MyOrderCtrl.find.orderList.removeAt(widget.index);
              MyOrderCtrl.find.calculateTotalPrice(originalPrice, status: 'remove');
              MyOrderCtrl.find.calculateTotalQuantity(1, status: 'remove');
              Get.back();
              if (MyOrderCtrl.find.orderList.isEmpty) {
                Get.back();
              }
            },
            child: Text('Confirm'.tr),
          ),
        ],
      ),
    );
  }

  void toggleProduct() {
    MyOrderCtrl.find.orderList[widget.index].price = newPrice;
    MyOrderCtrl.find.orderList[widget.index].quantity = quantity;
    log("userOrder:: ${MyOrderCtrl.find.orderList}");
  }

  void toggle(String status) {
    if (status == 'add') {
      setState(() {
        quantity++;
        newPrice = originalPrice * quantity;
      });
      MyOrderCtrl.find.calculateTotalPrice(originalPrice, status: 'add');
      MyOrderCtrl.find.calculateTotalQuantity(1, status: 'add');
      toggleProduct();
    } else {
      if (quantity == 1) {
        _showMyDialog();
      } else {
        setState(() {
          quantity--;
          newPrice = originalPrice * quantity;
        });
        MyOrderCtrl.find.calculateTotalPrice(originalPrice, status: 'remove');
        MyOrderCtrl.find.calculateTotalQuantity(1, status: 'remove');
        toggleProduct();
      }
    }
  }

  @override
  void initState() {
    originalPrice = widget.initialPrice / widget.initialQuantity;
    newPrice = widget.initialPrice;
    quantity = widget.initialQuantity;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomNetworkImage(
            url: widget.imageUrl,
            width: 150,
            height: 150,
            margin: const EdgeInsets.all(10.0),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20.0),
                Text(widget.itemName, style: const TextStyle(fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.only(top: 3.0, bottom: 10.0),
                  child: Text(widget.description),
                ),
                Text(
                  "${widget.initialPrice} ${"JD".tr}",
                  style: TextStyle(color: BaseColors.purple6C4),
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    const Spacer(),
                    QuantityButton(
                      icon: Icons.remove,
                      onPressed: () {
                        toggle('remove');
                      },
                      color: BaseColors.primary,
                    ),
                    Text(
                      quantity.toString(),
                      style: const TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    QuantityButton(
                      icon: Icons.add,
                      onPressed: () {
                        toggle('add');
                      },
                      color: BaseColors.primary,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
