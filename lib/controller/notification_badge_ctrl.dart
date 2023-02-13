import 'package:get/get.dart';
import 'package:yallah_farha/utils/shared_prefrences.dart';

class NotificationBadgeCtrl extends GetxController {
  static NotificationBadgeCtrl get find => Get.find();

  final isShown = false.obs;

  void toggle() {
    if (MySharedPreferences.isLogIn) {
      isShown.value = true;
    } else {
      isShown.value = false;
    }
    update();
  }

  @override
  void onInit() {
    isShown.value = MySharedPreferences.isLogIn;
    super.onInit();
  }
}
