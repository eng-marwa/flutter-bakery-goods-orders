import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hnflutter_challenge/app/failure.dart';
import 'package:hnflutter_challenge/data/model/auth_model.dart';
import 'package:hnflutter_challenge/domain/entity/Bakery.dart';
import 'package:hnflutter_challenge/domain/entity/product.dart';
import 'package:hnflutter_challenge/domain/entity/user.dart';
import 'package:hnflutter_challenge/utils/mapper/mapper.dart';
import 'package:hnflutter_challenge/utils/some_data.dart';
import 'package:hnflutter_challenge/domain/entity/order.dart' as order;

bool responseStatus = true;

abstract class ApiServices {
  Future<Either<Failure, User>> login(String email, String password);

  Future<Either<Failure, User>> register(String email, String password);

  Future<Either<Failure, String>> logout();

  Future<Either<Failure, List<Product>>> viewListOfProduct(int bakeryId);

  Future<Either<Failure, List<Bakery>>> filterByType(String type);

  Future<Either<Failure, Bakery?>> viewBakeryProfile(int id);

  Future<Either<Failure, List<Bakery>>> viewListOfBakeries();

  Future<Either<Failure,bool>> cancelOrder(orderId);

  Future<Either<Failure,bool>> rateOrder(int? orderId, int? rate);

  Future<Either<Failure, List<order.Order>>> viewMemberOrders();

  Future<Either<Failure,bool>> makeOrder(order.Order order);
}

class ApiServiceImp extends ApiServices {
  Dio _dio;

  ApiServiceImp(this._dio);

  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    String url = 'auth/login';
    Response response =
        await _dio.post(url, data: {"email": email, "password": password});
    if (response.statusCode == 200) {
      final authResponse = AuthResponse.fromJson(response.data);
      UserData? userData = authResponse.user;
      return Right(userData.toDomain());
    } else {
      return Left(Failure(
          code: response.statusCode!, message: response.statusMessage!));
    }
  }

  @override
  Future<Either<Failure, User>> register(String email, String password) async {
    String url = 'auth/register';
    Response response = await _dio.post(url);
    if (response.statusCode == 200) {
      final authResponse = AuthResponse.fromJson(response.data);
      UserData? userData = authResponse.user;
      return Right(userData.toDomain());
    } else {
      return Left(Failure(
          code: response.statusCode!, message: response.statusMessage!));
    }
  }

  @override
  Future<Either<Failure, String>> logout() async {
    String url = 'logout';
    Response response = await _dio.post(url);
    if (response.statusCode == 200) {
      final authResponse = AuthResponse.fromJson(response.data);
      return Right(authResponse.message!);
    } else {
      return Left(Failure(
          code: response.statusCode!, message: response.statusMessage!));
    }
  }

  @override
  Future<Either<Failure, List<Bakery>>> filterByType(String type) async {
    if (responseStatus) {
      List<Bakery> list =
          useTypeFilter(type).map((element) => element.toDomain()).toList();
      return Right(list);
    } else {
      return Left(Failure(code: 422, message: 'error message'));
    }
  }

  @override
  Future<Either<Failure, Bakery?>> viewBakeryProfile(int id) async {
    if (responseStatus) {
      return Right(viewProfile(id)?.toDomain());
    } else {
      return Left(Failure(code: 422, message: 'error message'));
    }
  }

  @override
  Future<Either<Failure, List<Bakery>>> viewListOfBakeries() async {
    if (responseStatus) {
      List<Bakery> list =
          listOfBakeries.map((element) => element.toDomain()).toList();
      return Right(list);
    } else {
      return Left(Failure(code: 422, message: 'error message'));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> viewListOfProduct(int bakeryId) async {
    if (responseStatus) {
      List<Product> products = getListOfProducts(bakeryId);
      return Right(products);
    } else {
      return Left(Failure(code: 422, message: 'error message'));
    }
  }

  @override
  Future<Either<Failure,bool>> cancelOrder(orderId) async{
    if (responseStatus) {
      return Right(true);
    } else {
      return Left(Failure(code: 422, message: 'error message'));
    }
  }

  @override
  Future<Either<Failure,bool>>makeOrder(order.Order order) async{
    if (responseStatus) {
      return Right(true);
    } else {
      return Left(Failure(code: 422, message: 'error message'));
    }
  }

  @override
  Future<Either<Failure,bool>> rateOrder(int? orderId, int? rate) async{
    if (responseStatus) {
      return Right(true);
    } else {
      return Left(Failure(code: 422, message: 'error message'));
    }
  }

  @override
  Future<Either<Failure, List<order.Order>>> viewMemberOrders() async{
    if (responseStatus) {
      List<order.Order> orders = getOrderList();
      return Right(order.Order);
    } else {
      return Left(Failure(code: 422, message: 'error message'));
    }
  }
}
