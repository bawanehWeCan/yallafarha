import 'package:yallah_farha/model/home/slider_model.dart';
import 'package:yallah_farha/network/home/slider.dart';

class SliderController {
  static SliderModel? sliderModel;
  static late Future<SliderModel?> sliderData;

  static Future<SliderModel?> fetchSliderData() async {
    sliderModel = await SliderApi.data();
    return sliderModel;
  }
}
