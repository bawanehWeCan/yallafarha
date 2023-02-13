import 'package:get/get.dart';
import 'package:yallah_farha/controller/registration/check_code_by_id_ctrl.dart';

class CheckCodeByIdBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CheckCodeByIdCtrl());
  }
}
