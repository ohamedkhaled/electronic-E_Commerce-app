import 'package:dartz/dartz.dart';
import 'package:task_products_app/core/Network/Connection_Checker.dart';
import 'package:task_products_app/features/Home/Data/DataSource/Local_Data_Source.dart';
import 'package:task_products_app/features/Home/Data/DataSource/Remote_Data_Source.dart';
import 'package:task_products_app/features/Home/Domin/Base_Repository/Base_Repository_Product.dart';
import 'package:task_products_app/features/Home/Domin/Entities/Product_Entities.dart';

class RepositoryImpProduct extends BaseRepositoryProduct {
  final BaseRemotedDataSourceProduct baseRemotedDataSourceProduct;
  final BaseLocalDataSource baseLocalDataSource;
  final BaseConnectionChecker baseConnectionChecker;

  RepositoryImpProduct(
      {required this.baseRemotedDataSourceProduct,
      required this.baseLocalDataSource,
      required this.baseConnectionChecker});

  @override
  Future<Either<List<ProductEntities>, Exception>> getProduct() async {
    if (await baseConnectionChecker.getConnectionCkecker()) {
      try {
        final productModel = await baseRemotedDataSourceProduct.getProduct(); // get data from Api
        baseLocalDataSource.ChachedPostes(productModel); // cashed data in shared prefrence
        return Left(productModel);
      } catch (e) {
        return Right(Exception(e.toString()));
      }
    } else {
      try {
        final result = await baseLocalDataSource.getCachedPosts();  //get data from shared prefrence
        return Left(result);
      } catch (e) {
        return Right(Exception(e.toString()));
      }
    }
  }
}
