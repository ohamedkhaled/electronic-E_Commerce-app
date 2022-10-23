import 'package:equatable/equatable.dart';

abstract class ProductEvents extends Equatable{
  const ProductEvents();
}



class GetProductEvent extends ProductEvents{
  const GetProductEvent();
  @override
  List<Object?> get props => [];
}