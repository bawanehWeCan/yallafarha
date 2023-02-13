import 'dart:developer';
import 'dart:io';

import "package:async/async.dart";
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:yallah_farha/utils/api_url.dart';

class ShareReviewApi {
  static Future<http.StreamedResponse?> data({
    required File image,
    required File video,
    required double points,
    required String short,
    required String name,
    required String content,
    required String email,
    required int occasionId,
  }) async {
    try {
      var uri = Uri.parse("${ApiUrl.mainUrl}${ApiUrl.shareReview}");
      var request = http.MultipartRequest("POST", uri);

      //image
      if (image.path.isNotEmpty) {
        // ignore: deprecated_member_use
        var imageStream = http.ByteStream(DelegatingStream.typed(image.openRead()));
        var imageLength = await image.length();
        var imageFile = http.MultipartFile("image", imageStream, imageLength, filename: basename(image.path));
        request.files.add(imageFile);
      }

      // video
      if (video.path.isNotEmpty) {
        // ignore: deprecated_member_use
        var videoStream = http.ByteStream(DelegatingStream.typed(video.openRead()));
        var videoLength = await video.length();
        var videoFile = http.MultipartFile("file", videoStream, videoLength, filename: basename(video.path));
        request.files.add(videoFile);
      }

      request.fields['short'] = short;
      request.fields['point'] = '$points';
      request.fields['content'] = content;
      request.fields['name'] = name;
      request.fields['email'] = email;
      request.fields['occasion_id'] = "$occasionId";

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
