import 'package:equatable/equatable.dart';

import '../../../../core/enums.dart';
import '../../Domin/Entities/Help_Entities.dart';




class HelpStates extends Equatable {
  final List<HelpEntities> listHelpData;
  final RequestState helpState;
  final String messageHelpData;



  const HelpStates(
      {this.listHelpData = const [],
      this.helpState = RequestState.loading,
      this.messageHelpData = "",
     });



  @override
  List<Object?> get props => [listHelpData,helpState,messageHelpData];


}
