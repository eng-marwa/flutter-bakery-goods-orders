import 'package:dartz/dartz.dart';

import '../../../app/failure.dart';
import '../../entity/order.dart' as order;
import '../../repository/member_action_repository.dart';
import '../base_use_case.dart';

class MakeOrderUseCase implements BaseUseCase<order.Order, void> {
  final MemberActionsRepository _memberActionsRepository;

  MakeOrderUseCase(this._memberActionsRepository);

  @override
  Future<Either<Failure, bool>> execute(input) async {
    return await _memberActionsRepository.makeOrder();
  }
}