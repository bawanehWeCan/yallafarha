import 'package:get/get.dart';
import 'package:yallah_farha/tranlation/arabic.dart';
import 'package:yallah_farha/tranlation/english.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en": en,
        "ar": ar,
      };
}
