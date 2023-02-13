import 'package:get/get.dart';

class PaymentController extends GetxController {
  late RxBool isOpen;
  final selectedTileIndex = Rxn<int>();

  @override
  void onInit() {
    super.onInit();
    isOpen = false.obs;
  }
}
