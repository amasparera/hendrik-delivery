class UserModel {
  String? courier;
  String? employeeNumber;
  String? name;
  String? phoneNumber;
  String? email;
  String? photoProfile;

  UserModel(
      {this.courier,
      this.employeeNumber,
      this.name,
      this.phoneNumber,
      this.email,
      this.photoProfile});

  UserModel.fromJson(Map<String, dynamic> json) {
    courier = json['courier'];
    employeeNumber = json['employee_number'];
    name = json['name'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    photoProfile = json['photo_profile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['courier'] = courier;
    data['employee_number'] = employeeNumber;
    data['name'] = name;
    data['phone_number'] = phoneNumber;
    data['email'] = email;
    data['photo_profile'] = photoProfile;
    return data;
  }
}
