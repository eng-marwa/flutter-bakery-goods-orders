import 'package:hnflutter_challenge/data/datasource/remote/api.dart';
import 'package:hnflutter_challenge/domain/entity/order.dart';

abstract class BaseMemberActionsRemoteRepository {
  ApiServices _apiServices;
  BaseMemberActionsRemoteRepository(this._apiServices);
  viewMemberOrders();
  rateOrder(int? orderId, int? rate);
  cancelOrder(orderId);
  makeOrder(Order order);
}


class UserActionsRemoteRepositoryImp extends BaseMemberActionsRemoteRepository{
  UserActionsRemoteRepositoryImp(super.apiServices);

  @override
  cancelOrder(orderId) {
    return _apiServices.cancelOrder(orderId);
  }


  @override
  rateOrder(int? orderId, int? rate) {
   return _apiServices.rateOrder(orderId,rate);
  }

  @override
  viewMemberOrders() {
    return _apiServices.viewMemberOrders();
  }

  @override
  makeOrder(Order order) {
   return _apiServices.makeOrder(order);
  }

}