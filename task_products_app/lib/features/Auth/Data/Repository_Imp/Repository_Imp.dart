
import 'package:dartz/dartz.dart';
import 'package:task_products_app/features/Auth/Data/Data_Sources/Remoted_Data_Source.dart';
import 'package:task_products_app/features/Auth/Domin/Base_Repository/Base_Repository.dart';
import 'package:task_products_app/features/Auth/Domin/Entities/User_Entities.dart';
import 'package:task_products_app/features/Auth/Domin/Entities/Verify_Entities.dart';

class RepositoryImp extends BaseRepository{

  final BaseRemotedDataSource baseRemotedDataSource ;


  RepositoryImp({ required this.baseRemotedDataSource});




  @override
  Future<Either<UserEntities, Exception>> sigIn(String name, int phoneNumber) async {
   try{
     return Left( await baseRemotedDataSource.sigin(name, phoneNumber));

   }catch(e){
    return Right( Exception(e.toString()));
   }


  }



  @override
  Future<Either<VerifyEntities, Exception>> VerifyPhone(int code, int phoneNumber) async {
    try{
      return Left( await baseRemotedDataSource.verifyPhoneNumber(phoneNumber, code));
    }catch(e){
    return Right( Exception(e.toString()));
    }
  }



}