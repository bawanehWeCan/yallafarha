// To parse this JSON data, do
//
//     final shareReviewStory = shareReviewStoryFromJson(jsonString);

import 'dart:convert';

ShareReviewModel shareReviewStoryFromJson(String str) => ShareReviewModel.fromJson(json.decode(str));

String shareReviewStoryToJson(ShareReviewModel data) => json.encode(data.toJson());

class ShareReviewModel {
  ShareReviewModel({
    this.status,
    this.errNum,
    this.msg,
  });

  bool? status;
  int? errNum;
  String? msg;

  factory ShareReviewModel.fromJson(Map<String, dynamic> json) => ShareReviewModel(
        status: json["status"],
        errNum: json["errNum"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "errNum": errNum,
        "msg": msg,
      };
}
