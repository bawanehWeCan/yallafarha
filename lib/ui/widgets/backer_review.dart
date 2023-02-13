import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackerReview extends StatelessWidget {
  final String name;
  final String text;

  const BackerReview({
    Key? key,
    required this.name,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back),
            ),
            Text(name),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
            child: Text(text),
          ),
        )
      ],
    );
  }
}
