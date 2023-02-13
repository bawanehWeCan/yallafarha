import 'dart:convert';

class UpdateUserImageModel {
  UpdateUserImageModel({
    this.status,
    this.code,
    this.msg,
    this.user,
  });

  bool? status;
  int? code;
  String? msg;
  User? user;

  factory UpdateUserImageModel.fromRawJson(String str) => UpdateUserImageModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UpdateUserImageModel.fromJson(Map<String, dynamic> json) => UpdateUserImageModel(
    status: json["status"],
    code: json["code"],
    msg: json["msg"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "msg": msg,
    "user": user?.toJson(),
  };
}

class User {
  User({
    this.id,
    this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.firstName,
    this.lastName,
    this.username,
    this.avatarId,
    this.superUser,
    this.manageSupers,
    this.permissions,
    this.lastLogin,
    this.stripeId,
    this.pmType,
    this.pmLastFour,
    this.trialEndsAt,
    this.otp,
    this.phone,
    this.token,
    this.image,
  });

  int? id;
  String? email;
  dynamic emailVerifiedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? firstName;
  String? lastName;
  String? username;
  dynamic avatarId;
  int? superUser;
  int? manageSupers;
  dynamic permissions;
  dynamic lastLogin;
  dynamic stripeId;
  dynamic pmType;
  dynamic pmLastFour;
  dynamic trialEndsAt;
  String? otp;
  dynamic phone;
  String? token;
  String? image;

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    firstName: json["first_name"],
    lastName: json["last_name"],
    username: json["username"],
    avatarId: json["avatar_id"],
    superUser: json["super_user"],
    manageSupers: json["manage_supers"],
    permissions: json["permissions"],
    lastLogin: json["last_login"],
    stripeId: json["stripe_id"],
    pmType: json["pm_type"],
    pmLastFour: json["pm_last_four"],
    trialEndsAt: json["trial_ends_at"],
    otp: json["otp"],
    phone: json["phone"],
    token: json["token"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "first_name": firstName,
    "last_name": lastName,
    "username": username,
    "avatar_id": avatarId,
    "super_user": superUser,
    "manage_supers": manageSupers,
    "permissions": permissions,
    "last_login": lastLogin,
    "stripe_id": stripeId,
    "pm_type": pmType,
    "pm_last_four": pmLastFour,
    "trial_ends_at": trialEndsAt,
    "otp": otp,
    "phone": phone,
    "token": token,
    "image": image,
  };
}
