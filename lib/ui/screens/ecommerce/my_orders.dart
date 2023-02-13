import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/controller/ecommerce/my_orders.dart';
import 'package:yallah_farha/model/ecommerce/my_orders.dart';
import 'package:yallah_farha/ui/base_drawer.dart';
import 'package:yallah_farha/ui/widgets/base_app_bar.dart';
import 'package:yallah_farha/ui/widgets/my_order_card.dart';
import 'package:yallah_farha/utils/app_constants.dart';
import 'package:yallah_farha/utils/base/images.dart';
import 'package:yallah_farha/utils/base/text_style.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  @override
  void initState() {
    MyOrdersController.myOrdersData = MyOrdersController.fetchSliderData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(),
      drawer: const BaseDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                "My orders".tr,
                style: BaseTextStyle.black18Bold,
              ),
              const SizedBox(height: 30),
              FutureBuilder<MyOrdersModel?>(
                future: MyOrdersController.myOrdersData,
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return const Center(child: CircularProgressIndicator());
                    case ConnectionState.done:
                    default:
                      if (snapshot.hasData) {
                        if (snapshot.data!.orders!.isEmpty) {
                          return Expanded(
                            child: Center(
                              child: Text(
                                "There are no previous orders".tr,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        }
                        return Expanded(
                          child: ListView.builder(
                            itemCount: snapshot.data!.orders!.length,
                            itemBuilder: (context, index) {
                              return MyOrderCard(
                                title: snapshot.data!.orders![index].shippingMethod!,
                                quantity: snapshot.data!.orders![index].id.toString(),
                                price: snapshot.data!.orders![index].subTotal!,
                                date: snapshot.data!.orders![index].createdAt!,
                                status: snapshot.data!.orders![index].status!,
                              );
                            },
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return const Text(AppConstants.failedMessage);
                      } else {
                        return const Text(AppConstants.failedMessage);
                      }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
