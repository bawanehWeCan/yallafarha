// To parse this JSON data, do
//
//     final viewOccasionModel = viewOccasionModelFromJson(jsonString);

import 'dart:convert';

ViewOccasionModel viewOccasionModelFromJson(String str) => ViewOccasionModel.fromJson(json.decode(str));

String viewOccasionModelToJson(ViewOccasionModel data) => json.encode(data.toJson());

class ViewOccasionModel {
  ViewOccasionModel({
    this.status,
    this.errNum,
    this.msg,
    this.wishlist,
  });

  bool? status;
  int? errNum;
  String? msg;
  Wishlist? wishlist;

  factory ViewOccasionModel.fromJson(Map<String, dynamic> json) => ViewOccasionModel(
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
    this.bakers,
    this.products,
    this.total,
    this.collected,
  });

  int? id;
  String? name;
  String? start;
  String? end;
  String? image;
  List<Baker>? bakers;
  List<dynamic>? products;
  double? total;
  double? collected;

  factory Wishlist.fromJson(Map<String, dynamic> json) => Wishlist(
        id: json["id"],
        name: json["name"],
        start: json["start"].toString(),
        end: json["end"].toString(),
        image: json["image"],
        bakers: List<Baker>.from(json["bakers"].map((x) => Baker.fromJson(x))),
        products: List<dynamic>.from(json["products"].map((x) => x)),
        total: double.parse(json["total"].toString()),
        collected: double.parse(json["collected"].toString()),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "start": start,
        "end": end,
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
