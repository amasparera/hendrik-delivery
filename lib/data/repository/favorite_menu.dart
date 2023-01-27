import 'package:dartz/dartz.dart';

abstract class FavoriteRepository {
  Future<Either<String, String>> addFavoriteMenu(
      String idCustomer, String idMenu, String status);
  Future<Either<String, String>> getFavoriteMenu(String idCustomer);
}
