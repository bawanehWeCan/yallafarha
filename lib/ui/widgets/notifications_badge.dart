import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/controller/notification_badge_ctrl.dart';
import 'package:yallah_farha/ui/screens/notifications/notifications.dart';
import 'package:yallah_farha/utils/shared_prefrences.dart';

class NotificationsBadge extends StatelessWidget {
  const NotificationsBadge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationBadgeCtrl>(
      init: NotificationBadgeCtrl(),
      builder: (controller) {
        if (controller.isShown.value) {
          return Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              IconButton(
                onPressed: () {
                  Get.to(() => const NotificationsScreen());
                },
                icon: const Icon(
                  FontAwesomeIcons.solidBell,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 5, 0),
                child: CircleAvatar(
                  backgroundColor: const Color(0xFFEF2098),
                  radius: 10,
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance.collection('notifications').where('user_id', isEqualTo: MySharedPreferences.userId).where('isOpen', isEqualTo: false).snapshots(),
                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return const Text('-');
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Text("-");
                      }

                      return Center(
                        child: FittedBox(
                          child: Text(
                            snapshot.data!.docs.length.toString(),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
