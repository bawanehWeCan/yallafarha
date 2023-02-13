import 'package:flutter/material.dart';
import 'package:yallah_farha/ui/widgets/custom_network_image.dart';

class ImageBox extends StatelessWidget {
  final String? image;
  final Widget? child;
  final Function() onTap;
  final double width;

  const ImageBox({
    Key? key,
    this.image,
    this.child,
    required this.onTap,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomNetworkImage(
        border: 15,
        url: image!,
        width: width,
      ),
    );
  }
}
