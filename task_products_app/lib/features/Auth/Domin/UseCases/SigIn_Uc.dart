
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:task_products_app/core/Base_UseCase/Base_UseCase.dart';
import 'package:task_products_app/features/Auth/Domin/Base_Repository/Base_Repository.dart';
import 'package:task_products_app/features/Auth/Domin/Entities/User_Entities.dart';

class SigInUc extends BaseUseCase<UserEntities,UserParameter>{


final BaseRepository baseRepository ;


  SigInUc({required this.baseRepository});

  @override
  Future<Either<UserEntities, Exception>> call(UserParameter parameter) async {
    final result= await baseRepository.sigIn(parameter.name,parameter.phoneNumber);
    print(" SigInUc.....$result");
    return result ;
  }


}






class UserParameter extends Equatable {
  final int phoneNumber;
  final String name;

  const UserParameter({required this.phoneNumber, required this.name});

  @override
  List<Object?> get props => [name,phoneNumber];

}
