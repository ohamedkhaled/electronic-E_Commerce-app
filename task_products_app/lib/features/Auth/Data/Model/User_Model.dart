import 'package:task_products_app/core/Resours_Manger/String_Manger.dart';
import 'package:task_products_app/features/Auth/Domin/Entities/User_Entities.dart';

class UserModel extends UserEntities{


  UserModel({required super.message, required super.status ,super.code});


 factory  UserModel.fromjason( Map<String,dynamic> jasonData ) =>
       UserModel(message: jasonData[StringManger.message], status: jasonData[StringManger.status],
       code: jasonData[StringManger.code]??"0") ;



Map<String,dynamic> tojason()=>
    { StringManger.message:this.message ,
      StringManger.status: this.status ,
      StringManger.code:this.code} ;
}