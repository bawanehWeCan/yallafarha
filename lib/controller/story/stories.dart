import 'package:get/get.dart';
import 'package:yallah_farha/model/story/stories_model.dart';
import 'package:yallah_farha/network/story/stories.dart';

class StoriesCtrl extends GetxController {
  static StoriesCtrl get find => Get.find();

  StoriesModel? storiesModel;
  late Future<StoriesModel?> cartData;

  final stories = <Story>[].obs;

  Future<StoriesModel?> fetchApiData() async {
    storiesModel = await StoriesApi.data();
    stories.addAll(storiesModel!.story!);
    update();
    return storiesModel;
  }

  @override
  void onInit() {
    super.onInit();
    cartData = fetchApiData();
  }
}
