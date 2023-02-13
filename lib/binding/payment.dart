import 'package:get/get.dart';
import 'package:yallah_farha/controller/payments/payment.dart';

class PaymentBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentController());
  }
}
