class UserModel {
  final String customer;
  final String name;
  final String email;
  final String address;
  final String phoneNumber;
  final String photoProfile;

  UserModel({
    required this.customer,
    required this.address,
    required this.phoneNumber,
    required this.photoProfile,
    required this.name,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
        customer: map["customer"],
        address: map["address"],
        phoneNumber: map["phone_number"],
        photoProfile: map["photo_profile"],
        name: map["name"],
        email: map["email"]);
  }
}
