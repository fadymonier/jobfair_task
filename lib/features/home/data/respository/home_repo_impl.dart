import 'package:dartz/dartz.dart';
import 'package:jobfair_task/core/errors/failures.dart';
import 'package:jobfair_task/features/home/data/datasource/home_ds.dart';
import 'package:jobfair_task/features/home/data/models/product_model.dart';
import 'package:jobfair_task/features/home/domain/repository/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  HomeDS ds;
  HomeRepoImpl(this.ds);

  @override
  Future<Either<Failures, ProductModel>> getProducts() async {
    try {
      var result = await ds.getProducts();

      return Right(result);
    } catch (e) {
      return Left(RemoteFailures(e.toString()));
    }
  }
}
