


import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_products_app/core/Base_UseCase/Base_UseCase.dart';
import 'package:task_products_app/core/enums.dart';
import 'package:task_products_app/features/Home/Domin/UseCases/Get_Products_UC.dart';
import 'package:task_products_app/features/Home/Presentation/Manger/Product_Events.dart';
import 'package:task_products_app/features/Home/Presentation/Manger/Product_States.dart';

class ProductBloc extends Bloc<ProductEvents,ProductStates>{

  final GetProductsUC getProductsUC ;

  ProductBloc({ required this.getProductsUC }) : super ( const ProductStates()){

    on<GetProductEvent>(getProducts);
  }

  FutureOr<void> getProducts(GetProductEvent event, Emitter<ProductStates> emit)  async{

         final result =await getProductsUC.call(NoPrameters());

         result.fold(
                 (l) => emit(ProductStates(listProductEntities: l,productsState: RequestState.loaded)),
                 (r) => emit(ProductStates(productsState: RequestState.error,massegeProducts: r.toString())));

  }
}