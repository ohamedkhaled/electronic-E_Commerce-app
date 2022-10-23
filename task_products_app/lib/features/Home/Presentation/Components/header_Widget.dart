import 'package:flutter/material.dart';
import 'package:task_products_app/core/Resours_Manger/Font_Manger.dart';
import 'package:task_products_app/core/Resours_Manger/String_Manger.dart';
import 'package:task_products_app/core/Resours_Manger/Values_Manger.dart';

import '../../../../core/App_Method/App_Method.dart';
import '../../../../core/Resours_Manger/Assets_Path.dart';
import '../../../../core/Resours_Manger/Color_Manger.dart';
import '../../../../core/Responsive_Ui/Config_Size.dart';
import '../../../Auth/Presentation/Components/Icon_Widget.dart';

class HeaderWidget extends StatelessWidget {

  final String path ;
  final String text ;
  final Color? backgroundColor ;
  final Color? textColor ;

  const HeaderWidget({ this.backgroundColor,this.textColor,required this.path,required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ConfigSize.defaultSize! * AppSize.s14_5,
      height: ConfigSize.defaultSize! * AppSize.s5_7,
      decoration: BoxDecoration(
          color: backgroundColor ??ColorManager.white,
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s30)),
          boxShadow: AppMethod().boxShadow()),
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
          child: IconWidget(
            path: path,
            size: AppSize.s4_8,
          ),
        ),
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
          child:  Text(text,
            style: TextStyle(color: textColor??ColorManager.darkGrey, fontSize: FontSize.s18),
          ),
        )
      ]),
    );
  }
}
