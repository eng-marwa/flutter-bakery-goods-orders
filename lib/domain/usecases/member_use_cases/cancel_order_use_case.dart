import 'package:dartz/dartz.dart';

import '../../../app/failure.dart';
import '../../repository/member_action_repository.dart';
import '../base_use_case.dart';
class CancelOrderUseCase implements BaseUseCase<int, void> {
  final MemberActionsRepository _memberActionsRepository;

  CancelOrderUseCase(this._memberActionsRepository);

  @override
  Future<Either<Failure, void>> execute(input) async {
    return await _memberActionsRepository.cancelOrder(input!);
  }
}