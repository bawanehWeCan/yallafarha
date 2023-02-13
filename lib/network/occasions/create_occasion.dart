import 'dart:developer';
import 'dart:io';

import "package:async/async.dart";
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:yallah_farha/utils/api_url.dart';

class CreateOccasionApi {
  //TODO: add authorization to header
  static Future<http.StreamedResponse?> data({
    required File imageFile,
    required String name,
    required String description,
    required String start,
    required String end,
    required int categoryId,
  }) async {
    try {
      // ignore: deprecated_member_use
      var stream = http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
      var length = await imageFile.length();
      var uri = Uri.parse("${ApiUrl.mainUrl}${ApiUrl.createOccasion}");

      var request = http.MultipartRequest("POST", uri);

      var multipartFile = http.MultipartFile("image", stream, length, filename: basename(imageFile.path));

      request.files.add(multipartFile);
      request.fields['name'] = name;
      request.fields['start'] = start;
      request.fields['end'] = end;
      request.fields['descrption'] = description;
      request.fields['category_id'] = "$categoryId";

      var respond = await request.send();

      if (respond.statusCode == 200) {
        log("status:: Image Uploaded");
        return respond;
      } else {
        log("status:: Upload Failed");
        throw "Create Occasion Error";
      }
    } catch (e) {
      log("CreateOccasion Error $e");
      return null;
    }
  }
}
