import 'package:flutter/material.dart';
import 'package:task_products_app/core/App_Method/App_Method.dart';
import '../../../../core/Resours_Manger/Color_Manger.dart';
import '../../../../core/Resours_Manger/Values_Manger.dart';
import '../../../../core/Responsive_Ui/Config_Size.dart';

class CustomQAwidget extends StatefulWidget {
  final String answer ;
  final String question ;
  const CustomQAwidget({required this.question,required this.answer, Key? key}) : super(key: key);

  @override
  _CustomQAwidgetState createState() => _CustomQAwidgetState( answer: answer,question: question);
}

class _CustomQAwidgetState extends State<CustomQAwidget> {
  final String answer ;
  final String question ;
  bool visible= false ;

  _CustomQAwidgetState({required this.answer, required this.question});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ConfigSize.screenWidth,
      decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s20)),
          boxShadow: AppMethod().boxShadow()),
      padding: const EdgeInsets.symmetric(horizontal: AppSize.s8, vertical: AppSize.s6),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(question, style: Theme.of(context).textTheme.headlineMedium),

              IconButton(
                  onPressed: (){
                    setState(() {
                      if(visible){
                        visible=false ;
                      }else{
                        visible=true ;
                      }
                    });
                  },
                  icon: visible
                      ? Icon(Icons.arrow_upward, color: ColorManager.darkGrey)
                      : Icon(Icons.arrow_downward,
                          color: ColorManager
                              .darkGrey)) // choose btw uparrow and downarro
            ],
          ),

          Visibility(
              visible: visible,
              child: Text(
                answer,
                style: Theme.of(context).textTheme.bodyLarge,
              )) // answer will be visible when visible=true
        ],
      ),
    );
  }
}
