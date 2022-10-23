

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_products_app/features/Home/Data/Models/Product_Model.dart';

import '../../../../core/Resours_Manger/String_Manger.dart';

abstract class BaseLocalDataSource {
  Future<List<ProductModel>> getCachedPosts();
  Future<Unit> ChachedPostes(List<ProductModel> productModel);
}


class LocalDataSource extends BaseLocalDataSource{

  final SharedPreferences sharedPreferences;

  LocalDataSource({required this.sharedPreferences});



  @override
  Future<Unit> ChachedPostes(List<ProductModel> productModel) {
    List  productModelToJason = productModel.map<Map<String,dynamic>>((e) => e.tojason()).toList();
    sharedPreferences.setString( StringManger.cachedProduct, json.encode(productModelToJason));

    return Future.value(unit);
  }

  @override
  Future<List<ProductModel>> getCachedPosts() {

    final jasonData = sharedPreferences.getString(StringManger.cachedProduct);

    if(jasonData!=null){
      List jasonDecoded = json.decode(jasonData);
      List<ProductModel> jasonToProductModel =
      jasonDecoded.map<ProductModel>((e) => ProductModel.fromjason(e)).toList();
      return   Future.value(jasonToProductModel) ;
    }else{
      throw Exception("not found Data");
    }


  }

}