class OccasionCategoriesModel {
  OccasionCategoriesModel({
    this.status,
    this.errNum,
    this.msg,
    this.categories,
  });

  OccasionCategoriesModel.fromJson(dynamic json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories?.add(occasionCategories.fromJson(v));
      });
    }
  }
  bool? status;
  int? errNum;
  String? msg;
  List<occasionCategories>? categories;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['errNum'] = errNum;
    map['msg'] = msg;
    if (categories != null) {
      map['categories'] = categories?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class occasionCategories {
  occasionCategories({
    this.id,
    this.name,
    this.image,
  });

  occasionCategories.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
  int? id;
  String? name;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    return map;
  }
}
