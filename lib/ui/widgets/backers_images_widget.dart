import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/utils/base/text_style.dart';

class BackersWidget extends StatelessWidget {
  final Function() onTap;
  final String backersNum;
  final List<Widget> children;

  const BackersWidget({
    Key? key,
    required this.onTap,
    required this.backersNum,
    required this.children,
  }) : super(key: key);

  static const double _space = 20;

  static String _getImage(int index) {
    if (index.floor().isEven) {
      return "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cmFuZG9tJTIwcGVvcGxlfGVufDB8fDB8fA%3D%3D&w=1000&q=80";
    } else {
      return "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_jpFQ934XAec6pbC3S1uBv4sORosYK-LEbzO6tGX3-n5VQjJunAaJHpJTIzOmMGGeSnI&usqp=CAU";
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            height: 50,
            width: 230,
            child: Stack(
              alignment: Alignment.center,
              children: children,
            ),
          ),
          const SizedBox(width: 5),
          Flexible(
            child: FittedBox(
              child: Text(
                "${"Backers".tr} +$backersNum",
                style: BaseTextStyle.black14Bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
