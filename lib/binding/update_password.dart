import 'package:get/get.dart';
import 'package:yallah_farha/controller/profile/update_password_ctrl.dart';

class UpdatePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UpdatePasswordCtrl());
  }
}
