// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:yallah_farha/controller.dart';
// import 'package:yallah_farha/model.dart';
// import 'package:yallah_farha/utils/base/colors.dart';
//
// class StoryCircle extends StatelessWidget {
//   const StoryCircle({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<CategoryController>(
//       builder: (_controller) {
//         return FutureBuilder<CategoryModel?>(
//           future: _controller.categoryData,
//           builder: (context, snapshot) {
//             switch (snapshot.connectionState) {
//               case ConnectionState.waiting:
//                 return const Center(child: CircularProgressIndicator());
//               case ConnectionState.done:
//               default:
//                 if (snapshot.hasError) {
//                   Fluttertoast.showToast(msg: "حدث خطأ ما");
//                   return const SizedBox.shrink();
//                 } else if (snapshot.hasData) {
//                   final _length = snapshot.data!.data!.length;
//                   return SizedBox(
//                     height: 140,
//                     child: ListView.separated(
//                       physics: const BouncingScrollPhysics(),
//                       padding: const EdgeInsets.all(10),
//                       scrollDirection: Axis.horizontal,
//                       itemCount: _length,
//                       separatorBuilder: (context, index) => const SizedBox(width: 5),
//                       itemBuilder: (context, index) {
//                         final _result = snapshot.data!.data![index];
//                         final _image = _result.image;
//                         final _name = _result.name;
//                         return CircleAvatar(
//                           backgroundColor: BaseColors.purple4A4,
//                           radius: 58,
//                           child: CircleAvatar(
//                             backgroundColor: BaseColors.white,
//                             radius: 53,
//                             child: CircleAvatar(
//                               radius: 50,
//                               backgroundColor: BaseColors.purple4A4,
//                               backgroundImage: NetworkImage("https://ta2weel.com/public/$_image"),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   );
//                 } else {
//                   //received null
//                   Fluttertoast.showToast(msg: "حدث خطأ ما");
//                   return const SizedBox.shrink();
//                 }
//             }
//           },
//         );
//       },
//     );
//   }
// }

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:yallah_farha/utils/base/decoration.dart';

class StoryCircleWidget extends StatelessWidget {
  final Function() onTap;
  final String image;

  const StoryCircleWidget({Key? key, required this.onTap, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(3),
        height: 80,
        width: 80,
        decoration: BaseDecoration.storyCircle,
        child: CircleAvatar(
          backgroundImage: CachedNetworkImageProvider(image),
        ),
      ),
    );
  }
}
