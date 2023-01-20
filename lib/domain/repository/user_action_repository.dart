import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hnflutter_challenge/domain/entity/product.dart';
import 'package:hnflutter_challenge/utils/utitiy/geo.dart';

import '../../app/failure.dart';
import '../../data/repository/user_action_remote_repository.dart';
import '../entity/Bakery.dart';

abstract class UserActionsRepository {
  BasUserActionsRemoteRepository _basUserActionsRemoteRepository;

  UserActionsRepository(this._basUserActionsRemoteRepository);

  Future<Either<Failure, List<Bakery>>> viewListOfBakeries();

  Future<Either<Failure, List<Bakery>>> filterByType(String type);

  Future<Either<Failure, List<Bakery>>> filterByProximity();

  Future<Either<Failure, Bakery?>> viewBakeryProfile(int id);

  Future<Either<Failure, List<Product>>> viewListOfProduct(int bakeryId);
}

class UserActionsRepositoryImp extends UserActionsRepository {
  UserActionsRepositoryImp(super.basUserActionsRemoteRepository);

  @override
  Future<Either<Failure, List<Bakery>>> filterByProximity() async {
    try {
      Position position = await determinePosition();
      return Right(doFilterByProximity(position));
    } catch (e) {
      return Left(Failure(code: 404, message: 'error message'));
    }
  }

  @override
  Future<Either<Failure, List<Bakery>>> filterByType(String type) {
    return _basUserActionsRemoteRepository.filterByType(type);
  }

  @override
  Future<Either<Failure, Bakery?>> viewBakeryProfile(int id) {
    return _basUserActionsRemoteRepository.viewBakeryProfile(id);
  }

  @override
  Future<Either<Failure, List<Bakery>>> viewListOfBakeries() {
    return _basUserActionsRemoteRepository.viewListOfBakeries();
  }

  @override
  Future<Either<Failure, List<Product>>> viewListOfProduct(int bakeryId) {
    return _basUserActionsRemoteRepository.viewListOfProduct(bakeryId);
  }
}
