class ProductsModel {
  ProductsModel({
    this.status,
    this.errNum,
    this.msg,
    this.products,
  });

  ProductsModel.fromJson(dynamic json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(ProductsModelkk.fromJson(v));
      });
    }
  }
  bool? status;
  int? errNum;
  String? msg;
  List<ProductsModelkk>? products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['errNum'] = errNum;
    map['msg'] = msg;
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class ProductsModelkk {
  ProductsModelkk({
    this.id,
    this.name,
    this.description,
    this.images,
    this.sku,
    this.categoryId,
    this.brandId,
    this.price,
  });

  ProductsModelkk.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    sku = json['sku'];
    categoryId = json['category_id'];
    brandId = json['brand_id'];
    price = json['price'];
  }
  int? id;
  String? name;
  dynamic description;
  List<String>? images;
  String? sku;
  int? categoryId;
  int? brandId;
  int? price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['images'] = images;
    map['sku'] = sku;
    map['category_id'] = categoryId;
    map['brand_id'] = brandId;
    map['price'] = price;
    return map;
  }
}
