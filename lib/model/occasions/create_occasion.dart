// To parse this JSON data, do
//
//     final createOccasionModel = createOccasionModelFromJson(jsonString);

import 'dart:convert';

CreateOccasionModel createOccasionModelFromJson(String str) => CreateOccasionModel.fromJson(json.decode(str));

String createOccasionModelToJson(CreateOccasionModel data) => json.encode(data.toJson());

class CreateOccasionModel {
  CreateOccasionModel({
    this.status,
    this.errNum,
    this.msg,
    this.wishlist,
  });

  bool? status;
  int? errNum;
  String? msg;
  Wishlist? wishlist;

  factory CreateOccasionModel.fromJson(Map<String, dynamic> json) => CreateOccasionModel(
        status: json["status"],
        errNum: json["errNum"],
        msg: json["msg"],
        wishlist: Wishlist.fromJson(json["wishlist"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "errNum": errNum,
        "msg": msg,
        "wishlist": wishlist!.toJson(),
      };
}

class Wishlist {
  Wishlist({
    this.id,
    this.name,
    this.start,
    this.end,
    this.image,
  });

  int? id;
  String? name;
  String? start;
  String? end;
  String? image;

  factory Wishlist.fromJson(Map<String, dynamic> json) => Wishlist(
        id: json["id"],
        name: json["name"],
        start: json["start"],
        end: json["end"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "start": start,
        "end": end,
        "image": image,
      };
}
