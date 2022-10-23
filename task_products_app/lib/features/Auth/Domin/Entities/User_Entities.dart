
import 'package:equatable/equatable.dart';

class UserEntities extends Equatable{
final int status ;
final String  message ;
final String? code;

UserEntities({required this.message,required this.status ,this.code});

  @override
  List<Object?> get props => [message,code,status];


}