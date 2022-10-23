

import 'package:equatable/equatable.dart';
import 'package:task_products_app/core/enums.dart';
import 'package:task_products_app/features/Home/Domin/Entities/Product_Entities.dart';

class ProductStates extends Equatable{

  final List<ProductEntities> listProductEntities ;
  final RequestState productsState ;
  final String massegeProducts ;

  const ProductStates(
      { this.listProductEntities= const [], this.productsState=RequestState.loading,this.massegeProducts=""});

  @override
  List<Object?> get props => [listProductEntities,productsState,massegeProducts];


}