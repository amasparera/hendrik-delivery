class LupaPasswordRes {
  final String msg;
  final DateTime expired;

  LupaPasswordRes({required this.msg, required this.expired});

  factory LupaPasswordRes.fromJoson(Map<String, dynamic> json) {
    return LupaPasswordRes(
        msg: json["msg"], expired: DateTime.parse(json["expired"]));
  }
}
