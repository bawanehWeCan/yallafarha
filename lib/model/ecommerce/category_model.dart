// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  CategoryModel({
    required this.status,
    required this.errNum,
    required this.msg,
    required this.category,
  });

  bool status;
  int errNum;
  String msg;
  Category category;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        status: json["status"],
        errNum: json["errNum"],
        msg: json["msg"],
        category: Category.fromJson(json["category"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "errNum": errNum,
        "msg": msg,
        "category": category.toJson(),
      };
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.products,
  });

  int id;
  String name;
  String image;
  List<Product> products;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.images,
    this.sku,
    required this.categoryId,
    required this.brandId,
    required this.price,
  });

  int id;
  String name;
  String description;
  List<String> images;
  dynamic sku;
  int categoryId;
  int brandId;
  int price;

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
        "images": List<dynamic>.from(images.map((x) => x)),
        "sku": sku,
        "category_id": categoryId,
        "brand_id": brandId,
        "price": price,
      };
}
