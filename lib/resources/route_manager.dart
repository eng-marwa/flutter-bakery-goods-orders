import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../domain/entity/item.dart';
import '../presentation/auth/login/login_view.dart';
import '../presentation/cart/cart_view.dart';
import '../presentation/details/store_details_view.dart';
import '../presentation/home/home_view.dart';
import '../presentation/auth/register/register_view.dart';
import '../presentation/orders/orders_view.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String registerRoute = "/registe";
  static const String homeRoute = "/home";
  static const String detailsRoute = "/details";
  static const String cartRoute = "/cart";
  static const String ordersRoute = "/order";

  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      // case Routes.splashRoute:
      //   return MaterialPageRoute(builder: (_) =>  SplashView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => LoginView(), settings: settings,);
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterView());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => HomeView(), settings: settings,);
      case Routes.detailsRoute:
        return MaterialPageRoute(
          builder: (_) => const StoreDetailsView(),
          settings: settings,
        );
      case Routes.cartRoute:
        init();
        return MaterialPageRoute(
          builder: (_) =>  CartView(),
        );
      case Routes.ordersRoute:
        return MaterialPageRoute(
          builder: (_) => const OrdersView(),
          settings: settings,
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
            appBar: AppBar(
              title: const Text("No Route Found"),
            ),
            body: const Center(child: Text("No Route Found"))));
  }

  static void init() {
    bool opened = Hive.isBoxOpen('items');
    if (!opened) {
      Hive.openBox<Item>("items");
    }
  }
}
