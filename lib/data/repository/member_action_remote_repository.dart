import 'package:dartz/dartz.dart';
import 'package:hnflutter_challenge/data/datasource/remote/api.dart';
import 'package:hnflutter_challenge/domain/entity/order.dart' as order;

import '../../app/failure.dart';

abstract class BaseMemberActionsRemoteRepository {
  ApiServices _apiServices;
  BaseMemberActionsRemoteRepository(this._apiServices);
  Future<Either<Failure, List<order.Order>>>viewMemberOrders();
  Future<Either<Failure, List<order.Order>>> rateOrder(int? orderId, double? rate);
  Future<Either<Failure, List<order.Order>>> cancelOrder(orderId);
  Future<Either<Failure, bool>>  makeOrder(order.Order order);
}


class MemberActionsRemoteRepositoryImp extends BaseMemberActionsRemoteRepository{
  MemberActionsRemoteRepositoryImp(super.apiServices);

  @override
  Future<Either<Failure, List<order.Order>>> cancelOrder(orderId) {
    return _apiServices.cancelOrder(orderId);
  }


  @override
  Future<Either<Failure, List<order.Order>>> rateOrder(int? orderId, double? rate) {
   return _apiServices.rateOrder(orderId,rate);
  }

  @override
  Future<Either<Failure, List<order.Order>>> viewMemberOrders() {
    return _apiServices.viewMemberOrders();
  }

  @override
  Future<Either<Failure, bool>>  makeOrder(order.Order order) {
   return _apiServices.makeOrder(order);
  }

}