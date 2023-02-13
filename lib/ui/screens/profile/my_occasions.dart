import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:yallah_farha/binding/occassions/view_occasion.dart';
import 'package:yallah_farha/controller/profile/my_occasions.dart';
import 'package:yallah_farha/model/profile/my_occasion_model.dart';
import 'package:yallah_farha/ui/screens/occasions/view_occasion.dart';
import 'package:yallah_farha/ui/widgets/base_app_bar.dart';
import 'package:yallah_farha/ui/widgets/open_occasion_box.dart';
import 'package:yallah_farha/utils/api_url.dart';
import 'package:yallah_farha/utils/app_constants.dart';
import 'package:yallah_farha/utils/base/images.dart';
import 'package:yallah_farha/utils/base/text_style.dart';
import 'package:yallah_farha/utils/shared_prefrences.dart';

class MyOccasionsScreen extends StatelessWidget {
  const MyOccasionsScreen({Key? key}) : super(key: key);

  static String _getPercent(int collected, int total) {
    var result = (collected / total).toString();
    if (result == "Infinity" || result == "NaN") {
      return "0";
    } else {
      return result;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MySharedPreferences.profilePic.isEmpty
                ? CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage(BaseImages.placeHolder),
                  )
                : CircleAvatar(
                    radius: 100,
                    backgroundImage: NetworkImage(
                      MySharedPreferences.profilePic,
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text(
                MySharedPreferences.fullName,
                style: BaseTextStyle.black20SemiBold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 30),
              child: Text(
                "My Occasions".tr,
                style: BaseTextStyle.black20UltraLight,
              ),
            ),
            FutureBuilder<MyOccasionsModel?>(
              future: MyOccasionsController.find.myOccasionsData,
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const Center(child: CircularProgressIndicator());
                  case ConnectionState.done:
                  default:
                    if (snapshot.hasData) {
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          print("image:: ${snapshot.data!.wishlists![index].image!}");
                          return OpenOccasionBox(
                            title: snapshot.data!.wishlists![index].name!,
                            //TODO: not working!
                            //TODO: date format fix
                            image: "${ApiUrl.mainUrl}/${snapshot.data!.wishlists![index].image!}",
                            start: DateFormat('yyyy-MM-dd').format(snapshot.data!.wishlists![index].start!),
                            end: DateFormat('yyyy-MM-dd').format(snapshot.data!.wishlists![index].end!),
                            percent: _getPercent(snapshot.data!.wishlists![index].collected!, snapshot.data!.wishlists![index].total!),
                            onPressed: () {
                              print("id:: ${snapshot.data!.wishlists![index].id!}");
                              Get.to(
                                () => const ViewOccasionScreen(),
                                binding: ViewOccasionBinding(
                                  id: snapshot.data!.wishlists![index].id!,
                                ),
                              );
                            },
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return const Text(AppConstants.failedMessage);
                    } else {
                      return const Text(AppConstants.failedMessage);
                    }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
