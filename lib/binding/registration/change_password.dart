import 'package:get/get.dart';
import 'package:yallah_farha/controller/registration/change_password_ctrl.dart';

class ChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChangePasswordCtrl());
  }
}
