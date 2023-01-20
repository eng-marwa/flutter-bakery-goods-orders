import 'package:dartz/dartz.dart';
import 'package:hnflutter_challenge/data/datasource/remote/api.dart';
import 'package:hnflutter_challenge/domain/entity/product.dart';

import '../../app/failure.dart';
import '../../domain/entity/Bakery.dart';

abstract class BasUserActionsRemoteRepository {
  ApiServices _apiServices;

  BasUserActionsRemoteRepository(this._apiServices);

  Future<Either<Failure, List<Bakery>>> viewListOfBakeries();

  Future<Either<Failure, List<Bakery>>> filterByType(String type);


  Future<Either<Failure, Bakery?>> viewBakeryProfile(int id);

  Future<Either<Failure, List<Product>>> viewListOfProduct(int bakeryId);
}

class UserActionsRemoteRepositoryImp extends BasUserActionsRemoteRepository {
  UserActionsRemoteRepositoryImp(super.apiServices);

  @override
  Future<Either<Failure, List<Product>>>  viewListOfProduct(int bakeryId) {
    return _apiServices.viewListOfProduct(bakeryId);
  }

  @override
  Future<Either<Failure, List<Bakery>>> filterByType(String type) {
    return _apiServices.filterByType(type);
  }

  @override
  Future<Either<Failure, Bakery?>> viewBakeryProfile(int id) {
    return _apiServices.viewBakeryProfile(id);
  }

  @override
  Future<Either<Failure, List<Bakery>>> viewListOfBakeries() {
    return _apiServices.viewListOfBakeries();
  }

}
