// To parse this JSON data, do
//
//     final myOccasionsModel = myOccasionsModelFromJson(jsonString);

import 'dart:convert';

MyOccasionsModel myOccasionsModelFromJson(String str) => MyOccasionsModel.fromJson(json.decode(str));

String myOccasionsModelToJson(MyOccasionsModel data) => json.encode(data.toJson());

class MyOccasionsModel {
  MyOccasionsModel({
    this.status,
    this.errNum,
    this.msg,
    this.wishlists,
  });

  bool? status;
  int? errNum;
  String? msg;
  List<Wishlist>? wishlists;

  factory MyOccasionsModel.fromJson(Map<String, dynamic> json) => MyOccasionsModel(
        status: json["status"],
        errNum: json["errNum"],
        msg: json["msg"],
        wishlists: List<Wishlist>.from(json["wishlists"].map((x) => Wishlist.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "errNum": errNum,
        "msg": msg,
        "wishlists": List<dynamic>.from(wishlists!.map((x) => x.toJson())),
      };
}

class Wishlist {
  Wishlist({
    this.id,
    this.name,
    this.start,
    this.end,
    this.image,
    this.bakers,
    this.products,
    this.total,
    this.collected,
  });

  int? id;
  String? name;
  DateTime? start;
  DateTime? end;
  String? image;
  List<dynamic>? bakers;
  List<dynamic>? products;
  int? total;
  int? collected;

  factory Wishlist.fromJson(Map<String, dynamic> json) => Wishlist(
        id: json["id"],
        name: json["name"],
        start: DateTime.parse(json["start"]),
        end: DateTime.parse(json["end"]),
        image: json["image"],
        bakers: List<dynamic>.from(json["bakers"].map((x) => x)),
        products: List<dynamic>.from(json["products"].map((x) => x)),
        total: json["total"],
        collected: json["collected"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "start": "${start!.year.toString().padLeft(4, '0')}-${start!.month.toString().padLeft(2, '0')}-${start!.day.toString().padLeft(2, '0')}",
        "end": "${end!.year.toString().padLeft(4, '0')}-${end!.month.toString().padLeft(2, '0')}-${end!.day.toString().padLeft(2, '0')}",
        "image": image,
        "bakers": List<dynamic>.from(bakers!.map((x) => x)),
        "products": List<dynamic>.from(products!.map((x) => x)),
        "total": total,
        "collected": collected,
      };
}
