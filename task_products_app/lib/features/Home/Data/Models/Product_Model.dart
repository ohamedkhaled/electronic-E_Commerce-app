import 'package:task_products_app/core/Resours_Manger/String_Manger.dart';
import 'package:task_products_app/features/Home/Domin/Entities/Product_Entities.dart';

class ProductModel extends ProductEntities {
  ProductModel(
      {required super.company,
      required super.name,
      required super.type,
      required super.price,
      required super.image,
      required super.description,
      required super.id});

  factory ProductModel.fromjason(Map<String, dynamic> jasonData) =>
      ProductModel(
          company: jasonData[StringManger.company],
          name: jasonData[StringManger.name],
          type: jasonData[StringManger.type],
          price: jasonData[StringManger.price],
          image: jasonData[StringManger.image],
          description: jasonData[StringManger.description],
          id: jasonData[StringManger.id]);


   Map<String,dynamic> tojason()=>
    { StringManger.id:this.id , StringManger.company: this.company , StringManger.name:this.name ,
      StringManger.type :this.type,StringManger.price:this.price,StringManger.image :this.image,
      StringManger.description: this.description } ;


}
