import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hnflutter_challenge/domain/entity/product.dart';
import 'package:hnflutter_challenge/presentation/home/home_viewmodel/home_bloc.dart';
import 'package:hnflutter_challenge/presentation/home/home_viewmodel/home_event.dart';
import 'package:hnflutter_challenge/presentation/home/home_viewmodel/home_state.dart';
import 'package:hnflutter_challenge/presentation/home/view_product_status.dart';

import '../../di/module.dart';
import '../cart/cart_viewmodel/cart_bloc.dart';
import '../widgets/show_snackbar.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    String? email = ModalRoute.of(context)!.settings.arguments as String?;
    return Scaffold(
        body:MultiBlocProvider(providers: [
          BlocProvider<ViewProductsBloc>(create: (context) => instance<ViewProductsBloc>()..add(FetchProducts())),
          BlocProvider<CartBloc>(create: (context) => instance<ViewProductsBloc>()..add(FetchProducts())),
        ],

      child: SafeArea(
          child: SingleChildScrollView(
        child:
            Column(children: [_greetingTextView(email), _productsGridView()]),
      )),
    ));
  }

  Widget _productsGridView() {
    return BlocBuilder<ViewProductsBloc, ViewProductsState>(
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
            itemBuilder: (context, index) => Card(
                    child: Column(children: [
                  Image.network("https://raw.githubusercontent.com/filippella/Dagger-Rx-Database-MVP/master/cakes/lemoncheese_cake.jpg", width:120),
                  Text('${products[index].name}'),
                  OutlinedButton(
                      onPressed: () {

                      }, child: const Text('Add To Cart'))
                ])));
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }

  Widget _greetingTextView(String? email) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: Text(
                email != null ? 'Welcome Member' : 'Welcome Guest',
                style: const TextStyle(fontWeight: FontWeight.bold),
              )),
          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: () {

              },
              child: const Text(
                'Log Out',
                textAlign: TextAlign.end,
              ),
            ),
          )
        ],
      ),
    );
  }
}
