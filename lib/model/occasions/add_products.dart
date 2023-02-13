// To parse this JSON data, do
//
//     final addProductsModel = addProductsModelFromJson(jsonString);

import 'dart:convert';

AddProductsModel addProductsModelFromJson(String str) => AddProductsModel.fromJson(json.decode(str));

String addProductsModelToJson(AddProductsModel data) => json.encode(data.toJson());

class AddProductsModel {
  AddProductsModel({
    this.status,
    this.errNum,
    this.msg,
    this.wishlist,
  });

  bool? status;
  int? errNum;
  String? msg;
  Wishlist? wishlist;

  factory AddProductsModel.fromJson(Map<String, dynamic> json) => AddProductsModel(
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
    this.products,
  });

  int? id;
  String? name;
  String? start;
  String? end;
  String? image;
  List<Product>? products;

  factory Wishlist.fromJson(Map<String, dynamic> json) => Wishlist(
        id: json["id"],
        name: json["name"],
        start: json["start"],
        end: json["end"],
        image: json["image"],
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "start": start,
        "end": end,
        "image": image,
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
