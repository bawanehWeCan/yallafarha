import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yallah_farha/utils/base/colors.dart';
import 'package:yallah_farha/utils/base/text_style.dart';

class ReviewBox extends StatelessWidget {
  final double rate;
  final String review;
  final String reviewSummery;
  final String time;
  final String name;

  const ReviewBox({
    Key? key,
    required this.rate,
    required this.review,
    required this.time,
    required this.name,
    required this.reviewSummery,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      padding: const EdgeInsets.all(16.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFF393939).withOpacity(0.70),
        borderRadius: BorderRadius.circular(20),
      ),
      height: 230,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 5; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: i + 1 <= rate
                      ? Icon(
                          FontAwesomeIcons.solidStar,
                          color: BaseColors.yellowE1F,
                          size: 26,
                        )
                      : Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.solidStar,
                              color: BaseColors.yellowE1F,
                              size: 26,
                            ),
                            Icon(
                              FontAwesomeIcons.solidStar,
                              color: BaseColors.greyEDB,
                              size: 23,
                            ),
                          ],
                        ),
                ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            //TODO: ask for max lines
            reviewSummery,
            style: BaseTextStyle.white16UltraBold,
          ),
          const SizedBox(height: 10),
          Text(
            //TODO: ask for max lines
            review,
            style: BaseTextStyle.white14,
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: BaseTextStyle.white12,
              ),
              Text(
                time,
                style: BaseTextStyle.white12,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
