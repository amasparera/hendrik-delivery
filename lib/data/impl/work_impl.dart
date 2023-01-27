import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:e_kantin_delivery/const/local_data.dart';
import 'package:e_kantin_delivery/data/repository/work_repository.dart';
import 'package:e_kantin_delivery/domain/models/working.dart';
import 'package:http/http.dart';

import '../../const/api_app.dart';

class WorkImpl implements WorkRepository {
  final Client _http = Client();
  final LocalData _localData = LocalData();

  @override
  Future<Either<String, Working>> setWork(bool status, String idOffice) async {
    final String? token = await _localData.loadToken();
    try {
      final api = Uri.parse(ApiApp.setWork + (token ?? ""));
      final res = await _http.post(api,
          body: {"office_boy": idOffice, "work": status ? "1" : "0"},
          headers: {"Authorization": ApiApp.basicAuth});

      final json = jsonDecode(res.body);
      print(json);
      if (res.statusCode == 200) {
        return Right(Working.fromjson(json["data"]));
      } else {
        return Left(json['msg']);
      }
    } catch (e) {
      return const Left("Aplikasi error");
    }
  }
}
