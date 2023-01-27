class Working {
  final String? canteen;
  final String? status;
  final String? name;

  Working({this.canteen, this.status, this.name});

  factory Working.fromjson(Map<String, dynamic> json) {
    return Working(
        canteen: json["canteen"],
        name: json["name"],
        status: json["working_status"]);
  }
}
