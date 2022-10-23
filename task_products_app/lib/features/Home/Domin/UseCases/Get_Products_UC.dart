import 'package:dartz/dartz.dart';
import 'package:task_products_app/core/Base_UseCase/Base_UseCase.dart';
import 'package:task_products_app/features/Home/Domin/Base_Repository/Base_Repository_Product.dart';
import 'package:task_products_app/features/Home/Domin/Entities/Product_Entities.dart';



class GetProductsUC extends BaseUseCase<List<ProductEntities>,NoPrameters>{

  BaseRepositoryProduct baseRepositoryProduct ;


  GetProductsUC({required this.baseRepositoryProduct});

  @override
  Future<Either<List<ProductEntities>, Exception>> call(NoPrameters parameter)async {
    final result =await baseRepositoryProduct.getProduct();
    return result ;
  }

}