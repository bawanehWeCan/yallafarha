import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:yallah_farha/binding/initial_binding.dart';
import 'package:yallah_farha/binding/occassions/view_occasion.dart';
import 'package:yallah_farha/ui/screens/notifications/share_review_screen.dart';
import 'package:yallah_farha/ui/screens/occasions/view_occasion.dart';
import 'package:yallah_farha/ui/widgets/custom_rounded_button.dart';
import 'package:yallah_farha/ui/widgets/notifications_badge.dart';
import 'package:yallah_farha/ui/widgets/share_review_dialog.dart';
import 'package:yallah_farha/utils/base/colors.dart';
import 'package:yallah_farha/utils/base/images.dart';
import 'package:yallah_farha/utils/shared_prefrences.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  static String _getTime(Timestamp time) {
    DateTime date = DateTime.parse(time.toDate().toString());
    var formattedDate = DateFormat('dd-MMM-yyy').format(date);
    return formattedDate;
  }

  void _showDialog() {
    Get.defaultDialog(
      titlePadding: EdgeInsets.zero,
      titleStyle: const TextStyle(fontSize: 0),
      title: "",
      radius: 15,
      content: const ShareReviewDialog(),
      actions: <Widget>[
        CustomRoundedButton(
          onPressed: () {
            Get.back();
            Get.to(
              () => const ShareReviewScreen(),
              binding: ShareReviewBinding(),
            );
          },
          label: "Share".tr,
          heroTag: "8uddd",
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    log("userId:: ${MySharedPreferences.userId}");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Notifications".tr),
        backgroundColor: BaseColors.purple3B7,
        actions: const [
          NotificationsBadge(),
        ],
      ),
      body: FirestoreListView<Map<String, dynamic>>(
        query: FirebaseFirestore.instance.collection('notifications').where('user_id', isEqualTo: MySharedPreferences.userId).orderBy('time', descending: true),
        loadingBuilder: (context) => const Center(child: CircularProgressIndicator()),
        errorBuilder: (context, error, stackTrace) => Center(
          child: Text("$error"),
        ),
        itemBuilder: (context, snapshot) {
          Map<String, dynamic> data = snapshot.data();

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0),
            child: ListTile(
              tileColor: data['isOpen'] ? null : Colors.black12,
              onTap: () {
                FirebaseFirestore.instance.collection('notifications').doc(snapshot.id).update({
                  'isOpen': true,
                });
                if (data['route']['type'] == 'review') {
                  _showDialog();
                }
                if (data['route']['type'] == 'occasion') {
                  Get.to(
                    () => const ViewOccasionScreen(),
                    binding: ViewOccasionBinding(
                      id: data['route']['id'],
                    ),
                  );
                }
              },
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: BaseColors.purple3B7,
                backgroundImage: AssetImage(BaseImages.logo),
              ),
              title: Text("${data['title']}"),
              subtitle: Row(
                children: [
                  Text(data['body']),
                  const Spacer(),
                  Text(_getTime(data['time'])),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
