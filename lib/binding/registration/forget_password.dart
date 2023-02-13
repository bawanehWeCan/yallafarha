import 'package:get/get.dart';
import 'package:yallah_farha/controller/registration/forget_password_ctrl.dart';

class ForgetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgetPasswordCtrl());
  }
}
