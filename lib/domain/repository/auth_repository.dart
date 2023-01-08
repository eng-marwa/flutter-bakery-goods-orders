import 'package:dartz/dartz.dart';
import 'package:hnflutter_challenge/data/datasource/local/preferences.dart';
import 'package:hnflutter_challenge/data/repository/auth_remote_repository.dart';

import '../../app/failure.dart';
import '../entity/user.dart';

abstract class AuthRepository {
  BaseAuthRemoteRepository _baseAuthRemoteRepository;
  AppPreferences _appPreferences;

  AuthRepository(this._baseAuthRemoteRepository,this._appPreferences);

  Future<Either<Failure, User>> login(String email , String password);

  Future<Either<Failure, User>> register(String email , String password);

  Future<Either<Failure,String>>logoutRemote();
  Future<void> logout();
}

class AuthRepositoryImp extends AuthRepository {
  AuthRepositoryImp(super._authRemoteRepository,super._appPreferences);
  @override
  Future<Either<Failure, User>> login(String email , String password) {
    return _baseAuthRemoteRepository.login(email,password);
  }

  @override
  Future<Either<Failure, User>> register(String email , String password) {
    return _baseAuthRemoteRepository.register(email,password);
  }

  @override
  Future<Either<Failure, String>> logoutRemote() {
    return _baseAuthRemoteRepository.logoutRemote();
  }

  @override
  Future<void> logout() {
    return _appPreferences.logout();
  }
}
