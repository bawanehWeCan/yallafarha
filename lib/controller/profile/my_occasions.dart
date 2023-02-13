import 'package:get/get.dart';
import 'package:yallah_farha/model/profile/my_occasion_model.dart';
import 'package:yallah_farha/network/profile/my_occasions.dart';

class MyOccasionsController extends GetxController {
  static MyOccasionsController get find => Get.find();

  MyOccasionsModel? myOccasionsModel;
  late Future<MyOccasionsModel?> myOccasionsData;

  Future<MyOccasionsModel?> fetchMyOccasions() async {
    myOccasionsModel = await MyOccasionsApi.data();
    return myOccasionsModel;
  }

  @override
  void onInit() {
    myOccasionsData = fetchMyOccasions();
    super.onInit();
  }
}
