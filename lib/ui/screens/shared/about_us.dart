import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/ui/widgets/about_us_occasions_card.dart';
import 'package:yallah_farha/ui/widgets/base_app_bar.dart';
import 'package:yallah_farha/ui/widgets/our_supplies.dart';
import 'package:yallah_farha/ui/widgets/view_all_widget.dart';
import 'package:yallah_farha/ui/widgets/view_pay_card.dart';
import 'package:yallah_farha/utils/base/border_radius.dart';
import 'package:yallah_farha/utils/base/images.dart';
import 'package:yallah_farha/utils/base/strings.dart';
import 'package:yallah_farha/utils/base/text_style.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BaseBorderRadius.border15,
              child: Hero(
                tag: "charity",
                child: Image.asset(
                  BaseImages.charity,
                ),
              ),
            ),
            const AboutUsOccasionsCard(
              text: "Our mission is to support and achieve social solidarity and facilitating the process of the people getting married, having weddings and other happy events by taking advantage of the development of technology in order to transform, hence, advance the traditional process of “gifting” during those happy events, along with encouraging youth to get married by supporting the newlyweds into having an option to start their married life with the least material/financial obligations possible.",
            ),
            ViewAllWidget(
              title: BaseStrings.charities,
              onPressed: () {},
            ),
            const OurSuppliersWidget(),
            Text(
              "BE A PART OF THEIR HAPPINESS".tr,
              style: BaseTextStyle.black18Bold,
            ),
            GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: 4,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
              ),
              itemBuilder: (context, index) {
                return const ViewPayCard(
                  title: 'Khaled',
                  image: "https://media.istockphoto.com/photos/the-bride-and-groom-use-the-little-finger-together-lovely-couple-hold-picture-id1303189272?b=1&k=20&m=1303189272&s=170667a&w=0&h=WnIL6BWn5oMFdlTeoeOTcxm_rom-xIFxpOVPeQYzd48=",
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
