

import 'package:flutter/material.dart';
import 'package:task_products_app/core/App_Constant.dart';
import 'package:task_products_app/core/Resours_Manger/Color_Manger.dart';
import 'package:task_products_app/core/Resours_Manger/Font_Manger.dart';
import 'package:task_products_app/core/Resours_Manger/String_Manger.dart';
import 'package:task_products_app/core/Responsive_Ui/Config_Size.dart';

import '../../../../core/Resours_Manger/Values_Manger.dart';


class CustomDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Divider(
          height: ConfigSize.defaultSize!*AppSize.s7_5,
          thickness: AppSize.s1,
          color:ColorManager.scandry ,
          indent: AppSize.s35,
          endIndent: AppSize.s35,

        ),
        Padding(
          padding: const EdgeInsets.only(top: AppSize.s24),
          child: Center(child: Container(
              color: Colors.white,
              child: Text(StringManger.or,style:Theme.of(context).textTheme.labelLarge,))),
        )

      ],
    );
  }



}