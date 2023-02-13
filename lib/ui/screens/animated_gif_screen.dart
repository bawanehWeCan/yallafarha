import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/binding/initial_binding.dart';
import 'package:yallah_farha/helper/uni_links_helper.dart';
import 'package:yallah_farha/ui/base_nav_bar.dart';
import 'package:yallah_farha/ui/screens/intro.dart';
import 'package:yallah_farha/ui/screens/registration/sign_in.dart';
import 'package:yallah_farha/utils/shared_prefrences.dart';

class AnimatedGifScreen extends StatefulWidget {
  const AnimatedGifScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AnimatedGifScreen> createState() => _AnimatedGifScreenState();
}

class _AnimatedGifScreenState extends State<AnimatedGifScreen> {
  Timer? _timer;
  int _start = 4;
  final uniLinksHelper = UniLinksHelper();

  Future initLinks() async {
    uniLinksHelper.handleBackgroundState(context);
    await uniLinksHelper.handleTerminatedState(context);
    print("isPaused:: ${uniLinksHelper.sub!.isPaused}");
  }

  Future _toggleScreen() async {
    if (MySharedPreferences.isLogIn) {
      Get.offAll(() => const BaseNavBar(initializeLink: true), binding: BaseNavBinding());
    } else if (!MySharedPreferences.isLogIn && !MySharedPreferences.isPassedIntro) {
      Get.offAll(() => const IntroScreen(initializeLink: true));
    } else {
      Get.offAll(() => const SignInScreen(initializeLink: true, route: 'home'));
    }
    initLinks();
  }

  void startTimer(BuildContext context) {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) async {
        if (_start == 0) {
          timer.cancel();
          _toggleScreen();
        } else {
          _start--;
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    startTimer(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _timer!.cancel();
    uniLinksHelper.sub!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/mygif.gif'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
