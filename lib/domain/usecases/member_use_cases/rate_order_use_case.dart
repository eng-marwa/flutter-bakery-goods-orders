import 'package:dartz/dartz.dart';

import '../../../app/failure.dart';
import '../../entity/Rate.dart';
import '../../repository/member_action_repository.dart';
import '../base_use_case.dart';
import 'package:hnflutter_challenge/domain/entity/order.dart' as order;

class RateOrderUseCase implements BaseUseCase<Rate, List<order.Order>> {
  final MemberActionsRepository _memberActionsRepository;

  RateOrderUseCase(this._memberActionsRepository);

  @override
  Future<Either<Failure, List<order.Order>>> execute(input) async {
    return await _memberActionsRepository.rateOrder(input?.orderId,input?.rate);
  }
}