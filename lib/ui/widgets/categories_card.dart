import 'package:flutter/material.dart';
import 'package:yallah_farha/utils/base/border_radius.dart';
import 'package:yallah_farha/utils/base/colors.dart';
import 'package:yallah_farha/utils/base/text_style.dart';

class CategoriesCard extends StatelessWidget {
  final String title;
  final String image;
  final Color borderColor;
  final Function() onTap;

  const CategoriesCard({
    Key? key,
    required this.title,
    required this.image,
    required this.borderColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BaseBorderRadius.border15,
          side: BorderSide(color: borderColor),
        ),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsetsDirectional.only(start: 10),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(
                    image,
                  ),
                ),
                border: Border.all(color: BaseColors.purple0A1),
                // gradient: LinearGradient(
                //   colors: [
                //     BaseColors.purple0A1,
                //     BaseColors.purple8CF,
                //   ],
                //   begin: Alignment.topCenter,
                //   end: Alignment.bottomCenter,
                // ),
              ),
            ),
            VerticalDivider(
              color: BaseColors.greyDDD,
              indent: 15,
              endIndent: 15,
            ),
            // const SizedBox(width: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(title, style: BaseTextStyle.black14Bold),
            ),
          ],
        ),
      ),
    );
  }
}
