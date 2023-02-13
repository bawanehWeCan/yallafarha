import 'package:flutter/material.dart';
import 'package:yallah_farha/utils/base/border_radius.dart';

class CustomNavBaaButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isChosen;

  const CustomNavBaaButton({
    Key? key,
    required this.icon,
    required this.title,
    required this.isChosen,
  }) : super(key: key);

  static Color _toggleColor(bool isChosen) {
    if (isChosen) {
      return Colors.white.withOpacity(0.19);
    } else {
      return Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: BoxDecoration(
        color: _toggleColor(isChosen),
        borderRadius: BaseBorderRadius.border15,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Icon(
              icon,
              size: 15,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Material(
              type: MaterialType.transparency,
              child: FittedBox(
                child: Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 12.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
