import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yallah_farha/ui/widgets/base_app_bar.dart';
import 'package:yallah_farha/utils/base/border_radius.dart';
import 'package:yallah_farha/utils/base/colors.dart';
import 'package:yallah_farha/utils/base/images.dart';
import 'package:yallah_farha/utils/base/text_style.dart';

class WhoWeAreScreen extends StatelessWidget {
  const WhoWeAreScreen({Key? key}) : super(key: key);

  static final _info = [
    {
      "title": "Community",
      "body": "We believe in the power of the communities we create and serve, our community of team members and in giving back to the communities we live in.",
      "image": BaseImages.heart,
    },
    {
      "title": "Trust",
      "body": "Reflected throughout the company communications, trust is a pre-requisite for us to achieve a synergy with both internal as well as external stakeholders.",
      "image": BaseImages.heart,
    },
    {
      "title": "Simplicity",
      "body": "We believe in keeping things simple, both for consumers and organization.",
      "image": BaseImages.heart,
    },
    {
      "title": "Transparency",
      "body": "We believe in openness and promote it within the organization.",
      "image": BaseImages.heart,
    },
  ];

  static final _socialUrl = {
    "facebook": "https://www.facebook.com/Yalla-Farha-100656119483437",
    "twitter": "https://twitter.com/FarhaYalla",
    "instagram": "https://www.instagram.com/yallafarha22/",
  };

  static final _icons = [
    FontAwesomeIcons.facebookF,
    FontAwesomeIcons.twitter,
    FontAwesomeIcons.instagram,
  ];

  void _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) throw 'Could not launch $uri';
  }

  static Widget _getImage() {
    return Expanded(
      child: Image.asset(
        BaseImages.whoWeAre,
        width: Get.width,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const BaseAppBar(),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(
              3,
              (index) => _getImage(),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                // padding: const EdgeInsets.all(20),
                children: [
                  Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BaseBorderRadius.border20,
                      image: DecorationImage(
                        image: AssetImage(
                          BaseImages.lamp,
                        ),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.symmetric(vertical: 30),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Who we are",
                            style: BaseTextStyle.black18Bold,
                          ),
                          const SizedBox(height: 20),
                          const Text("Our mission is to support and achieve social solidarity and facilitating the process of the people getting married, having weddings and other happy events by taking advantage of the development of technology in order to transform"),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Our values",
                      style: BaseTextStyle.black16UltraBold,
                    ),
                  ),
                  ..._info.map(
                    (element) {
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Image.asset(element["image"].toString(), height: 180),
                              Text(
                                element["title"].toString(),
                                style: BaseTextStyle.black16UltraBold,
                              ),
                              const SizedBox(height: 15),
                              Text(element["body"].toString()),
                              const SizedBox(height: 15),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    child: Center(
                        child: Text(
                      "The Team",
                      style: BaseTextStyle.black20SemiBold,
                    )),
                  ),
                  Card(
                    margin: const EdgeInsets.only(bottom: 20.0),
                    shape: RoundedRectangleBorder(borderRadius: BaseBorderRadius.border15),
                    child: Image.asset(BaseImages.ali),
                  ),
                  Center(
                    child: Text(
                      "Ali Kanaan".tr,
                      style: BaseTextStyle.black16UltraBold.copyWith(color: BaseColors.primary),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0, top: 10),
                    child: Center(
                      child: Text(
                        "Founder CEO".tr,
                        style: BaseTextStyle.black16UltraBold,
                      ),
                    ),
                  ),
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
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Material(
                            color: BaseColors.purple09E,
                            shape: const CircleBorder(),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(50),
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
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Icon(
                                  element,
                                  color: BaseColors.white,
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
