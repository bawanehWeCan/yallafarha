import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/controller/ecommerce/view_products.dart';
import 'package:yallah_farha/controller/my_order_ctrl.dart';
import 'package:yallah_farha/model/ecommerce/view_products.dart';
import 'package:yallah_farha/ui/surfaces/signin_dialog.dart';
import 'package:yallah_farha/ui/widgets/base_app_bar.dart';
import 'package:yallah_farha/ui/widgets/custom_cart_button.dart';
import 'package:yallah_farha/ui/widgets/custom_network_image.dart';
import 'package:yallah_farha/ui/widgets/item_slider_indicator.dart';
import 'package:yallah_farha/utils/api_url.dart';
import 'package:yallah_farha/utils/app_constants.dart';
import 'package:yallah_farha/utils/base/colors.dart';
import 'package:yallah_farha/utils/base/text_style.dart';

class ViewProductScreen extends StatefulWidget {
  final String image;
  final String price;
  final String title;
  final int itemCount;
  final int id;
  final bool isShown;

  const ViewProductScreen({
    Key? key,
    required this.image,
    required this.price,
    required this.title,
    required this.itemCount,
    required this.id,
    required this.isShown,
  }) : super(key: key);

  @override
  State<ViewProductScreen> createState() => _ViewProductScreenState();
}

class _ViewProductScreenState extends State<ViewProductScreen> {
  bool isAlreadyExist() {
    var data = MyOrderCtrl.find.orderList.where((element) => element.id == widget.id);
    if (data.isEmpty) return false;
    data.first.quantity = data.first.quantity! + ViewProductsController.find.quantity.value;
    data.first.price = data.first.price! + ViewProductsController.find.finalPrice.value;
    log('userOrder:: ${MyOrderCtrl.find.orderList}');
    return true;
  }

  void addItem() {
    if (isAlreadyExist()) return;
    MyOrderCtrl.find.addItem(widget.id, ViewProductsController.find.finalPrice.value, ViewProductsController.find.quantity.value);
    log('userOrder:: ${MyOrderCtrl.find.orderList}');
  }

  @override
  void initState() {
    ViewProductsController.find.init(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const BaseAppBar(),
      body: GetBuilder<ViewProductsController>(
        builder: (context) {
          return FutureBuilder<ViewProductsModel?>(
            future: ViewProductsController.find.viewProductsData,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 30.0),
                      child: CircularProgressIndicator(),
                    ),
                  );
                case ConnectionState.done:
                default:
                  if (snapshot.hasData) {
                    final itemCount = snapshot.data!.product!.images!.length;
                    return Column(
                      children: [
                        Flexible(
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              GetBuilder<ViewProductsController>(builder: (controller) {
                                return PageView.builder(
                                  itemCount: itemCount,
                                  onPageChanged: (value) {
                                    controller.toggleIndex(value);
                                  },
                                  itemBuilder: (context, index) {
                                    return Container(
                                      padding: const EdgeInsets.only(bottom: 30, top: 20),
                                      child: CustomNetworkImage(url: "${ApiUrl.mainUrl}/${snapshot.data!.product!.images![index]}"),
                                    );
                                  },
                                );
                              }),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                    itemCount,
                                    (index) {
                                      return GetBuilder<ViewProductsController>(builder: (controller) {
                                        return ItemSliderIndicator(
                                          itemCount: itemCount,
                                          color: controller.currentIndex.value == index ? BaseColors.primary : Colors.grey,
                                        );
                                      });
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                            decoration: const BoxDecoration(
                              color: Colors.white38,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      snapshot.data!.product!.name!,
                                      style: BaseTextStyle.black18Bold,
                                    ),
                                    GetBuilder<ViewProductsController>(
                                      builder: (controller) {
                                        return Text("${controller.finalPrice.value} ${"JD".tr}");
                                      },
                                    ),
                                  ],
                                ),
                                const Divider(height: 40),
                                Text(
                                  "Product info".tr,
                                  style: BaseTextStyle.black16UltraBold,
                                ),
                                Text(snapshot.data!.product!.description!),
                                if (!widget.isShown) ...[
                                  const Spacer(),
                                  GetBuilder<ViewProductsController>(
                                    builder: (controller) {
                                      return CustomCartButton(
                                        onRemove: () {
                                          controller.toggleQuantity("remove");
                                        },
                                        onAdd: () {
                                          controller.toggleQuantity("add");
                                        },
                                        count: controller.quantity.value,
                                        onAddToCart: () {
                                          if (CheckUserSignIn.check(context)) {
                                            MyOrderCtrl.find.calculateTotalPrice(ViewProductsController.find.finalPrice.value, status: 'add');
                                            MyOrderCtrl.find.calculateTotalQuantity(ViewProductsController.find.quantity.value, status: 'add');
                                            addItem();
                                            Get.back();
                                          }
                                        },
                                      );
                                    },
                                  ),
                                ]
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return const Text(AppConstants.failedMessage);
                  } else {
                    return const SizedBox.shrink();
                  }
              }
            },
          );
        },
      ),
    );
  }
}
