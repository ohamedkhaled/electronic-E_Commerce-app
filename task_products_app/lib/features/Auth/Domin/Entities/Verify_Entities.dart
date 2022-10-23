
import 'package:equatable/equatable.dart';

class VerifyEntities extends Equatable {

  final int status ;
  final String  message ;


  VerifyEntities({required this.message,required this.status });

  @override
  List<Object?> get props => [message,status];
}