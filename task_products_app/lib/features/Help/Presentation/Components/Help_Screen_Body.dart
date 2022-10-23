import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_products_app/core/App_Method/App_Method.dart';
import 'package:task_products_app/core/Responsive_Ui/Config_Size.dart';
import 'package:task_products_app/features/Help/Presentation/Components/Custom_QA_Widget.dart';
import 'package:task_products_app/features/Help/Presentation/Manger/Help_States.dart';
import 'package:task_products_app/features/Help/Presentation/Manger/Help_bloc.dart';
import '../../../../core/Resours_Manger/Routs_Manger.dart';
import '../../../../core/Resours_Manger/String_Manger.dart';
import '../../../../core/Resours_Manger/Values_Manger.dart';
import '../../../../core/Widgets/Loading_Widget.dart';
import '../../../../core/enums.dart';
import '../../../../core/Widgets/Custom_Button.dart';
import '../../../../core/Widgets/Error_Widget.dart';



class HelpScreenBody extends StatelessWidget {
  const HelpScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HelpBloc,HelpStates>(
        buildWhen: (previous, current)=> previous.helpState != current.helpState,
        builder: (BuildContext context, state) {
          switch(state.helpState){
            case RequestState.loaded:
              return ListView(
                  children:[
                    Container(
                      height: 800,
                      width: ConfigSize.screenWidth,
                      decoration: BoxDecoration(
                        gradient: AppMethod().background(),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Spacer(flex: AppIntValues.i1,),
                          Text(
                            StringManger.helpHeader,
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          const Spacer(flex: AppIntValues.i1,),
                          for(int i=AppIntValues.i0 ;i<state.listHelpData.length;i++) //get data from api
                             Padding(
                                padding: const EdgeInsets.all(AppPadding.p8),
                                child:CustomQAwidget(answer: state.listHelpData[i].answer ,
                                  question: state.listHelpData[i].question,
                                )
                            ),


                          const Spacer(flex:AppIntValues.i3 ,),
                           Padding(
                              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
                              child: CustomButton(
                                raduis: AppSize.s25,
                                text: StringManger.continue_, onSavd: (){
                                Navigator.pushReplacementNamed(context, Routes.homeRoute);
                              })),
                          const Spacer(flex: AppIntValues.i1,),
                        ],
                      ),
                    ),
                  ]
              );
            case RequestState.loading:
             return const LoadingWidget();
            case RequestState.error:
              return Error_Widget(message: state.messageHelpData);
          }

        }
    );




  }


}



