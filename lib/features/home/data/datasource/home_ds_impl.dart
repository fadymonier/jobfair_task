// ignore_for_file: avoid_print

import 'package:jobfair_task/core/api/api_manager.dart';
import 'package:jobfair_task/core/api/endpoints.dart';
import 'package:jobfair_task/features/home/data/datasource/home_ds.dart';
import 'package:jobfair_task/features/home/data/models/product_model.dart';

class HomeDSImpl implements HomeDS {
  final ApiManager apiManager;

  HomeDSImpl(this.apiManager);

  @override
  Future<ProductModel> getProducts() async {
    try {
      var response = await apiManager.getData(EndPoints.products);

      if (response?.data != null) {
        return ProductModel.fromJson(response?.data);
      } else {
        throw Exception('No data received');
      }
    } catch (e) {
      print('Error occurred: $e');
      rethrow;
    }
  }
}
