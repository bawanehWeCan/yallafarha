import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:yallah_farha/model/profile/update_user_image_model.dart';
import 'package:yallah_farha/utils/api_url.dart';

class UpdateImageApi {
  static Future<UpdateUserImageModel?> dataWithImage({
    required int id,
    required File? image,
  }) async {
    try {
      MultipartFile? multipartFile;
      if (image != null) {
        var stream = http.ByteStream(image.openRead());
        var length = await image.length();
        multipartFile = http.MultipartFile("image", stream, length,
            filename: basename(image.path));
      }
      var uri = Uri.parse("${ApiUrl.mainUrl}${ApiUrl.updateUserImage}$id");
      var request = http.MultipartRequest("POST", uri);
      var headers = {
        'Content-Type': 'application/json',
      };
      request.headers.addAll(headers);
      if (image != null) request.files.add(multipartFile!);
      var response = await request.send();
      if (response.statusCode == 200) {
        var responseData = await response.stream.toBytes();
        var responseString = String.fromCharCodes(responseData);
        var jsonData = jsonDecode(responseString);
        UpdateUserImageModel updateUserImageModel =
        UpdateUserImageModel.fromJson(jsonData);
        return updateUserImageModel;
      } else {
        throw "UpdateUserImage Error";
      }
    } catch (e) {
      log("UpdateUserImage Error $e");
      return null;
    }
  }
}
