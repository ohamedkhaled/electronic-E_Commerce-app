

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:task_products_app/core/Base_UseCase/Base_UseCase.dart';
import 'package:task_products_app/features/Auth/Domin/Base_Repository/Base_Repository.dart';
import 'package:task_products_app/features/Auth/Domin/Entities/Verify_Entities.dart';

class VerifyUC extends BaseUseCase<VerifyEntities,VerifyParameter>{

  final BaseRepository baseRepository ;


  VerifyUC({required this.baseRepository});

  @override
  Future<Either<VerifyEntities, Exception>> call(VerifyParameter parameter) async {


    final result= await baseRepository.VerifyPhone(parameter.code,parameter.phoneNumber);
    print(" VerifyUC.....$result");
    return result ;
  }


}



class VerifyParameter extends Equatable {
  final int phoneNumber;
  final int code;

  const VerifyParameter({required this.phoneNumber, required this.code});

  @override
  List<Object?> get props => [code,phoneNumber];

}