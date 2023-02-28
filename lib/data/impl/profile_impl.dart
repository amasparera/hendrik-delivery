import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart';

import '../../const/api_app.dart';
import '../../const/local_data.dart';
import '../../domain/models/user_model.dart';
import '../repository/profile_repository.dart';

class ProfileImpl implements ProfileRepository {
  final Client _http = Client();
  final LocalData _localData = LocalData();

  @override
  Future<Either<String, UserModel>> getProfile() async {
    try {
      final token = await _localData.loadToken();
      final api = Uri.parse(ApiApp.profile + (token ?? ""));
      final res =
          await _http.get(api, headers: {"Authorization": ApiApp.basicAuth});

      final json = jsonDecode(res.body);
      if (res.statusCode == 200) {
        return Right(UserModel.fromJson(json["data"]));
      } else if (json["msg"] != null) {
        return Left(json['msg']);
      } else {
        return const Left("server tidak merespone");
      }
    } catch (e) {
      return const Left("Aplikasi error");
    }
  }

  @override
  Future<Either<String, String>> deleteProfile() {
    // ignore: todo
    // TODO: implement deleteProfile
    throw UnimplementedError();
  }

  @override
  Future<Either<String, String>> updateProfile(
      String name, String address, String phoneNumber,
      {File? photo}) async {
    try {
      final token = await _localData.loadToken();
      final id = await _localData.loadId();

      final api = Uri.parse(ApiApp.updateProfile + (token ?? ""));
      final req = MultipartRequest('POST', api);

      req.headers.addAll({"Authorization": ApiApp.basicAuth});
      req.fields.addAll({
        "courier": id ?? '',
        "name": name,
        "address": address,
        "phone_number": phoneNumber,
      });
      if (photo != null) {
        req.files
            .add(await MultipartFile.fromPath("photo_profile", photo.path));
      }

      final respone = await req.send();
      final responed = await Response.fromStream(respone);
      final json = jsonDecode(responed.body);
      if (responed.statusCode == 200 || responed.statusCode == 201) {
        return Right(json["msg"]);
      } else if (json["data"][0]["msg"] != null) {
        return Left(json["data"][0]["msg"]);
      } else if (json["msg"] != null) {
        return Left(json["msg"]);
      } else {
        return const Left("Server Error");
      }
    } catch (e) {
      return const Left("Aplikasi error");
    }
  }
}
