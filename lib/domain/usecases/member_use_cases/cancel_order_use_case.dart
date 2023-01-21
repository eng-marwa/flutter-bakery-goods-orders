import 'package:dartz/dartz.dart';

import '../../../app/failure.dart';
import '../../repository/member_action_repository.dart';
import '../base_use_case.dart';
import '../../entity/order.dart' as order;
class CancelOrderUseCase implements BaseUseCase<int, List<order.Order>>{
  final MemberActionsRepository _memberActionsRepository;

  CancelOrderUseCase(this._memberActionsRepository);

  @override
  Future<Either<Failure, List<order.Order>>> execute(input) async {
    return await _memberActionsRepository.cancelOrder(input!);
  }
}