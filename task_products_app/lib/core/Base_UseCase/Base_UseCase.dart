import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class BaseUseCase<T,Parameters>{

  Future<Either<T,Exception>>  call(Parameters parameter );
}

class NoPrameters extends Equatable{

  const NoPrameters();

  @override
  List<Object?> get props =>[];


}