import 'package:get/get.dart';
import 'package:yallah_farha/controller/registration/check_code_ctrl.dart';

class CheckCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CheckCodeCtrl());
  }
}
