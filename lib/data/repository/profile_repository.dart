import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../domain/models/user_model.dart';

abstract class ProfileRepository {
  Future<Either<String, UserModel>> getProfile();
  Future<Either<String, String>> deleteProfile();

  Future<Either<String, String>> updateProfile(
      String name, String address, String phoneNumber,
      {File? photo});
}
