import 'package:hnflutter_challenge/domain/entity/order.dart';

import '../../data/repository/member_action_remote_repository.dart';
import 'cart_repository.dart';

abstract class MemberActionsRepository {
  BaseMemberActionsRemoteRepository _baseMemberActionsRemoteRepository;
  CartRepository _cartRepository;

  MemberActionsRepository(this._baseMemberActionsRemoteRepository,
      this._cartRepository);

  viewMemberOrders();

  rateOrder(int? orderId, int? rate);

  cancelOrder(orderId);

  markedAsCollected(int itemId);

  makeOrder(Order order);
}

class MemberActionsRepositoryImp extends MemberActionsRepository {
  MemberActionsRepositoryImp(super.baseMemberActionsRemoteRepository,
      super._cartRepository);

  @override
  cancelOrder(orderId) {
    return _baseMemberActionsRemoteRepository.cancelOrder(orderId);
  }

  @override
  markedAsCollected(int itemId) {
    return _cartRepository.getItem(itemId);
  }

  @override
  rateOrder(int? orderId, int? rate) {
    return _baseMemberActionsRemoteRepository.rateOrder(orderId, rate);
  }

  @override
  viewMemberOrders() {
    return _baseMemberActionsRemoteRepository.viewMemberOrders();
  }

  @override
  makeOrder(Order order) {
    return _baseMemberActionsRemoteRepository.makeOrder(order);
  }
}
