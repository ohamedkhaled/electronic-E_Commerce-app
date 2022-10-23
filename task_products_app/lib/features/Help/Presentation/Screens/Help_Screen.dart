

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_products_app/core/Server_Locator/Server_Locator.dart';
import 'package:task_products_app/features/Help/Presentation/Components/Help_Screen_Body.dart';
import 'package:task_products_app/features/Help/Presentation/Manger/Help_Events.dart';
import '../../../../core/Responsive_Ui/Config_Size.dart';
import '../Manger/Help_bloc.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context)=>getIt<HelpBloc>()..add(GetHelpEvent()),
      child:const Scaffold(
        body:HelpScreenBody() ,
      ) ,
    );


  }
}
