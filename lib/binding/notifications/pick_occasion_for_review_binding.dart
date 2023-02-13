import 'package:get/get.dart';
import 'package:yallah_farha/controller/story/pick_occasion_for_review_ctrl.dart';

class PickOccasionForReviewBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PickOccasionForReviewController());
  }
}
