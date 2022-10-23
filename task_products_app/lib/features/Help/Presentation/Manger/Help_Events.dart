import 'package:equatable/equatable.dart';

abstract class HelpEvents extends Equatable {

  const HelpEvents();

  @override
  List<Object?> get props =>[];
}

class GetHelpEvent extends HelpEvents {}
