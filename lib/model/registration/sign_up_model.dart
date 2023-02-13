// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'dart:convert';

SignUpModel signUpModelFromJson(String str) => SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
  SignUpModel({
    this.status,
    this.errNum,
    this.msg,
    this.data,
  });

  bool? status;
  int? errNum;
  String? msg;
  Data? data;

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
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
    this.token,
    this.user,
  });

  String? token;
  dynamic user;

  factory Data.fromJson(Map<String, dynamic> json) {
    if (json["user"].runtimeType == List<dynamic>) {
      return Data(
        token: json["token"],
        user: [],
      );
    } else {
      return Data(
        token: json["token"],
        user: User.fromJson(json["user"]),
      );
    }
  }

  Map<String, dynamic> toJson() => {
        "token": token,
        "user": user!.toJson(),
      };
}

class User {
  User({
    this.email,
    this.username,
    this.firstName,
    this.lastName,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  String? email;
  String? username;
  String? firstName;
  String? lastName;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json["email"],
      username: json["username"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      updatedAt: DateTime.parse(json["updated_at"]),
      createdAt: DateTime.parse(json["created_at"]),
      id: json["id"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "username": username,
      "first_name": firstName,
      "last_name": lastName,
      "updated_at": updatedAt!.toIso8601String(),
      "created_at": createdAt!.toIso8601String(),
      "id": id,
    };
  }
}
