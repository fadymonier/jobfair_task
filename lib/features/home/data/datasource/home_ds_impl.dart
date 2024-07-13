import 'package:jobfair_task/core/api/api_manager.dart';
import 'package:jobfair_task/core/api/endpoints.dart';
import 'package:jobfair_task/features/home/data/datasource/home_ds.dart';
import 'package:jobfair_task/features/home/data/models/product_model.dart';

class HomeDSImpl implements HomeDS {
  @override
  Future<ProductModel> getProducts() async {
    ApiManager apiManager = ApiManager();

    var response = await apiManager.getData(EndPoints.products);

    ProductModel productsModel = ProductModel.fromJson(response.data);

    return productsModel;
  }
}
