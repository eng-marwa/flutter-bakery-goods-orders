import 'package:dartz/dartz.dart';

import '../../../app/failure.dart';
import '../../entity/Bakery.dart';
import '../../repository/user_action_repository.dart';
import '../base_use_case.dart';

class BakeryProfileUseCase implements BaseUseCase<int?, Bakery?> {
  final UserActionsRepository _userActionsRepository;

  BakeryProfileUseCase(this._userActionsRepository);

  @override
  Future<Either<Failure, Bakery?>> execute(input) async {
    return await _userActionsRepository.viewBakeryProfile(input!);
  }
}
