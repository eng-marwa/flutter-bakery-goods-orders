import 'package:dartz/dartz.dart';
import 'package:hnflutter_challenge/app/failure.dart';

import '../../repository/auth_repository.dart';
import '../base_use_case.dart';

class LogoutUseCase implements BaseUseCase<void, void> {
  final AuthRepository _authRepository;

  LogoutUseCase(this._authRepository);

  @override
  Future<Either<Failure,void>> execute(void input) async {
    await _authRepository.logout();
    return await _authRepository.logoutRemote();
  }


}
