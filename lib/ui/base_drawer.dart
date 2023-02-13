import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yallah_farha/controller/base_nav_bar_ctrl.dart';
import 'package:yallah_farha/ui/screens/drawer/become_a_supplier.dart';
import 'package:yallah_farha/ui/screens/drawer/contact_us.dart';
import 'package:yallah_farha/ui/screens/notifications/notifications.dart';
import 'package:yallah_farha/ui/screens/registration/sign_in.dart';
import 'package:yallah_farha/ui/web_content_screen.dart';
import 'package:yallah_farha/utils/base/colors.dart';
import 'package:yallah_farha/utils/base/images.dart';
import 'package:yallah_farha/utils/base/text_style.dart';
import 'package:yallah_farha/utils/shared_prefrences.dart';

enum Languages { english, arabic }

class BaseDrawer extends StatelessWidget {
  const BaseDrawer({Key? key}) : super(key: key);

  static final _icons = [
    FontAwesomeIcons.facebookF,
    FontAwesomeIcons.twitter,
    FontAwesomeIcons.instagram,
  ];

  static final _footerTexts = [
    "Privacy policy",
    "Terms & Conditions",
    "Refund policy",
    "Contact us",
    "Become a supplier",
  ];

  static final _socialUrl = {
    "facebook": "https://www.facebook.com/Yalla-Farha-100656119483437",
    "twitter": "https://twitter.com/FarhaYalla",
    "instagram": "https://www.instagram.com/yallafarha22/",
  };

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

  void _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) throw 'Could not launch $uri';
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // backgroundColor: Colors.transparent,
      child: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                BaseImages.drawerBottom,
              ),
            ),
            Image.asset(BaseImages.drawerTop),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: ListView(
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Scaffold.of(context).closeDrawer();
                            BaseNavBarCtrl.find.navBarController.index = 0;
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                            child: Text(
                              'Home'.tr,
                              style: BaseTextStyle.black18Bold,
                            ),
                          ),
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Get.to(() =>  WebContentScreen(url: MySharedPreferences.language == 'en'?'https://yalafarha.com/about-us':'https://yalafarha.com/ar/about-us'));
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                            child: Text(
                              'About Yalla Farha'.tr,
                              style: BaseTextStyle.black18Bold,
                            ),
                          ),
                        ),
                      ),
                      if (MySharedPreferences.isLogIn)
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              Scaffold.of(context).closeDrawer();
                              BaseNavBarCtrl.find.navBarController.index = 4;
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                              child: Text(
                                'Account'.tr,
                                style: BaseTextStyle.black18Bold,
                              ),
                            ),
                          ),
                        ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            _showLanguageDialog(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                            child: Text(
                              'Language'.tr,
                              style: BaseTextStyle.black18Bold,
                            ),
                          ),
                        ),
                      ),
                      if (MySharedPreferences.isLogIn)
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              Get.to(() => const NotificationsScreen());
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                              child: Text(
                                'Notifications'.tr,
                                style: BaseTextStyle.black18Bold,
                              ),
                            ),
                          ),
                        ),
                      if (MySharedPreferences.isLogIn)
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              FirebaseAuth.instance.signOut();
                              MySharedPreferences.clearProfile();
                              Get.offAll(() => const SignInScreen(route: 'home'));
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                              child: Text(
                                'Logout'.tr,
                                style: BaseTextStyle.black18Bold,
                              ),
                            ),
                          ),
                        ),
                      if (!MySharedPreferences.isLogIn)
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              Get.offAll(() => const SignInScreen(route: 'home'));
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                              child: Text(
                                'Sign in'.tr,
                                style: BaseTextStyle.black18Bold,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Center(
                      child: Text(
                        "Follow Us".tr,
                        style: BaseTextStyle.black18Bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _icons.map((element) {
                          final index = _icons.indexOf(element);
                          return GestureDetector(
                            onTap: () {
                              switch (index) {
                                case 0:
                                  {
                                    _launchUrl(_socialUrl["facebook"].toString());
                                  }
                                  break;
                                case 1:
                                  {
                                    _launchUrl(_socialUrl["twitter"].toString());
                                  }
                                  break;
                                case 2:
                                  {
                                    _launchUrl(_socialUrl["instagram"].toString());
                                  }
                                  break;
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFFEF2098),
                                    Color(0xFF7B3DBA),
                                  ],
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Icon(
                                  element,
                                  color: BaseColors.white,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    Center(
                      child: Wrap(
                        spacing: 20,
                        alignment: WrapAlignment.center,
                        children: _footerTexts.map((element) {
                          final index = _footerTexts.indexOf(element);
                          return Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                switch (index) {
                                  case 0:
                                    {
                                      Get.to(() =>  WebContentScreen(url: MySharedPreferences.language=='en'?'https://yalafarha.com/privacy-policy':'https://yalafarha.com/ar/syash-alkhsosy'));
                                    }
                                    break;
                                  case 1:
                                    {
                                      Get.to(() => WebContentScreen(url: MySharedPreferences.language=='en'?'https://yalafarha.com/terms-conditions':'https://yalafarha.com/ar/alshrot-oalahkam'));
                                    }
                                    break;
                                  case 2:
                                    {
                                      Get.to(() => WebContentScreen(url: MySharedPreferences.language=='en'?'https://yalafarha.com/returns-exchanges':'https://yalafarha.com/ar/syas-alastrgaaa'));
                                    }
                                    break;
                                  case 3:
                                    {
                                      Get.to(() => const ContactUsScreen());
                                    }
                                    break;
                                  case 4:
                                    {
                                      Get.to(() => const BecomeASupplierScreen());
                                    }
                                    break;
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  element.tr,
                                  style: BaseTextStyle.black11,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
