import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:yallah_farha/binding/occassions/view_occasion.dart';
import 'package:yallah_farha/main.dart';
import 'package:yallah_farha/ui/screens/notifications/share_review_screen.dart';
import 'package:yallah_farha/ui/screens/occasions/view_occasion.dart';

class NotificationsService {
  static final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static void initialize() {
    const initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings('@drawable/ic_stat_ac_unit'),
      iOS: IOSInitializationSettings(
        requestSoundPermission: false,
        requestBadgePermission: false,
        requestAlertPermission: false,
      ),
    );
    _flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: (message) {
      if (message != null && notificationsMap.isNotEmpty) {
        log("onSelectNotification:: $message");
        final data = notificationsMap;
        final route = data["route"];
        final id = data["id"];
        log("route:: $route");
        log("id:: $id");
        if (route == "occasion") {
          Get.to(
            () => const ViewOccasionScreen(),
            binding: ViewOccasionBinding(
              id: id,
            ),
          );
        } else if (route == "review") {
          Get.to(() => const ShareReviewScreen());
        }
      }
    });
  }

  //for notifications in foreground
  static void display(RemoteMessage message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      const AndroidNotificationChannel channel = AndroidNotificationChannel(
        'bahaachannel', // id
        'bahaa channel', // title
        description: 'This channel is used for important notifications.',
        importance: Importance.max,
        playSound: true,
      );

      await _flutterLocalNotificationsPlugin.show(
        id,
        message.notification!.title,
        message.notification!.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            importance: Importance.max,
            playSound: true,
            icon: '@drawable/ic_stat_ac_unit',
          ),
          iOS: const IOSNotificationDetails(),
        ),
        payload: message.data["route"],
      );
    } on Exception catch (e) {
      log("Exception:: $e");
    }
  }
}
