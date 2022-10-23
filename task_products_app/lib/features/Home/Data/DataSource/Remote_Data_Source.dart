import 'package:task_products_app/core/App_Constant.dart';
import 'package:task_products_app/core/Resours_Manger/String_Manger.dart';
import 'package:task_products_app/features/Home/Data/Models/Product_Model.dart';

import '../../../../core/Api_Respons/Api.dart';

abstract class BaseRemotedDataSourceProduct {
  Future<List<ProductModel>> getProduct();
}

class RemotedDataSourceProduct extends BaseRemotedDataSourceProduct {
  @override
  Future<List<ProductModel>> getProduct() async {
    Map<String, dynamic> jasonData =
        await Api().Get(Url: AppConstant.productsUrl);
    List<ProductModel> listProductModel = [];

    for (int i = 0; i < jasonData[StringManger.products].length; i++) {
      listProductModel
          .add(ProductModel.fromjason(jasonData[StringManger.products][i]));
    }

    return listProductModel;
  }
}
