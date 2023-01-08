import 'package:dartz/dartz.dart';

import '../../app/failure.dart';
import '../../domain/entity/user.dart';
import '../datasource/remote/api.dart';

abstract class BaseAuthRemoteRepository {
  ApiServices apiServices;

  BaseAuthRemoteRepository(this.apiServices);

  Future<Either<Failure, User>> login(String email , String password);

  Future<Either<Failure, User>> register(String email , String password);

  Future<Either<Failure, String>> logoutRemote();
}

class AuthRemoteRepositoryImp extends BaseAuthRemoteRepository {
  AuthRemoteRepositoryImp(super.apiServices);

  @override
  Future<Either<Failure, User>> login(String email , String password) {
    return apiServices.login(email,password);
  }

  @override
  Future<Either<Failure, User>> register(String email , String password) {
    return apiServices.register(email,password);
  }

  @override
  Future<Either<Failure, String>> logoutRemote() {
    return apiServices.logout();

  }
}
