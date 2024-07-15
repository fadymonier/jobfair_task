// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:jobfair_task/core/api/endpoints.dart';

class ApiManager {
  late Dio dio;

  ApiManager() {
    dio = Dio();
  }

  Future<Response?> getData(String apiUrl) async {
    try {
      var response = await dio.get(EndPoints.products);
      return response;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
