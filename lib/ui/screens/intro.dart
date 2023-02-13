import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/main.dart';
import 'package:yallah_farha/ui/screens/registration/sign_in.dart';
import 'package:yallah_farha/ui/widgets/intro_body.dart';
import 'package:yallah_farha/utils/base/colors.dart';
import 'package:yallah_farha/utils/base/decoration.dart';
import 'package:yallah_farha/utils/base/images.dart';
import 'package:yallah_farha/utils/base/text_style.dart';
import 'package:yallah_farha/utils/shared_prefrences.dart';

class IntroScreen extends StatefulWidget {
  final bool? initializeLink;

  const IntroScreen({
    Key? key,
    this.initializeLink = false,
  }) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  static int _index = 0;
  static final _pageCtrl = PageController();
  static final List<String> images = [
    '',
    BaseImages.step1,
    BaseImages.step2,
    BaseImages.step3,
    BaseImages.step4,
  ];

  static BoxDecoration? _decoration(int index) {
    if (index == 0) {
      return BaseDecoration.introBackground0;
    } else if (index == 1) {
      return BaseDecoration.introBackground1;
    } else if (index == 2 || index == 4) {
      return BaseDecoration.introBackground2And4;
    } else if (index == 3) {
      return BaseDecoration.introBackground3;
    }
    return null;
  }

  Widget _welcome() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            BaseImages.logoLarge,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Row(
              children: [
                const Spacer(),
                IconButton(
                  onPressed: () {
                    _pageCtrl.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  },
                  icon: Icon(
                    Icons.navigate_next,
                    color: BaseColors.white,
                    size: 40,
                  ),
                ),
              ],
            ),
          ),
          Text(
            "Yalla Farha".tr,
            style: BaseTextStyle.white38SemiBold,
          ),
          Text(
            "YOU ARE FOUR STEPS AWAY FROM YOUR HAPPINESS".tr,
            style: BaseTextStyle.white20UltraBold,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Future initLinks() async {
    if (!uniLinksHelper.isInitialized) {
      uniLinksHelper.handleBackgroundState(context);
      await uniLinksHelper.handleTerminatedState(context);
    }
  }

  @override
  void initState() {
    initLinks();
    super.initState();
  }

  @override
  void dispose() {
    if (!uniLinksHelper.isInitialized) {
      uniLinksHelper.sub!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        decoration: _decoration(_index),
        duration: const Duration(milliseconds: 500),
        child: PageView.builder(
          controller: _pageCtrl,
          onPageChanged: (index) {
            setState(() {
              _index = index;
            });
          },
          itemCount: 5,
          itemBuilder: (context, index) {
            if (index == 0) {
              return _welcome();
            } else {
              return IntroBody(
                image: images[index],
                onPressedLeft: () {
                  _pageCtrl.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                },
                onPressedRight: () {
                  if (index == 4) {
                    Get.offAll(() => const SignInScreen(route: 'home'));
                    MySharedPreferences.isPassedIntro = true;
                  } else {
                    _pageCtrl.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  }
                },
              );
            }
          },
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:yallah_farha/helper/uni_links_helper.dart';
// import 'package:yallah_farha/main.dart';
// import 'package:yallah_farha/ui/screens/registration/sign_in.dart';
// import 'package:yallah_farha/ui/widgets/intro_body.dart';
// import 'package:yallah_farha/utils/base/colors.dart';
// import 'package:yallah_farha/utils/base/decoration.dart';
// import 'package:yallah_farha/utils/base/images.dart';
// import 'package:yallah_farha/utils/base/text_style.dart';
// import 'package:yallah_farha/utils/shared_prefrences.dart';
//
// class IntroScreen extends StatefulWidget {
//   final bool? initializeLink;
//
//   const IntroScreen({
//     Key? key,
//     this.initializeLink = false,
//   }) : super(key: key);
//
//   @override
//   State<IntroScreen> createState() => _IntroScreenState();
// }
//
// class _IntroScreenState extends State<IntroScreen> {
//   static int _index = 0;
//   static final _pageCtrl = PageController();
//
//   static String? _stepNum(int index) {
//     if (index == 1) {
//       return "STEP 1";
//     } else if (index == 2) {
//       return "STEP 2";
//     } else if (index == 3) {
//       return "STEP 3";
//     } else if (index == 4) {
//       return "STEP 4";
//     }
//     return null;
//   }
//
//   static String? _title(int index) {
//     if (index == 1) {
//       return "CREATE YOUR ACCOUNT";
//     } else if (index == 2) {
//       return "CHOOSE YOUR OCCASION";
//     } else if (index == 3) {
//       return "PICK YOUR ITEMS";
//     } else if (index == 4) {
//       return "SHARE YOUR WISHLIST";
//     }
//     return null;
//   }
//
//   static BoxDecoration? _decoration(int index) {
//     if (index == 0) {
//       return BaseDecoration.introBackground0;
//     } else if (index == 1) {
//       return BaseDecoration.introBackground1;
//     } else if (index == 2 || index == 4) {
//       return BaseDecoration.introBackground2And4;
//     } else if (index == 3) {
//       return BaseDecoration.introBackground3;
//     }
//     return null;
//   }
//
//   Widget _welcome() {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Image.asset(
//             BaseImages.logoLarge,
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 50),
//             child: Row(
//               children: [
//                 const Spacer(),
//                 IconButton(
//                   onPressed: () {
//                     _pageCtrl.nextPage(
//                       duration: const Duration(milliseconds: 300),
//                       curve: Curves.easeIn,
//                     );
//                   },
//                   icon: Icon(
//                     Icons.navigate_next,
//                     color: BaseColors.white,
//                     size: 40,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Text(
//             "Yalla Farha".tr,
//             style: BaseTextStyle.white38SemiBold,
//           ),
//           Text(
//             "YOU ARE FOUR STEPS AWAY FROM YOUR HAPPINESS".tr,
//             style: BaseTextStyle.white20UltraBold,
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }
//
//   Future initLinks() async {
//     if (!uniLinksHelper.isInitialized) {
//       uniLinksHelper.handleBackgroundState(context);
//       await uniLinksHelper.handleTerminatedState(context);
//     }
//   }
//
//   @override
//   void initState() {
//     initLinks();
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     if (!uniLinksHelper.isInitialized) {
//       uniLinksHelper.sub!.cancel();
//     }
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: AnimatedContainer(
//         decoration: _decoration(_index),
//         duration: const Duration(milliseconds: 500),
//         child: SafeArea(
//           child: PageView.builder(
//             controller: _pageCtrl,
//             onPageChanged: (index) {
//               setState(() {
//                 _index = index;
//               });
//             },
//             itemCount: 5,
//             itemBuilder: (context, index) {
//               if (index == 0) {
//                 return _welcome();
//               } else {
//                 return Padding(
//                   padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
//                   child: IntroBody(
//                     index: index,
//                     stepNum: _stepNum(index)!,
//                     title: _title(index)!.tr,
//                     onPressedLeft: () {
//                       _pageCtrl.previousPage(
//                         duration: const Duration(milliseconds: 300),
//                         curve: Curves.easeIn,
//                       );
//                     },
//                     onPressedRight: () {
//                       if (index == 4) {
//                         Get.offAll(() => const SignInScreen(route: 'home'));
//                         MySharedPreferences.isPassedIntro = true;
//                       } else {
//                         _pageCtrl.nextPage(
//                           duration: const Duration(milliseconds: 300),
//                           curve: Curves.easeIn,
//                         );
//                       }
//                     },
//                   ),
//                 );
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
