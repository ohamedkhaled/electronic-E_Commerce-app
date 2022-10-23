import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_products_app/core/App_Method/App_Method.dart';
import 'package:task_products_app/core/Responsive_Ui/Config_Size.dart';

import '../../../../core/Resours_Manger/Color_Manger.dart';
import '../../../../core/Resours_Manger/Values_Manger.dart';

class CustomBox extends StatelessWidget {
  final void Function(String)? change ;
  const CustomBox({ required this.change, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: ConfigSize.defaultSize!*AppSize.s9,
      width: ConfigSize.defaultSize!*AppSize.s8,
      decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s20)),
          boxShadow:AppMethod().boxShadow()
      ),
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p10)
      ,child: TextFormField(
      validator: (value)
      {
        if(value!.isEmpty)
        {
          return "";
        }
      },
      onChanged:change,
      style: Theme.of(context).textTheme.displayLarge,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSize.s20),
              borderSide: BorderSide(
                  color: ColorManager.white
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSize.s20),
              borderSide: BorderSide(
                  color: ColorManager.white
              )
          )
      ),

      inputFormatters: [
        LengthLimitingTextInputFormatter(AppIntValues.i1),
        FilteringTextInputFormatter.digitsOnly,
      ],

    ),
    );
  }

}

