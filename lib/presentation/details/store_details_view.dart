import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hnflutter_challenge/presentation/cart/cart_viewmodel/cart_event.dart';
import 'package:hnflutter_challenge/presentation/cart/cart_viewmodel/cart_state.dart';
import 'package:hnflutter_challenge/presentation/cart/cart_viewmodel/CartStatus.dart' as cart;
import 'package:hnflutter_challenge/presentation/details/products_viewmodel/product_bloc.dart';
import 'package:hnflutter_challenge/presentation/details/products_viewmodel/product_event.dart';
import 'package:hnflutter_challenge/presentation/details/products_viewmodel/product_state.dart';
import 'package:hnflutter_challenge/presentation/details/products_viewmodel/view_product_status.dart';
import 'package:hnflutter_challenge/utils/mapper/mapper.dart';

import '../../domain/entity/Bakery.dart';
import '../../domain/entity/product.dart';
import '../../resources/route_manager.dart';
import '../cart/cart_viewmodel/CartStatus.dart';
import '../cart/cart_viewmodel/cart_bloc.dart';
import '../widgets/show_snackbar.dart';

class StoreDetailsView extends StatelessWidget {
  const StoreDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic> list =
    ModalRoute
        .of(context)!
        .settings
        .arguments as List<dynamic>;
    Bakery? bakery = list[0];
    String? email = list[1];
    BlocProvider.of<ViewProductsBloc>(context, listen: false)
        .add(FetchProducts(bakery!.id));
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
              child: Column(children: [
                Image.network('${bakery.logo}'),
                Text('${bakery.name}'),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  Text('${bakery.rate}'),
                ]),
                _bakeryProductsGridView(email)
              ]),
            )));
  }

  Widget _bakeryProductsGridView(String? email) {
    return BlocListener<CartBloc, CartState>(
        listener: (context, state) {
          final status = state.status;
          if (status is FailedStatus) {
            ShowSnackBar(context, status.failureMessage);
          } else if (status is ItemAdded) {
            ShowSnackBar(context, 'Item added');

          }
        },
        child:
        BlocBuilder<ViewProductsBloc, ViewProductsState>(
            builder: (context, state) {
              final viewProductStatus = state.viewProductStatus;
              if (viewProductStatus is Failed) {
                return Center(child: Text(viewProductStatus.failureMessage));
              } else if (viewProductStatus is Success) {
                List<Product> products = state.products!;
                return GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: products.length,
                    itemBuilder: (context, index) =>
                        Card(
                            child: Column(children: [
                              Image.network(
                                  "https://raw.githubusercontent.com/filippella/Dagger-Rx-Database-MVP/master/cakes/lemoncheese_cake.jpg",
                                  width: 120),
                              Text('${products[index].name}'),
                              OutlinedButton(
                                  onPressed: () {
                                    if (email == null) {
                                      BlocProvider.of<CartBloc>(
                                          context, listen: false).add(
                                          AddItemToCartEvent(
                                              products[index].toDomain()));
                                    } else {
                                      ShowSnackBar(context,
                                          'you must login before');
                                      Navigator.pushNamed(context,
                                          Routes.loginRoute);
                                    }
                                  },
                                  child: const Text('Add To Cart'))
                            ])));
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
