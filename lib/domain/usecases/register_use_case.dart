import 'package:dartz/dartz.dart';

import '../../app/failure.dart';
import '../../data/model/auth.dart';
import '../entity/user.dart';
import '../repository/auth_repository.dart';
import 'base_use_case.dart';

class RegisterUseCase implements BaseUseCase<AuthRequest, User> {
  final AuthRepository _authRepository;

  RegisterUseCase(this._authRepository);

  @override
  Future<Either<Failure, User>> execute(input) async{
    return await _authRepository.register(input!.email,input.password);
  }
}
