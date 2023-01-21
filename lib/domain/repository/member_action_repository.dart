import 'package:dartz/dartz.dart';
import 'package:hnflutter_challenge/domain/entity/order.dart' as order;

import '../../app/failure.dart';
import '../../data/repository/member_action_remote_repository.dart';
import '../entity/item.dart';
import 'cart_repository.dart';

abstract class MemberActionsRepository {
  BaseMemberActionsRemoteRepository _baseMemberActionsRemoteRepository;
  CartRepository _cartRepository;

  MemberActionsRepository(
      this._baseMemberActionsRemoteRepository, this._cartRepository);

  Future<Either<Failure, List<order.Order>>> viewMemberOrders();

  Future<Either<Failure, List<order.Order>>> rateOrder(
      int? orderId, double? rate);

  Future<Either<Failure, List<order.Order>>> cancelOrder(orderId);

  markedAsCollected(int itemId);

  makeOrder();
}

class MemberActionsRepositoryImp extends MemberActionsRepository {
  MemberActionsRepositoryImp(
      super.baseMemberActionsRemoteRepository, super._cartRepository);

  @override
  Future<Either<Failure, List<order.Order>>> cancelOrder(orderId) {
    return _baseMemberActionsRemoteRepository.cancelOrder(orderId);
  }

  @override
  markedAsCollected(int itemId) {
    return _cartRepository.getItem(itemId);
  }

  @override
  Future<Either<Failure, List<order.Order>>> rateOrder(
      int? orderId, double? rate) {
    return _baseMemberActionsRemoteRepository.rateOrder(orderId, rate);
  }

  @override
  Future<Either<Failure, List<order.Order>>> viewMemberOrders() {
    return _baseMemberActionsRemoteRepository.viewMemberOrders();
  }

  @override
  Future<Either<Failure, bool>> makeOrder() async {
    int lastOrderId = 0;
    List<Item> items = [];

    _cartRepository.viewAllItems().fold((l) => null, (r){
       items = r.value.values.toList();
    });
    final viewMemberOrders = await _baseMemberActionsRemoteRepository.viewMemberOrders();
    viewMemberOrders.fold((l) => null, (r) {
      lastOrderId = r[r.length-1].orderId!;
    });
    var dateTime = DateTime.now();
    String orderDate = '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    var newOrder = order.Order(orderId: lastOrderId, orderDate: orderDate, items: items, price: 1200, status: 'Active', paymentMethod: 'Cash');
    return _baseMemberActionsRemoteRepository.makeOrder(newOrder);
  }
}
