import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:yallah_farha/binding/initial_binding.dart';
import 'package:yallah_farha/controller/occasions/view_occasion.dart';
import 'package:yallah_farha/model/occasions/view_occasion_model.dart';
import 'package:yallah_farha/ui/base_nav_bar.dart';
import 'package:yallah_farha/ui/widgets/backer_review.dart';
import 'package:yallah_farha/ui/widgets/backers_images_widget.dart';
import 'package:yallah_farha/ui/widgets/base_app_bar.dart';
import 'package:yallah_farha/ui/widgets/custom_network_image.dart';
import 'package:yallah_farha/ui/widgets/custom_rounded_button.dart';
import 'package:yallah_farha/ui/widgets/occasion_details_widget.dart';
import 'package:yallah_farha/ui/widgets/occasion_time_line.dart';
import 'package:yallah_farha/ui/widgets/wish_list_card.dart';
import 'package:yallah_farha/utils/api_url.dart';
import 'package:yallah_farha/utils/app_constants.dart';
import 'package:yallah_farha/utils/base/colors.dart';
import 'package:yallah_farha/utils/base/text_style.dart';

class ViewOccasionScreen extends StatelessWidget {
  final bool backHome;

  const ViewOccasionScreen({
    Key? key,
    this.backHome = false,
  }) : super(key: key);

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: backHome
          ? () async {
              if (backHome) {
                Get.offAll(() => const BaseNavBar(), binding: BaseNavBinding());
              }
              return false;
            }
          : null,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: CustomRoundedButton(
          onPressed: () async {
            if (ViewOccasionController.find.viewOccasionModel != null) {
              Fluttertoast.showToast(msg: "Link copied, send it to your friends to share your occasion".tr);
              var link = Platform.isAndroid ? "https://yalafarha.com/occasion/?id=${ViewOccasionController.find.id}" : "myoccasion://yalafarha.com/occasion/?id=${ViewOccasionController.find.id}";
              Clipboard.setData(ClipboardData(text: link));
            }
          },
          label: "Share".tr,
          status: "full_width",
          heroTag: "aow8uuu",
        ),
        appBar: const BaseAppBar(),
        body: FutureBuilder<ViewOccasionModel?>(
          future: ViewOccasionController.find.viewOccasionData,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.done:
              default:
                if (snapshot.hasData) {
                  final dateStart = DateFormat("dd-MM-yyyy").parse(snapshot.data!.wishlist!.start!);
                  final dateEnd = DateFormat("dd-MM-yyyy").parse(snapshot.data!.wishlist!.end!);
                  double percent = (snapshot.data!.wishlist!.collected! / snapshot.data!.wishlist!.total!);
                  if (percent.isNaN || percent.isInfinite) {
                    percent = 0.0;
                  }
                  return ListView(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 65),
                    children: [
                      CustomNetworkImage(
                        url: "${ApiUrl.mainUrl}/${snapshot.data!.wishlist!.image}",
                        height: 180,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            snapshot.data!.wishlist!.name!,
                            style: BaseTextStyle.black18Bold,
                          ),
                          Text(
                            "#${snapshot.data!.wishlist!.id}",
                            style: BaseTextStyle.black11,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      // OccasionTimeLine(start: snapshot.data!.wishlist!.start!, end: DateFormat('yyyy-MM-dd').format(snapshot.data!.wishlist!.end!)),
                      OccasionTimeLine(
                        start: DateFormat("dd-MM-yyyy").format(dateStart),
                        end: DateFormat("dd-MM-yyyy").format(dateEnd),
                      ),
                      if (snapshot.data!.wishlist!.bakers!.isNotEmpty)
                        BackersWidget(
                          backersNum: snapshot.data!.wishlist!.bakers!.length.toString(),
                          onTap: () {
                            Get.bottomSheet(
                              SizedBox(
                                height: 300,
                                child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: snapshot.data!.wishlist!.bakers!.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      onTap: () {
                                        Get.bottomSheet(
                                          SizedBox(
                                            height: 300,
                                            child: BackerReview(
                                              name: snapshot.data!.wishlist!.bakers![index].name!,
                                              text: snapshot.data!.wishlist!.bakers![index].content!,
                                            ),
                                          ),
                                          backgroundColor: BaseColors.white,
                                          shape: AppConstants.bottomSheetShape,
                                        );
                                      },
                                      leading: CircleAvatar(
                                        backgroundImage: NetworkImage(snapshot.data!.wishlist!.bakers![index].userImage!),
                                      ),
                                      title: Text(snapshot.data!.wishlist!.bakers![index].name!),
                                      trailing: const Icon(Icons.navigate_next),
                                    );
                                  },
                                ),
                              ),
                              backgroundColor: BaseColors.white,
                              shape: AppConstants.bottomSheetShape,
                            );
                          },
                          children: [
                            for (int i = 0; i < snapshot.data!.wishlist!.bakers!.length; i++)
                              Positioned(
                                left: 20.0 * i,
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundImage: NetworkImage(snapshot.data!.wishlist!.bakers![i].userImage!),
                                ),
                              ),
                          ],
                        ),
                      const SizedBox(height: 30),
                      OccasionsDetailsCard(
                        days: daysBetween(dateStart, dateEnd).toString(),
                        percent: percent,
                        needed: snapshot.data!.wishlist!.total.toString(),
                        collected: snapshot.data!.wishlist!.collected.toString(),
                        isShown: true,
                      ),
                      // const Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it"),
                      GridView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        itemCount: snapshot.data!.wishlist!.products!.length,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.75,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 15,
                        ),
                        itemBuilder: (context, index) {
                          return WishListCard(
                            productId: snapshot.data!.wishlist!.products![index].id!,
                            image: "${ApiUrl.mainUrl}/${snapshot.data!.wishlist!.products![index].images![0]}",
                            title: snapshot.data!.wishlist!.products![index].quantity!,
                            price: snapshot.data!.wishlist!.products![index].initialPrice!.toString(),
                            isButtonsShown: false,
                            onTapView: () {},
                            onTapAdd: () {},
                            isAdded: true,
                          );
                        },
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text(snapshot.hasError.toString());
                } else {
                  return const Text(AppConstants.failedMessage);
                }
            }
          },
        ),
      ),
    );
  }
}
