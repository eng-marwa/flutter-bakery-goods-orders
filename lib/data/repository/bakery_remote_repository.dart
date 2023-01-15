import 'package:dartz/dartz.dart';
import '../../domain/entity/product.dart';

import '../../app/failure.dart';
import '../datasource/remote/api.dart';

abstract class BasBakeryRemoteRepository {
  ApiServices apiServices;
  BasBakeryRemoteRepository(this.apiServices);
  Future<Either<Failure, Product>> all();

}
class BakeryRemoteRepositoryImp extends BasBakeryRemoteRepository {
  BakeryRemoteRepositoryImp(super.apiServices);

  @override
  Future<Either<Failure, Product>> all() {
    return apiServices.all();
  }
}