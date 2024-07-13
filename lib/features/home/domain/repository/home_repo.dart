import 'package:dartz/dartz.dart';
import 'package:jobfair_task/core/errors/failures.dart';
import 'package:jobfair_task/features/home/data/models/product_model.dart';

abstract class HomeRepo {
  Future<Either<Failures, ProductModel>> getProducts();
}
