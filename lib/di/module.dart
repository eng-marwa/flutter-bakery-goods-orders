import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hnflutter_challenge/data/datasource/remote/api.dart';
import 'package:hnflutter_challenge/domain/repository/member_action_repository.dart';
import 'package:hnflutter_challenge/domain/usecases/cart_use_cases/empty_cart_use_case.dart';
import 'package:hnflutter_challenge/domain/usecases/cart_use_cases/remove_item_use_case.dart';
import 'package:hnflutter_challenge/domain/usecases/cart_use_cases/view_items_use_cases.dart';
import 'package:hnflutter_challenge/domain/usecases/auth_use_cases/logout_use_case.dart';
import 'package:hnflutter_challenge/domain/usecases/auth_use_cases/register_use_case.dart';
import 'package:hnflutter_challenge/presentation/cart/cart_viewmodel/cart_bloc.dart';
import 'package:hnflutter_challenge/presentation/cart/cart_viewmodel/cart_event.dart';
import 'package:hnflutter_challenge/presentation/details/products_viewmodel/product_bloc.dart';
import 'package:hnflutter_challenge/presentation/home/home_viewmodel/home_bloc.dart';
import 'package:hnflutter_challenge/presentation/home/profile_viewmodel/profile_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/datasource/local/preferences.dart';
import '../data/datasource/remote/dio_factory.dart';
import '../data/repository/auth_remote_repository.dart';
import '../data/repository/cart_local_repository.dart';
import '../data/repository/member_action_remote_repository.dart';
import '../data/repository/user_action_remote_repository.dart';
import '../domain/entity/item.dart';
import '../domain/repository/auth_repository.dart';
import '../domain/repository/cart_repository.dart';
import '../domain/repository/user_action_repository.dart';
import '../domain/usecases/auth_use_cases/login_use_case.dart';
import '../domain/usecases/cart_use_cases/add_item_use_case.dart';
import '../domain/usecases/member_use_cases/cancel_order_use_case.dart';
import '../domain/usecases/member_use_cases/make_order_use_case.dart';
import '../domain/usecases/member_use_cases/rate_order_use_case.dart';
import '../domain/usecases/member_use_cases/view_member_history.dart';
import '../domain/usecases/user_use_case.dart/filter_by_proximity_use_case.dart';
import '../domain/usecases/user_use_case.dart/filter_by_type_use_case.dart';
import '../domain/usecases/user_use_case.dart/products_in_bakery_use_cases.dart';
import '../domain/usecases/user_use_case.dart/view_barkeries_list_use_case.dart';

import '../domain/usecases/user_use_case.dart/view_selected_profile_bakery_use_case.dart';
import '../presentation/auth/login/login_viewmodel/login_bloc.dart';
import '../presentation/orders/order_view_model/order_bloc.dart';

final GetIt instance = GetIt.instance;

Future<void> configureDependencies() async {
  final sharedPrefs = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));
  //Hive
  _configureHive();
  instance.registerLazySingleton(() => Hive.box<Item>("items"));

  instance.registerLazySingleton<DioFactory>(() => DioFactory());
  Dio dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<ApiServices>(() => ApiServiceImp(dio));

  instance.registerFactory<BaseAuthRemoteRepository>(
      () => AuthRemoteRepositoryImp(instance()));

  instance.registerFactory<AuthRepository>(
      () => AuthRepositoryImp(instance(), instance()));

  instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
  instance.registerFactory<RegisterUseCase>(() => RegisterUseCase(instance()));
  instance.registerFactory<LogoutUseCase>(() => LogoutUseCase(instance()));

  instance.registerFactory<LoginBloc>(() => LoginBloc(instance()));
  //-------------------------------------------
  //cart
  instance.registerFactory<BasCartLocalRepository>(
      () => BasCartLocalRepositoryImp(instance()));

  instance.registerFactory<CartRepository>(() => CartRepositoryImp(instance()));

  instance.registerFactory<AddItemUseCase>(
      () => AddItemUseCase(instance()));
  instance.registerFactory<RemoveAllItemsUseCase>(
      () => RemoveAllItemsUseCase(instance()));
  instance.registerFactory<ViewAllItemsUseCase>(
      () => ViewAllItemsUseCase(instance()));
  instance
      .registerFactory<RemoveItemUseCase>(() => RemoveItemUseCase(instance()));

  instance.registerFactory<CartBloc>(
      () => CartBloc(instance(), instance(), instance(), instance()));

//----------------------------------------------------------------------

  instance.registerFactory<BasUserActionsRemoteRepository>(
      () => UserActionsRemoteRepositoryImp(instance()));
  instance.registerFactory<UserActionsRepository>(
      () => UserActionsRepositoryImp(instance()));

  instance.registerFactory<FilterByProximityUseCase>(
      () => FilterByProximityUseCase(instance()));
  instance.registerFactory<FilterByTypeUseCase>(
      () => FilterByTypeUseCase(instance()));
  instance.registerFactory<ViewProductsUseCase>(
      () => ViewProductsUseCase(instance()));
  instance.registerFactory<ViewBakeriesListUseCase>(
      () => ViewBakeriesListUseCase(instance()));

  instance.registerFactory<BakeryProfileUseCase>(
      () => BakeryProfileUseCase(instance()));



  instance
      .registerFactory<ViewBakeriesBloc>(() => ViewBakeriesBloc(instance(),instance(),instance()));
 instance
      .registerFactory<ViewProfileBloc>(() => ViewProfileBloc(instance()));
instance
      .registerFactory<ViewProductsBloc>(() => ViewProductsBloc(instance()));
//--------------------------------------------------------------------
  //order

  instance.registerFactory<BaseMemberActionsRemoteRepository>(
          () => MemberActionsRemoteRepositoryImp(instance()));

  instance.registerFactory<MemberActionsRepository>(() => MemberActionsRepositoryImp(instance(),instance()));

  instance.registerFactory<MakeOrderUseCase>(
          () => MakeOrderUseCase(instance()));
  instance.registerFactory<CancelOrderUseCase>(
          () => CancelOrderUseCase(instance()));
  instance.registerFactory<RateOrderUseCase>(
          () => RateOrderUseCase(instance()));
  instance.registerFactory<ViewMemberOrdersUseCase>(
          () => ViewMemberOrdersUseCase(instance()));

  instance
      .registerFactory<OrderBloc>(() => OrderBloc(instance(),instance(),instance(),instance(),));
}

//-------------------------------------------------------------
_configureHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ItemAdapter());
  Hive.openBox<Item>("items");
}
