// To parse this JSON data, do
//
//     final zainCashStep2Model = zainCashStep2ModelFromJson(jsonString);

import 'dart:convert';

ZainCashStep2Model zainCashStep2ModelFromJson(String str) => ZainCashStep2Model.fromJson(json.decode(str));

String zainCashStep2ModelToJson(ZainCashStep2Model data) => json.encode(data.toJson());

class ZainCashStep2Model {
  ZainCashStep2Model({
    this.status,
    this.errNum,
    this.msg,
    this.wishlist,
  });

  bool? status;
  int? errNum;
  String? msg;
  Wishlist? wishlist;

  factory ZainCashStep2Model.fromJson(Map<String, dynamic> json) {
    return ZainCashStep2Model(
      status: json["status"],
      errNum: json["errNum"],
      msg: json["msg"],
      wishlist: Wishlist.fromJson(json["wishlist"]),
    );
  }

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
  List<Baker>? bakers;
  List<dynamic>? products;
  int? total;
  int? collected;

  factory Wishlist.fromJson(Map<String, dynamic> json) => Wishlist(
        id: json["id"],
        name: json["name"],
        start: DateTime.parse(json["start"]),
        end: DateTime.parse(json["end"]),
        image: json["image"],
        bakers: List<Baker>.from(json["bakers"].map((x) => Baker.fromJson(x))),
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
        "bakers": List<dynamic>.from(bakers!.map((x) => x.toJson())),
        "products": List<dynamic>.from(products!.map((x) => x)),
        "total": total,
        "collected": collected,
      };
}

class Baker {
  Baker({
    this.name,
    this.content,
    this.amount,
    this.user,
    this.userImage,
  });

  String? name;
  String? content;
  int? amount;
  String? user;
  String? userImage;

  factory Baker.fromJson(Map<String, dynamic> json) => Baker(
        name: json["name"],
        content: json["content"],
        amount: json["amount"],
        user: json["user"],
        userImage: json["user_image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "content": content,
        "amount": amount,
        "user": user,
        "user_image": userImage,
      };
}
