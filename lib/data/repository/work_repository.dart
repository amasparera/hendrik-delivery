import 'package:dartz/dartz.dart';
import 'package:e_kantin_delivery/domain/models/working.dart';

abstract class WorkRepository {
  Future<Either<String, Working>> setWork(bool status);
}
