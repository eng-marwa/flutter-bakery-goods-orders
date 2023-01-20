import 'package:dartz/dartz.dart';

import '../../../app/failure.dart';
import '../../entity/Rate.dart';
import '../../repository/member_action_repository.dart';
import '../base_use_case.dart';

class RateOrderUseCase implements BaseUseCase<Rate, void> {
  final MemberActionsRepository _memberActionsRepository;

  RateOrderUseCase(this._memberActionsRepository);

  @override
  Future<Either<Failure, void>> execute(input) async {
    return await _memberActionsRepository.rateOrder(input?.orderId,input?.rate);
  }
}