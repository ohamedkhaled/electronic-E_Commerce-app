
import 'package:task_products_app/core/App_Constant.dart';
import 'package:task_products_app/core/Resours_Manger/String_Manger.dart';
import 'package:task_products_app/features/Help/Data/Model/Help_Model.dart';

import '../../../../core/Api_Respons/Api.dart';

abstract class BaseRemotedDataSourceHelp{


 Future <List<HelpModel>>  getHelpData();
}


class RemotedDataSourceHelp extends BaseRemotedDataSourceHelp{



  @override
  Future<List<HelpModel>> getHelpData() async {
    Map<String,dynamic> jasonData = await Api().Get(Url: AppConstant.helpUrl);

    List<HelpModel> listHelpModel =[];

    for(int i=0 ;i<jasonData[StringManger.help].length;i++){
      listHelpModel.add(HelpModel.fromjason(jasonData[StringManger.help][i]));
    }

    return listHelpModel ;
  }


}