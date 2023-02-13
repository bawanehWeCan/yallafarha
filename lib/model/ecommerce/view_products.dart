// To parse this JSON data, do
//
//     final viewProductModel = viewProductModelFromJson(jsonString);

import 'dart:convert';

ViewProductsModel viewProductModelFromJson(String str) => ViewProductsModel.fromJson(json.decode(str));

String viewProductModelToJson(ViewProductsModel data) => json.encode(data.toJson());

class ViewProductsModel {
  ViewProductsModel({
    this.status,
    this.errNum,
    this.msg,
    this.product,
  });

  bool? status;
  int? errNum;
  String? msg;
  Product? product;

  factory ViewProductsModel.fromJson(Map<String, dynamic> json) => ViewProductsModel(
        status: json["status"],
        errNum: json["errNum"],
        msg: json["msg"],
        product: Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "errNum": errNum,
        "msg": msg,
        "product": product!.toJson(),
      };
}

class Product {
  Product({
    this.id,
    this.name,
    this.description,
    this.images,
    this.price,
  });

  int? id;
  String? name;
  String? description;
  List<dynamic>? images;
  double? price;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        description: json["description"] ?? '',
        images: List<dynamic>.from(json["images"].map((x) => x)),
        price: double.parse(json["price"].toString()),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "images": List<dynamic>.from(images!.map((x) => x)),
        "price": price,
      };
}
