import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/utils/base/text_style.dart';

class MyOrderCard extends StatelessWidget {
  final String title;
  final String quantity;
  final String price;
  final String date;
  final String status;

  const MyOrderCard({
    Key? key,
    required this.title,
    required this.quantity,
    required this.price,
    required this.date,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: BaseTextStyle.black18Bold,
              ),
              Text(
                "${"Total price".tr}: $price ${"JD".tr}",
              ),
              Chip(
                label: Text(status),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
