import 'package:dartz/dartz.dart';
import 'package:jobfair_task/core/errors/failures.dart';
import 'package:jobfair_task/features/home/data/models/product_model.dart';
import 'package:jobfair_task/features/home/domain/repository/home_repo.dart';

class GetProductsUseCase {
  HomeRepo repo;
  GetProductsUseCase(this.repo);

  Future<Either<Failures, ProductModel>> call() => repo.getProducts();
}
