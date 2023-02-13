class ZainCashStep1Model {
  ZainCashStep1Model({
    this.status,
    this.errNum,
    this.msg,
  });

  ZainCashStep1Model.fromJson(dynamic json) {
    status = json['status'];
    errNum = json['errNum'];
    msg = json['msg'];
  }
  bool? status;
  int? errNum;
  String? msg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['errNum'] = errNum;
    map['msg'] = msg;
    return map;
  }
}
