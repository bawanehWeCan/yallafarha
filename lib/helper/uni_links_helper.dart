import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:uni_links/uni_links.dart';
import 'package:yallah_farha/binding/occassions/view_occasion.dart';
import 'package:yallah_farha/ui/screens/occasions/shared_occasion_screen.dart';

class UniLinksHelper {
  StreamSubscription? sub;
  int? occasionId;
  bool isInitialized = false;

  Future<void> handleTerminatedState(BuildContext context) async {
    isInitialized = true;
    try {
      Uri? uri = await getInitialUri();
      if (uri == null) {
        occasionId = null;
      } else {
        log("link:: Background $uri");
        log("occasionId:: ${uri.queryParameters['id']}");
        occasionId = int.parse(uri.queryParameters['id'].toString());
        Get.to(const SharedOccasionScreen(), binding: ViewOccasionBinding(id: occasionId!));
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => const ViewOccasionScreen()),
        // );
      }
    } on PlatformException {
      log("uniLinkError:: Ter error");
    }
  }

  void handleBackgroundState(BuildContext context) {
    isInitialized = true;
    sub = uriLinkStream.listen(
      (Uri? uri) {
        if (uri == null) {
          occasionId = null;
        } else {
          log("link:: Background $uri");
          log("occasionId:: Background ${uri.queryParameters['id']}");
          occasionId = int.parse(uri.queryParameters['id'].toString());
          Get.to(const SharedOccasionScreen(), binding: ViewOccasionBinding(id: occasionId!));
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => const ViewOccasionScreen()),
          // );
        }
      },
      onError: (err) {
        log("uniLinkError:: Background $err");
      },
    );
  }
}
