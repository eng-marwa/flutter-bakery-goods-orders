import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hnflutter_challenge/app/failure.dart';
import 'package:hnflutter_challenge/data/model/Bakery.dart';
import 'package:hnflutter_challenge/data/model/auth.dart';
import 'package:hnflutter_challenge/domain/entity/product.dart';
import 'package:hnflutter_challenge/domain/entity/user.dart';
import 'package:hnflutter_challenge/utils/mapper/mapper.dart';

abstract class ApiServices {
  Future<Either<Failure, User>> login(String email, String password);

  Future<Either<Failure, User>> register(String email, String password);

  Future<Either<Failure, String>> logout();

  Future<Either<Failure, List<Product>>> all();
}

class ApiServiceImp extends ApiServices {
  Dio _dio;

  ApiServiceImp(this._dio);

  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    String url = 'auth/login';
    Response response = await _dio.post(url,data: {"email":email,"password":password});
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
  Future<Either<Failure, List<Product>>> all() async {
    String url = 'bakery/all';
    Response response = await _dio.get(url);
    if (response.statusCode == 200) {
      List<BakeryResponse>? list =  (json.decode(response.data) as List).map((i) => BakeryResponse.fromJson(i)).toList();
      List<Product> products = list.map((element)=> element.toDomain()).toList();
      return Right(products);
    } else {
      return Left(Failure(
          code: response.statusCode!, message: response.statusMessage!));
    }
  }
}
