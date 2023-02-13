// To parse this JSON data, do
//
//     final addToCartModel = addToCartModelFromJson(jsonString);

import 'dart:convert';

AddToCartModel addToCartModelFromJson(String str) => AddToCartModel.fromJson(json.decode(str));

String addToCartModelToJson(AddToCartModel data) => json.encode(data.toJson());

class AddToCartModel {
  AddToCartModel({
    this.status,
    this.errNum,
    this.msg,
    this.products,
  });

  bool? status;
  int? errNum;
  String? msg;
  List<Product>? products;

  factory AddToCartModel.fromJson(Map<String, dynamic> json) => AddToCartModel(
        status: json["status"],
        errNum: json["errNum"],
        msg: json["msg"],
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "errNum": errNum,
        "msg": msg,
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    this.id,
    this.name,
    this.description,
    this.images,
    this.sku,
    this.categoryId,
    this.brandId,
    this.price,
  });

  int? id;
  String? name;
  String? description;
  List<String>? images;
  String? sku;
  int? categoryId;
  int? brandId;
  int? price;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        images: List<String>.from(json["images"].map((x) => x)),
        sku: json["sku"],
        categoryId: json["category_id"],
        brandId: json["brand_id"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "images": List<dynamic>.from(images!.map((x) => x)),
        "sku": sku,
        "category_id": categoryId,
        "brand_id": brandId,
        "price": price,
      };
}
