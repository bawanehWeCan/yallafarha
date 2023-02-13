import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yallah_farha/utils/base/colors.dart';
import 'package:yallah_farha/utils/base/decoration.dart';

class StoriesLoading extends StatelessWidget {
  const StoriesLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        separatorBuilder: (context, index) => const SizedBox(width: 5),
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: BaseColors.pelorousDark,
            highlightColor: BaseColors.primary,
            child: Container(
              padding: const EdgeInsets.all(3),
              height: 80,
              width: 80,
              decoration: BaseDecoration.storyCircle,
            ),
          );
        },
      ),
    );
  }
}
