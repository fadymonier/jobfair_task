import 'package:jobfair_task/features/home/data/models/product_model.dart';

abstract class HomeDS {
  Future<ProductModel> getProducts();
}
