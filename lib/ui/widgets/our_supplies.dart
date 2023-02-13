import 'package:flutter/material.dart';
import 'package:yallah_farha/utils/base/colors.dart';

class OurSuppliersWidget extends StatelessWidget {
  const OurSuppliersWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: BaseColors.grey2F2,
      height: 160,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 5),
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnIX_WtVC8SLDNymWVIVzhV1CwH6-NNvXJ7y-zNpUK1A5s7y-DCyf2jZUOs1uB3-y1k44&usqp=CAU",
            width: 150,
          );
        },
      ),
    );
  }
}
