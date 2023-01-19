import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hnflutter_challenge/data/datasource/remote/api.dart';
import 'package:hnflutter_challenge/domain/repository/bakery_repository.dart';
import 'package:hnflutter_challenge/domain/usecases/all_bakery_use_cases.dart';
import 'package:hnflutter_challenge/domain/usecases/login_use_case.dart';
import 'package:hnflutter_challenge/domain/usecases/logout_use_case.dart';
import 'package:hnflutter_challenge/domain/usecases/register_use_case.dart';
import 'package:hnflutter_challenge/presentation/cart/cart_viewmodel/cart_bloc.dart';
import 'package:hnflutter_challenge/presentation/home/home_viewmodel/home_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/datasource/local/preferences.dart';
import '../data/datasource/remote/dio_factory.dart';
import '../data/repository/auth_remote_repository.dart';
import '../data/repository/bakery_remote_repository.dart';
import '../domain/repository/auth_repository.dart';
import '../presentation/auth/login/login_viewmodel/login_bloc.dart';

final GetIt instance = GetIt.instance;

Future<void> configureDependencies() async {
  final sharedPrefs = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));


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

  instance.registerFactory<BasBakeryRemoteRepository>(
          () => BakeryRemoteRepositoryImp(instance()));

  instance.registerFactory<BakeryRepository>(
          () => BakeryRepositoryImp(instance()));

  instance.registerFactory<AllBakeryUseCase>(() => AllBakeryUseCase(instance()));


  instance.registerFactory<ViewProductsBloc>(() => ViewProductsBloc(instance()));
  //cart
  instance.registerFactory<CartBloc>(() => CartBloc(instance()));
}
