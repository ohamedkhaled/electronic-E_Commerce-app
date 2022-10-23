
import 'package:dartz/dartz.dart';

import '../Entities/Product_Entities.dart';

abstract class BaseRepositoryProduct{


  Future<Either<List<ProductEntities>,Exception>> getProduct();
}