import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hnflutter_challenge/domain/entity/item.dart';
import 'package:hnflutter_challenge/domain/entity/order.dart';
import 'package:hnflutter_challenge/presentation/orders/order_view_model/order_event.dart';
import 'package:hnflutter_challenge/presentation/orders/order_view_model/order_status.dart';

import '../widgets/show_snackbar.dart';
import 'order_view_model/order_bloc.dart';
import 'order_view_model/order_state.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<OrderBloc>(context, listen: false).add(ViewOrdersEvent());
    return Scaffold(
      body: SafeArea(child: _viewOrders()),
    );
  }

  _viewOrders() {
    return BlocListener<OrderBloc, OrderState>(listener: (context, state) {
      final status = state.orderStatus;
      if (status is FailedOrderStatus) {
        ShowSnackBar(context, status.failureMessage);
      } else if (status is SuccessOrderCancelledStatus) {
        ShowSnackBar(context, 'Order cancelled');
      }
    }, child: BlocBuilder<OrderBloc, OrderState>(builder: (context, state) {
      final orderStatus = state.orderStatus;
      if (orderStatus is SuccessViewOrdersStatus) {
        return _viewOrderList(state.orders);
      } else if (orderStatus is SuccessOrderCancelledStatus) {
        return _viewOrderList(state.orders);
      } else if (orderStatus is SuccessOrderRatedStatus) {
        return _viewOrderList(state.orders);
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    }));
  }

  _orderColor(String? status) {
    switch (status!) {
      case "Done":
        return Colors.green;
      case "Cancelled":
        return Colors.red;
      case "Active":
        return Colors.blue;
    }
  }

  viewOrderItems(List<Item>? items) {}

  Widget _viewOrderList(List<Order>? orders) {
    return ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: orders!.length,
        itemBuilder: (context, index) => ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Order Id: ${orders[index].orderId}',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Order Date: ${orders[index].orderDate}'),
                Text('Order Cost: ${orders[index].price}'),
                Text('Order Items: ${viewOrderItems(orders[index].items)}'),
                Text('Payment Method: ${orders[index].paymentMethod}'),
              ],
            ),
            leading: Text(
              '${orders[index].status}',
              style: TextStyle(color: _orderColor(orders[index].status)),
            ),
            trailing: Visibility(
                visible: orders[index].status == 'Active',
                child: ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<OrderBloc>(context, listen: false)
                          .add(CancelOrderEvent(orders[index].orderId));
                    },
                    child: Text('Cancel Order'))),
            subtitle: Visibility(
              visible: orders[index].rate != 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Text('${orders[index].rate}'),
                ],
              ),
            )));
  }
}
