import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hnflutter_challenge/di/module.dart';
import 'package:hnflutter_challenge/presentation/cart/cart_viewmodel/cart_bloc.dart';
import 'package:hnflutter_challenge/presentation/details/products_viewmodel/product_bloc.dart';
import 'package:hnflutter_challenge/presentation/home/home_viewmodel/home_bloc.dart';
import 'package:hnflutter_challenge/presentation/home/home_viewmodel/home_event.dart';
import 'package:hnflutter_challenge/presentation/home/profile_viewmodel/profile_bloc.dart';
import 'package:hnflutter_challenge/presentation/orders/order_view_model/order_bloc.dart';
import 'package:hnflutter_challenge/resources/route_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ViewBakeriesBloc>(
              create: (context) =>
                  instance<ViewBakeriesBloc>()..add(const FetchBakeries())),
          BlocProvider<ViewProfileBloc>(
              create: (context) => instance<ViewProfileBloc>()),
          BlocProvider<ViewProductsBloc>(
              create: (context) => instance<ViewProductsBloc>()),
          BlocProvider<CartBloc>(create: (context) => instance<CartBloc>()),
          BlocProvider<OrderBloc>(create: (context) => instance<OrderBloc>()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          onGenerateRoute: Routes.getRoute,
          initialRoute: Routes.loginRoute,
        ));
  }
}
