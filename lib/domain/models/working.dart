class Working {
  String? officeBoy;
  String? workingStatus;
  String? name;

  Working({this.officeBoy, this.workingStatus, this.name});

  Working.fromJson(Map<String, dynamic> json) {
    officeBoy = json['office_boy'];
    workingStatus = json['working_status'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['office_boy'] = officeBoy;
    data['working_status'] = workingStatus;
    data['name'] = name;
    return data;
  }
}
