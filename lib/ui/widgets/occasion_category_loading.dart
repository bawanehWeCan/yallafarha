// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';
//
// class OccasionCategoryShimmerLoading extends StatelessWidget {
//   const OccasionCategoryShimmerLoading({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         childAspectRatio: 0.6,
//         mainAxisSpacing: 15,
//         crossAxisSpacing: 15,
//       ),
//       padding: const EdgeInsets.fromLTRB(20, 20, 20, 80),
//       itemCount: 6,
//       physics: const NeverScrollableScrollPhysics(),
//       itemBuilder: (context, index) {
//         return Shimmer.fromColors(
//           baseColor: Colors.grey.shade300,
//           highlightColor: Colors.grey.shade100,
//           child: Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(15),
//             ),
//             width: 200,
//           ),
//         );
//       },
//     );
//   }
// }
