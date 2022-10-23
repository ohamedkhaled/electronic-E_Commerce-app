
import 'package:task_products_app/core/Resours_Manger/String_Manger.dart';
import 'package:task_products_app/features/Help/Domin/Entities/Help_Entities.dart';

class HelpModel extends HelpEntities{
  
  HelpModel({required super.id, required super.question, required super.answer});

  
  factory HelpModel.fromjason( Map<String, dynamic> jasonData ){
    return HelpModel(id: jasonData[StringManger.id], question: jasonData[StringManger.question],answer: jasonData[StringManger.answer]) ;
}


}