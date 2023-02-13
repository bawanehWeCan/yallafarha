import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/utils/base/colors.dart';
import 'package:yallah_farha/utils/base/icons.dart';
import 'package:yallah_farha/utils/base/text_style.dart';

class RatingBarWidget extends StatelessWidget {
  final Function(double) onRatingUpdate;

  const RatingBarWidget({
    Key? key,
    required this.onRatingUpdate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Overall rating*".tr),
        RatingBar(
          initialRating: 3,
          direction: Axis.horizontal,
          allowHalfRating: false,
          itemCount: 5,
          itemSize: 25,
          ratingWidget: RatingWidget(
            full: Icon(FontAwesomeIcons.solidStar, color: BaseColors.yellowE3D),
            half: SvgPicture.asset(BaseIcon.star),
            empty: SvgPicture.asset(BaseIcon.star),
          ),
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          onRatingUpdate: onRatingUpdate,
        ),
        Text("Click to rate!".tr, style: BaseTextStyle.black11),
      ],
    );
  }
}
