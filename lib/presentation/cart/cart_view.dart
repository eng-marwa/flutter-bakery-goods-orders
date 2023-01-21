import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hnflutter_challenge/domain/entity/Rate.dart';
import 'package:hnflutter_challenge/presentation/cart/cart_viewmodel/CartStatus.dart';
import 'package:hnflutter_challenge/presentation/cart/cart_viewmodel/cart_bloc.dart';
import 'package:hnflutter_challenge/presentation/orders/order_view_model/order_state.dart';
import 'package:hnflutter_challenge/presentation/orders/order_view_model/order_status.dart';
import 'package:hnflutter_challenge/resources/route_manager.dart';

import '../../domain/entity/item.dart';
import '../orders/order_view_model/order_event.dart';
import '../orders/order_view_model/order_bloc.dart';
import '../widgets/show_snackbar.dart';
import 'cart_viewmodel/cart_event.dart';
import 'cart_viewmodel/cart_state.dart';

class CartView extends StatelessWidget {
  CartView({Key? key}) : super(key: key);
  bool emptyCart = false;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CartBloc>(context, listen: false)
        .add(ViewItemsFromCartEvent());
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(children: [
      ElevatedButton(
          onPressed: () {
            BlocProvider.of<CartBloc>(context).add(DeleteAllItemsEvent());
          },
          child: const Text('Clear the cart')),
      Divider(),
      const SizedBox(
        height: 30,
      ),
      _viewCartItems(),
      const SizedBox(
        height: 50,
      ),
      ElevatedButton(
          onPressed: () {
            BlocProvider.of<OrderBloc>(context).add(MakeOrderEvent());
          },
          child: const Text('Make Order')),
      _afterOrderCreated()
    ]))));
  }

  Widget _QtyForm() {
    return SizedBox(
        width: 20,
        child: Form(
            child: TextFormField(
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(hintText: '1'),
        )));
  }

  _viewCartItems() {
    try {
      return BlocListener<CartBloc, CartState>(listener: (context, state) {
        final status = state.status;
        if (status is FailedStatus) {
          ShowSnackBar(context, status.failureMessage);
        } else if (status is ItemDeleted) {
          BlocProvider.of<CartBloc>(context, listen: false)
              .add(ViewItemsFromCartEvent());
          ShowSnackBar(context, 'Item Deleted');
        }
      }, child: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
        final cartStatus = state.status;
        if (cartStatus is NoItems) {
          emptyCart = true;
          return const Center(
            child: Text('Cart is Empty'),
          );
        } else if (cartStatus is SuccessStatus) {
          Box<Item> box = state.items!.value;
          return ValueListenableBuilder<Box<Item>>(
              valueListenable: box.listenable(),
              builder: (context, box, child) => ListView.separated(
                  separatorBuilder: (context, index) => Divider(),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: box.values.length,
                  itemBuilder: (context, index) => ListTile(
                        title: Text('${box.getAt(index)!.productName}'),
                        subtitle: Row(children: [Text('Qty:'), _QtyForm()]),
                        trailing: ElevatedButton(
                            child: const Text('Delete'),
                            onPressed: () {
                              BlocProvider.of<CartBloc>(context).add(
                                  DeleteItemFromCartEvent(
                                      box.getAt(index)!.productId!));
                            }),
                      )));
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }));
    } on HiveError catch (e) {
      return Text(e.message);
    }
  }

  void ShowRateDialog(context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Rate Order'),
              content: Wrap(children: [
                ChoiceChip(
                  label: Text("1"),
                  selected: true,
                  onSelected: (value) {
                    rateOrder(context,1.0);
                  },
                ),
                ChoiceChip(
                  label: Text("2"),
                  selected: true,
                  onSelected: (value) {
                    rateOrder(context,2.0);
                  },
                ),
                ChoiceChip(
                  label: Text("3"),
                  selected: true,
                  onSelected: (value) {
                    rateOrder(context,3.0);
                  },
                ),
                ChoiceChip(
                  label: Text("4"),
                  selected: true,
                  onSelected: (value) {
                  rateOrder(context,4.0);
                  },
                ),
                ChoiceChip(
                  label: Text("5"),
                  selected: true,
                  onSelected: (value) {
                    rateOrder(context,5.0);
                  },
                ),
              ]),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Cancel'))
              ],
            ));
  }

  _afterOrderCreated() {
    return BlocListener<OrderBloc, OrderState>(
      listener: (context, state) {
        var orderStatus = state.orderStatus;
        if (orderStatus is FailedOrderStatus) {
          ShowSnackBar(context, orderStatus.failureMessage);
        } else if (orderStatus is SuccessCreateOrderStatus) {
          ShowSnackBar(context, 'Order Collected');
          ShowRateDialog(context);
          BlocProvider.of<CartBloc>(context).add(DeleteAllItemsEvent());
        }
      },
      child: SizedBox(),
    );
  }

  void rateOrder(context, double value) {
    BlocProvider.of<OrderBloc>(context).add(RateOrderEvent(Rate(rate: value, orderId: 0)));
    Navigator.pop(context);
    Navigator.pushNamed(context, Routes.ordersRoute);
  }
}
