// To parse this JSON data, do
//
//     final makeOrderModel = makeOrderModelFromJson(jsonString);

import 'dart:convert';

MakeOrderModel makeOrderModelFromJson(String str) => MakeOrderModel.fromJson(json.decode(str));

String makeOrderModelToJson(MakeOrderModel data) => json.encode(data.toJson());

class MakeOrderModel {
  MakeOrderModel({
    required this.status,
    required this.errNum,
    required this.msg,
    required this.data,
  });

  bool? status;
  int? errNum;
  String? msg;
  Data? data;

  factory MakeOrderModel.fromJson(Map<String, dynamic> json) => MakeOrderModel(
        status: json["status"],
        errNum: json["errNum"],
        msg: json["msg"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "errNum": errNum,
        "msg": msg,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    required this.totalPrice,
    required this.totalQuantity,
    required this.products,
  });

  int? totalPrice;
  int? totalQuantity;
  List<ProductList>? products;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        totalPrice: json["total_price"],
        totalQuantity: json["total_quantity"],
        products: List<ProductList>.from(json["products"].map((x) => ProductList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total_price": totalPrice,
        "total_quantity": totalQuantity,
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}

class ProductList {
  ProductList({
    required this.id,
    required this.name,
    required this.image,
    required this.qty,
    required this.description,
    required this.price,
  });

  int? id;
  String? name;
  String? image;
  int? qty;
  String? description;
  double? price;

  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        qty: json["qty"],
        description: json["description"],
        price: double.parse(json["price"].toString()),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "qty": qty,
        "description": description,
        "price": price,
      };
}
