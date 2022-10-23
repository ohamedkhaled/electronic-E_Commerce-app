
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_products_app/core/Base_UseCase/Base_UseCase.dart';
import 'package:task_products_app/core/enums.dart';
import 'package:task_products_app/features/Help/Domin/UseCases/Get_Help_UC.dart';

import 'Help_Events.dart';
import 'Help_States.dart';



class HelpBloc extends Bloc<HelpEvents,HelpStates>{
 final GetHelpUC getHelpUC ;

 HelpBloc({ required this.getHelpUC,
   }) : super ( const HelpStates()){


     on<GetHelpEvent>(getHelpData);


  }




  FutureOr<void> getHelpData(GetHelpEvent event, Emitter<HelpStates> emit)async {
      final result = await getHelpUC(const NoPrameters()) ; //callble method
      result.fold((l) =>
          emit( HelpStates(listHelpData: l,helpState: RequestState.loaded) )
          , (r) => emit( HelpStates( helpState: RequestState.error ,messageHelpData: r.toString()) ));
    }




}
