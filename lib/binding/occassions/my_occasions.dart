import 'package:get/get.dart';
import 'package:yallah_farha/controller/profile/my_occasions.dart';

class MyOccasionsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyOccasionsController());
  }
}
