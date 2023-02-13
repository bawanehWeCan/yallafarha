// To parse this JSON data, do
//
//     final storiesModel = storiesModelFromJson(jsonString);

import 'dart:convert';

StoriesModel storiesModelFromJson(String str) => StoriesModel.fromJson(json.decode(str));

String storiesModelToJson(StoriesModel data) => json.encode(data.toJson());

class StoriesModel {
  StoriesModel({
    this.status,
    this.errNum,
    this.msg,
    this.story,
  });

  bool? status;
  int? errNum;
  String? msg;
  List<Story>? story;

  factory StoriesModel.fromJson(Map<String, dynamic> json) => StoriesModel(
        status: json["status"],
        errNum: json["errNum"],
        msg: json["msg"],
        story: List<Story>.from(json["story"].map((x) => Story.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "errNum": errNum,
        "msg": msg,
        "story": List<dynamic>.from(story!.map((x) => x.toJson())),
      };
}

class Story {
  Story({
    this.id,
    this.point,
    this.short,
    this.content,
    this.name,
    this.email,
    this.image,
    this.file,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? point;
  String? short;
  String? content;
  String? name;
  String? email;
  String? image;
  dynamic file;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Story.fromJson(Map<String, dynamic> json) => Story(
        id: json["id"],
        point: json["point"],
        short: json["short"],
        content: json["content"],
        name: json["name"],
        email: json["email"],
        image: json["image"],
        file: json["file"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "point": point,
        "short": short,
        "content": content,
        "name": name,
        "email": email,
        "image": image,
        "file": file,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
