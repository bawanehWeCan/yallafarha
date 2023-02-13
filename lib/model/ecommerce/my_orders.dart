class MyOrdersModel {
  MyOrdersModel({
    this.status,
    this.errNum,
    this.msg,
    this.orders,
  });

  MyOrdersModel.fromJson(dynamic json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
    if (json['orders'] != null) {
      orders = [];
      json['orders'].forEach((v) {
        orders?.add(Orders.fromJson(v));
      });
    }
  }
  bool? status;
  int? errNum;
  String? msg;
  List<Orders>? orders;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['errNum'] = errNum;
    map['msg'] = msg;
    if (orders != null) {
      map['orders'] = orders?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Orders {
  Orders({
    this.id,
    this.userId,
    this.shippingOption,
    this.shippingMethod,
    this.status,
    this.amount,
    this.taxAmount,
    this.shippingAmount,
    this.description,
    this.couponCode,
    this.discountAmount,
    this.subTotal,
    this.isConfirmed,
    this.discountDescription,
    this.isFinished,
    this.token,
    this.paymentId,
    this.createdAt,
    this.updatedAt,
  });

  Orders.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    shippingOption = json['shipping_option'];
    shippingMethod = json['shipping_method'];
    status = json['status'];
    amount = json['amount'];
    taxAmount = json['tax_amount'];
    shippingAmount = json['shipping_amount'];
    description = json['description'] ?? "";
    couponCode = json['coupon_code'];
    discountAmount = json['discount_amount'];
    subTotal = json['sub_total'];
    isConfirmed = json['is_confirmed'];
    discountDescription = json['discount_description'];
    isFinished = json['is_finished'];
    token = json['token'];
    paymentId = json['payment_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  int? userId;
  String? shippingOption;
  String? shippingMethod;
  String? status;
  String? amount;
  String? taxAmount;
  String? shippingAmount;
  dynamic description;
  dynamic couponCode;
  String? discountAmount;
  String? subTotal;
  int? isConfirmed;
  dynamic discountDescription;
  int? isFinished;
  String? token;
  int? paymentId;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['shipping_option'] = shippingOption;
    map['shipping_method'] = shippingMethod;
    map['status'] = status;
    map['amount'] = amount;
    map['tax_amount'] = taxAmount;
    map['shipping_amount'] = shippingAmount;
    map['description'] = description;
    map['coupon_code'] = couponCode;
    map['discount_amount'] = discountAmount;
    map['sub_total'] = subTotal;
    map['is_confirmed'] = isConfirmed;
    map['discount_description'] = discountDescription;
    map['is_finished'] = isFinished;
    map['token'] = token;
    map['payment_id'] = paymentId;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
