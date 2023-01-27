import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import '../../const/api_app.dart';
import '../../const/local_data.dart';
import '../repository/favorite_menu.dart';

class FavoriteImpl implements FavoriteRepository {
  final Client _http = Client();
  final LocalData _localData = LocalData();

  @override
  Future<Either<String, String>> addFavoriteMenu(
      String idCustomer, String idMenu, String status) async {
    try {
      final token = await _localData.loadToken();
      final api = Uri.parse("${ApiApp.addFavorite}${token ?? ""}");
      final res = await _http.post(api,
          headers: {"Authorization": ApiApp.basicAuth},
          body: {"customer": idCustomer, "menu": idMenu, "favorite": status});

      final json = jsonDecode(res.body);
      if (kDebugMode) {
        print(json);
      }
      if (res.statusCode == 201) {
        return Right(json["msg"]);
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
  Future<Either<String, String>> getFavoriteMenu(String idCustomer) async {
    try {
      final token = await _localData.loadToken();
      final api = Uri.parse("${ApiApp.addFavorite}${token ?? ""}&customer=");
      final res = await _http.get(
        api,
        headers: {"Authorization": ApiApp.basicAuth},
      );

      final json = jsonDecode(res.body);
      if (kDebugMode) {
        print(json);
      }
      if (res.statusCode == 201) {
        return Right(json["msg"]);
      } else if (json["msg"] != null) {
        return Left(json['msg']);
      } else {
        return const Left("server tidak merespone");
      }
    } catch (e) {
      return const Left("Aplikasi error");
    }
  }
}
