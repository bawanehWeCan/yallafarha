import 'package:get/get.dart';
import 'package:yallah_farha/controller/occasions/create_occasion.dart';
import 'package:yallah_farha/controller/occasions/occasion_categories.dart';

class AddNewOccasionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateOccasionController());
  }
}

class OccasionCategoriesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OccasionCategoriesController());
  }
}
