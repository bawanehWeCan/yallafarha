import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCartButton extends StatelessWidget {
  final Function() onRemove;
  final Function() onAdd;
  final int count;
  final Function() onAddToCart;

  const CustomCartButton({
    Key? key,
    required this.onRemove,
    required this.onAdd,
    required this.count,
    required this.onAddToCart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FloatingActionButton.small(
          heroTag: "2223",
          onPressed: onRemove,
          child: const Icon(Icons.remove),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text("$count"),
        ),
        FloatingActionButton.small(
          heroTag: "011",
          onPressed: onAdd,
          child: const Icon(Icons.add),
        ),
        const Spacer(),
        FloatingActionButton.extended(
          heroTag: "9iii",
          onPressed: onAddToCart,
          label: Text("Add to cart".tr),
        ),
      ],
    );
  }
}
