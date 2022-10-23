
import 'package:task_products_app/core/App_Constant.dart';
import 'package:task_products_app/features/Auth/Data/Model/User_Model.dart';
import 'package:task_products_app/features/Auth/Data/Model/Verify_Model.dart';
import 'package:task_products_app/features/Auth/Domin/Entities/User_Entities.dart';
import 'package:task_products_app/features/Auth/Domin/Entities/Verify_Entities.dart';

import '../../../../core/Api_Respons/Api.dart';

abstract class BaseRemotedDataSource {

Future<UserEntities> sigin(String name,int phone);
Future<VerifyEntities> verifyPhoneNumber( int phoneNumber ,int code );

}


class RemotedDataSource extends BaseRemotedDataSource{
  

  @override
  Future<UserEntities> sigin(String name, int phoneNumber) async  {

    Map<String,dynamic> jasonData =
         await Api().Post(Url: AppConstant().getSiginUrl(phoneNumber: phoneNumber,name: name));

    UserModel userModel =UserModel.fromjason(jasonData) ;
    return userModel;

  }

  @override
  Future<VerifyEntities> verifyPhoneNumber(int phoneNumber, int code) async {
    Map<String,dynamic> jasonData =
        await Api().Post(Url: AppConstant().getOtpUrl(code: code, phoneNumber: phoneNumber));
    VerifyModel verifyModel =VerifyModel.fromjason(jasonData) ;

    return verifyModel;
  }



}

