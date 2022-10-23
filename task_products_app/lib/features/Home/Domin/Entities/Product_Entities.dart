
import 'package:equatable/equatable.dart';

class ProductEntities extends Equatable{

  final String company ;
  final String name ;
  final String type ;
  final String price ;
  final String image ;
  final String description ;
  final int id ;

  ProductEntities(
      {required this.company,
      required this.name,
      required this.type,
      required this.price,
      required this.image,
      required this.description,
      required this.id});

  @override
  List<Object?> get props => [company,name,type,price,image,id,description];
}