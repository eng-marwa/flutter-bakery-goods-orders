
import 'package:dartz/dartz.dart';

import '../../../app/failure.dart';
import '../../entity/order.dart' as order;
import '../../repository/member_action_repository.dart';
import '../base_use_case.dart';


class ViewMemberOrdersUseCase implements BaseUseCase<void, List<order.Order>> {
  final MemberActionsRepository _memberActionsRepository;

  ViewMemberOrdersUseCase(this._memberActionsRepository);

  @override
  Future<Either<Failure, List<order.Order>>> execute(input) async {
    return await _memberActionsRepository.viewMemberOrders();
  }
}