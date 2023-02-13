import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class BaseNavBarCtrl extends GetxController {
  static BaseNavBarCtrl get find => Get.find();

  late PersistentTabController navBarController;
}
