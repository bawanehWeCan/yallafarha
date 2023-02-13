// To parse this JSON data, do
//
//     final becomeSupplierModel = becomeSupplierModelFromJson(jsonString);

import 'dart:convert';

BecomeSupplierModel becomeSupplierModelFromJson(String str) => BecomeSupplierModel.fromJson(json.decode(str));

String becomeSupplierModelToJson(BecomeSupplierModel data) => json.encode(data.toJson());

class BecomeSupplierModel {
  BecomeSupplierModel({
    this.status,
    this.errNum,
    this.msg,
  });

  bool? status;
  int? errNum;
  String? msg;

  factory BecomeSupplierModel.fromJson(Map<String, dynamic> json) => BecomeSupplierModel(
        status: json["status"],
        errNum: json["errNum"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "errNum": errNum,
        "msg": msg,
      };
}
