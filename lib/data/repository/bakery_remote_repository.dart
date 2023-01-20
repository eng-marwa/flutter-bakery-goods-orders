import 'package:dartz/dartz.dart';
import '../../domain/entity/product.dart';

import '../../app/failure.dart';
import '../datasource/remote/api.dart';

abstract class BasBakeryRemoteRepository {
  ApiServices apiServices;
  BasBakeryRemoteRepository(this.apiServices);


}
class BakeryRemoteRepositoryImp extends BasBakeryRemoteRepository {
  BakeryRemoteRepositoryImp(super.apiServices);


}