import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/ui/widgets/review_box.dart';
import 'package:yallah_farha/utils/api_url.dart';
import 'package:yallah_farha/utils/base/images.dart';

class ImageStoryScreen extends StatelessWidget {
  final String imageUrl;
  final double rate;
  final String review;
  final String reviewSummery;
  final String time;

  const ImageStoryScreen({
    Key? key,
    required this.imageUrl,
    required this.rate,
    required this.review,
    required this.time,
    required this.reviewSummery,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CachedNetworkImage(
            height: Get.height,
            imageUrl: "${ApiUrl.mainUrl}/$imageUrl",
            placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Image.asset(BaseImages.placeHolder),
          ),
        ),
        ReviewBox(
          name: "khaled",
          rate: rate,
          review: review,
          time: time,
          reviewSummery: reviewSummery,
        ),
      ],
    );
  }
}
