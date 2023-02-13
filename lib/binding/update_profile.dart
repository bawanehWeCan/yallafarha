import 'package:get/get.dart';
import 'package:yallah_farha/controller/profile/update_user_ctrl.dart';

class UpdateUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UpdateUserCtrl());
  }
}
