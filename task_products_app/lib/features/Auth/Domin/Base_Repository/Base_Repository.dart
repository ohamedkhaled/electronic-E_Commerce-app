
import 'package:dartz/dartz.dart';
import 'package:task_products_app/features/Auth/Domin/Entities/User_Entities.dart';
import 'package:task_products_app/features/Auth/Domin/Entities/Verify_Entities.dart';

abstract class BaseRepository {


  Future<Either<UserEntities,Exception>> sigIn(String name , int phoneNumber );
  Future<Either<VerifyEntities,Exception>> VerifyPhone( int code, int phoneNumber);
}