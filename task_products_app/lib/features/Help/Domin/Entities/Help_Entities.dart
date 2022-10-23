

import 'package:equatable/equatable.dart';

class HelpEntities extends Equatable{
  final int id ;
  final String question;
  final String answer ;

  HelpEntities({ required this.id, required  this.question,required  this.answer});

  @override
  List<Object?> get props => [id,question,answer];


}