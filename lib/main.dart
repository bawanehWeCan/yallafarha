import 'dart:async';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:flutter_localizations/flutter_localizations.dart' show GlobalCupertinoLocalizations, GlobalMaterialLocalizations, GlobalWidgetsLocalizations;
import 'package:get/get.dart';
import 'package:yallah_farha/binding/occassions/view_occasion.dart';
import 'package:yallah_farha/helper/notifications.dart';
import 'package:yallah_farha/helper/uni_links_helper.dart';
import 'package:yallah_farha/tranlation/translation.dart';
import 'package:yallah_farha/ui/screens/animated_gif_screen.dart';
import 'package:yallah_farha/ui/screens/notifications/share_review_screen.dart';
import 'package:yallah_farha/ui/screens/occasions/view_occasion.dart';
import 'package:yallah_farha/utils/material_theme.dart';
import 'package:yallah_farha/utils/shared_prefrences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

//TODO: firebase rules
//TODO: occasion background after create

Map<String, dynamic> notificationsMap = {};
final uniLinksHelper = UniLinksHelper();

Future<void> _onBackgroundMessage(RemoteMessage message) async {
  if (message.notification != null) {
    final data = message.notification;
    log("onBackgroundMessage:: ${message.data}");
    log("onBackgroundMessage:: ${data?.title}");
    log("onBackgroundMessage:: ${data?.body}");
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: const FirebaseOptions(
      //   apiKey: "XXX",
      //   appId: "XXX",
      //   messagingSenderId: "XXX",
      //   projectId: "XXX",
      // ),
      );
  await MySharedPreferences.init();
  await FirebaseMessaging.instance.getToken().then((value) async {
    MySharedPreferences.deviceToken = value!;
    log("deviceToken:: $value");
  });
  FirebaseMessaging.onBackgroundMessage(_onBackgroundMessage);
  if (MySharedPreferences.language.isEmpty) {
    MySharedPreferences.language = Get.deviceLocale!.languageCode;
  }
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    NotificationsService.initialize();

    FirebaseMessaging.instance.requestPermission().then((value) {});

    FirebaseMessaging.instance.getToken().then((token) {});

    FirebaseMessaging.instance.getAPNSToken().then((aPNStoken) {});

    //gives you the message on which user taps
    //and it opens the app from terminated state
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message?.notification != null && MySharedPreferences.accessToken.isNotEmpty && message!.data.isNotEmpty) {
        final data = message.notification;
        log(" :: ${message.data}");
        log("getInitialMessage:: ${data!.title}");
        log("getInitialMessage:: ${data.body}");
        final route = message.data["route"];
        final id = message.data["id"];
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

    //foreground
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        final data = message.notification;
        log("_data:: $data");
        log("onMessage:: ${message.data}");
        log("onMessage:: ${data?.title}");
        log("onMessage:: ${data?.body}");
        notificationsMap = message.data;
        log("onMessage:: $notificationsMap");
        NotificationsService.display(message);
      }
    });

    //background and not terminated
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      if (message.notification != null && MySharedPreferences.accessToken.isNotEmpty && message.data.isNotEmpty) {
        final data = message.notification;
        log("onMessageOpenedApp:: ${message.data}");
        log("onMessageOpenedApp:: ${data?.title}");
        log("onMessageOpenedApp:: ${data?.body}");
        final route = message.data["route"];
        final id = message.data["id"];
        log("_route:: $route");
        log("_dreamId:: $id");
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: EasyLoading.init(),
      translations: Translation(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ar', 'JO'),
      ],
      locale: Locale(MySharedPreferences.language),
      fallbackLocale: const Locale("en"),
      theme: AppThemeData().materialTheme,
      home: const AnimatedGifScreen(),
      // home: SharedOccasionScreen(),
    );
  }
}

//64
