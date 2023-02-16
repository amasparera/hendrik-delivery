import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:e_kantin_delivery/const/local_data.dart';
import 'package:e_kantin_delivery/data/repository/work_repository.dart';
import 'package:e_kantin_delivery/domain/models/working.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

import '../../const/api_app.dart';

class WorkImpl implements WorkRepository {
  final Client _http = Client();
  final LocalData _localData = LocalData();

  @override
  Future<Either<String, Working>> setWork(bool status) async {
    final String? token = await _localData.loadToken();
    final String? idOffice = await _localData.loadId();
    try {
      final api = Uri.parse(ApiApp.setWork + (token ?? ""));
      final res = await _http.post(api,
          body: {"office_boy": idOffice, "work": status ? "1" : "0"},
          headers: {"Authorization": ApiApp.basicAuth});

      debugPrint(res.body);
      final json = jsonDecode(res.body);
      if (res.statusCode == 201) {
        return Right(Working.fromJson(json["data"]));
      } else {
        return Left(json['msg']);
      }
    } catch (e) {
      return const Left("Aplikasi error");
    }
  }
}
