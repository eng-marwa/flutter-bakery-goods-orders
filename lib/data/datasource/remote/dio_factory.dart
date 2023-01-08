import 'package:dio/dio.dart';
import 'package:flutter_pretty_dio_logger/flutter_pretty_dio_logger.dart';

import '../../../utils/constants/constants.dart';

class DioFactory {
  Future<Dio> getDio() async {
    Dio dio = Dio();
    Map<String, String> headers = {
      'content-Type': 'application/json',
      'accept': 'application/json',
    };
    dio.options = BaseOptions(
        baseUrl: baseUrl,
        headers: headers,
        receiveTimeout: timeOut,
        sendTimeout: timeOut);

    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
    ));

    return dio;
  }
}
