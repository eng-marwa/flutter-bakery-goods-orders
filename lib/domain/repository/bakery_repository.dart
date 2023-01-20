import 'package:dartz/dartz.dart';
import 'package:hnflutter_challenge/data/repository/bakery_remote_repository.dart';
import 'package:hnflutter_challenge/domain/entity/product.dart';

import '../../app/failure.dart';
import '../entity/user.dart';

abstract class BakeryRepository {
  BasBakeryRemoteRepository _baseBakeryRemoteRepository;
  BakeryRepository(this._baseBakeryRemoteRepository);


}

class BakeryRepositoryImp extends BakeryRepository {
  BakeryRepositoryImp(super._baseBakeryRemoteRepository);



}
