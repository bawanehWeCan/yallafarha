import 'package:flutter/material.dart';

class ItemSliderIndicator extends StatelessWidget {
  final int itemCount;
  final Color color;

  const ItemSliderIndicator({Key? key, required this.itemCount, required this.color}) : super(key: key);

  static const double _diameter = 18;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      height: _diameter,
      width: _diameter,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
