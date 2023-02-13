import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/binding/occassions/my_occasions.dart';
import 'package:yallah_farha/binding/update_profile.dart';
import 'package:yallah_farha/controller/base_nav_bar_ctrl.dart';
import 'package:yallah_farha/ui/base_drawer.dart';
import 'package:yallah_farha/ui/base_nav_bar.dart';
import 'package:yallah_farha/ui/screens/notifications/notifications.dart';
import 'package:yallah_farha/ui/screens/profile/edit_profile.dart';
import 'package:yallah_farha/ui/screens/profile/my_occasions.dart';
import 'package:yallah_farha/ui/screens/registration/sign_in.dart';
import 'package:yallah_farha/ui/widgets/profile_app_bar.dart';
import 'package:yallah_farha/ui/widgets/profile_pic_widget.dart';
import 'package:yallah_farha/utils/base/colors.dart';
import 'package:yallah_farha/utils/base/decoration.dart';
import 'package:yallah_farha/utils/base/text_style.dart';
import 'package:yallah_farha/utils/shared_prefrences.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  final _options = [
    {
      "title": "Edit profile",
      "icon": FontAwesomeIcons.pen,
    },
    {
      "title": "My occasions",
      "icon": FontAwesomeIcons.calendarDays,
    },
    {
      "title": "My orders",
      "icon": FontAwesomeIcons.bagShopping,
    },
    {
      "title": "Language",
      "icon": FontAwesomeIcons.globe,
    },
    {
      "title": "Notifications",
      "icon": FontAwesomeIcons.solidBell,
    },
    {
      "title": "Logout",
      "icon": Icons.logout,
    },
  ];

  Future<void> _showLanguageDialog(BuildContext context) async {
    showDialog<Languages>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('Select Language'.tr),
          children: <Widget>[
            SimpleDialogOption(
              child: const Text('English'),
              onPressed: () {
                Get.back();
                if (MySharedPreferences.language == "en") return;
                MySharedPreferences.language = "en";
                Get.updateLocale(Locale(MySharedPreferences.language));
              },
            ),
            SimpleDialogOption(
              child: const Text('العربية'),
              onPressed: () {
                Get.back();
                if (MySharedPreferences.language == "ar") return;
                MySharedPreferences.language = "ar";
                Get.updateLocale(Locale(MySharedPreferences.language));
              },
            ),
          ],
        );
      },
    );
  }

  void _onTap(int index, BuildContext context) {
    switch (index) {
      case 0:
        {
          Get.to(() => const EditProfileScreen(), binding: UpdateUserBinding())!.then((value) => setState(() {}));
        }
        break;
      case 1:
        {
          Get.to(() => const MyOccasionsScreen(), binding: MyOccasionsBinding());
        }
        break;
      case 2:
        {
          BaseNavBarCtrl.find.navBarController.index = 3;
        }
        break;
      case 3:
        {
          _showLanguageDialog(context);
        }
        break;
      case 4:
        {
          Get.to(() => const NotificationsScreen());
        }
        break;
      case 5:
        {
          FirebaseAuth.instance.signOut();
          MySharedPreferences.clearProfile();
          Get.offAll(() => const SignInScreen(route: 'home'));
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: const BaseDrawer(),
      appBar: const ProfileAppBar(),
      body: Container(
        height: Get.height,
        decoration: BaseDecoration.myProfileBubble,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                const ProfilePicWidget(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    MySharedPreferences.fullName,
                    style: BaseTextStyle.white20UltraBold,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 0),
                  alignment: Alignment.center,
                  decoration: BaseDecoration.whiteBubble,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: _options.map((element) {
                      final index = _options.indexOf(element);
                      return Material(
                        type: MaterialType.transparency,
                        child: ListTile(
                          onTap: () {
                            _onTap(index, context);
                          },
                          leading: SizedBox(
                            width: Get.width / 2 - 100,
                            child: Align(
                              alignment: MySharedPreferences.language == "en" ? Alignment.centerRight : Alignment.centerLeft,
                              child: CircleAvatar(
                                backgroundColor: BaseColors.purple19F,
                                child: Icon(
                                  element['icon'] as IconData,
                                  color: BaseColors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                          title: Text(element['title'].toString().tr, style: BaseTextStyle.black14Bold),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
