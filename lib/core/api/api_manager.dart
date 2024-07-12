import 'package:dio/dio.dart';
import 'package:jobfair_task/core/api/endpoints.dart';

class ApiManager {
  late Dio dio;

  ApiManager() {
    dio = Dio();
  }

  Future<Response> getData(String endPoint) {
    return dio.get(EndPoints.products);
  }
}
