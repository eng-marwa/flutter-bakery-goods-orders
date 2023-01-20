import 'package:dartz/dartz.dart';
import 'package:hnflutter_challenge/app/failure.dart';
import 'package:hnflutter_challenge/domain/entity/user.dart';

import '../../../data/model/auth_model.dart';
import '../../repository/auth_repository.dart';
import '../base_use_case.dart';


class LoginUseCase implements BaseUseCase<AuthRequest, User> {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  @override
  Future<Either<Failure, User>> execute(input) async{
    return await _authRepository.login(input!.email,input.password);
  }
}
