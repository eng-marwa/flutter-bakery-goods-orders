import 'package:dartz/dartz.dart';
import 'package:hnflutter_challenge/data/repository/bakery_remote_repository.dart';
import 'package:hnflutter_challenge/domain/entity/product.dart';

import '../../app/failure.dart';
import '../entity/user.dart';

abstract class BakeryRepository {
  BasBakeryRemoteRepository _baseBakeryRemoteRepository;
  BakeryRepository(this._baseBakeryRemoteRepository);

  Future<Either<Failure, List<Product>>> all();

}

class BakeryRepositoryImp extends BakeryRepository {
  BakeryRepositoryImp(super._baseBakeryRemoteRepository);
  @override
  Future<Either<Failure, List<Product>>> all() {
    return _baseBakeryRemoteRepository.all();
  }


}
