

import 'package:task_products_app/features/Auth/Domin/Entities/Verify_Entities.dart';

import '../../../../core/Resours_Manger/String_Manger.dart';

class VerifyModel extends VerifyEntities{

  VerifyModel({required super.message, required super.status,});


factory  VerifyModel.fromjason( Map<String,dynamic> jasonData ) {

  return VerifyModel(message: jasonData[StringManger.message], status: jasonData[StringManger.status]) ;

}

Map<String,dynamic> tojason()=>
    { StringManger.message:this.message ,
      StringManger.status: this.status ,
    } ;
}