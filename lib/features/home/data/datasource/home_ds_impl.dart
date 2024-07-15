// ignore_for_file: avoid_print

import 'package:dartz/dartz.dart';
import 'package:jobfair_task/core/api/api_manager.dart';
import 'package:jobfair_task/core/api/endpoints.dart';
import 'package:jobfair_task/core/errors/failures.dart';
import 'package:jobfair_task/features/home/data/datasource/home_ds.dart';
import 'package:jobfair_task/features/home/data/models/product_model.dart';

class HomeDSImpl implements HomeDS {
  final ApiManager apiManager;

  HomeDSImpl(this.apiManager);

  @override
  Future<Either<Failures, ProductModel>> getProducts() async {
    try {
      var response = await apiManager.getData(EndPoints.products);

      ProductModel productModel = ProductModel.fromJson(response.data);
      if (response.data != null) {
        return Right(productModel);
      } else {
        throw Exception('No data received');
      }
    } catch (e) {
      print('Error occurred: $e');
      rethrow;
    }
  }
}
