import 'package:get/get.dart';
import 'package:yallah_farha/model/occasions/view_occasion_model.dart';
import 'package:yallah_farha/network/occasions/view_occasion.dart';

class ViewOccasionController extends GetxController {
  final int id;
  ViewOccasionController({required this.id});

  static ViewOccasionController get find => Get.find();

  ViewOccasionModel? viewOccasionModel;
  late Future<ViewOccasionModel?> viewOccasionData;

  Future<ViewOccasionModel?> fetchViewOccasion(int id) async {
    viewOccasionModel = await ViewOccasionApi.data(id);
    return viewOccasionModel;
  }

  @override
  void onInit() {
    viewOccasionData = fetchViewOccasion(id);
    super.onInit();
  }
}
