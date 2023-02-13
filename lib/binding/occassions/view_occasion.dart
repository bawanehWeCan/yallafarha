import 'package:get/get.dart';
import 'package:yallah_farha/controller/occasions/view_occasion.dart';

class ViewOccasionBinding implements Bindings {
  final int id;
  ViewOccasionBinding({required this.id});

  @override
  void dependencies() {
    Get.lazyPut(() => ViewOccasionController(id: id));
  }
}
