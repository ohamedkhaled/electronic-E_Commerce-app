import 'package:flutter/material.dart';
import 'package:task_products_app/core/App_Constant.dart';
import 'package:task_products_app/core/Resours_Manger/Color_Manger.dart';
import 'package:task_products_app/core/Resours_Manger/String_Manger.dart';
import 'package:task_products_app/core/Resours_Manger/Values_Manger.dart';


class CustomTextField extends StatelessWidget {

 final String hint ;
 final  void  Function(String?)? onClick;
 final Icon? icon ;
 final double size ;
 final TextInputType? textInputType ;


 String _errorMassege(String str){
    switch(str)
    {
      case StringManger.enteryourFullName :return StringManger.nameIsEmpty;
      case StringManger.enteryourPhoneNumber :return StringManger.phoneNumberIsEmpty;
    }
    return "";
  } // to print message error
  const CustomTextField( {this.onClick , required this.hint ,this.icon ,required this.size ,required this.textInputType});

  @override
  Widget build(BuildContext context) {

    return Padding( padding: const EdgeInsets.symmetric(horizontal: AppPadding.p25),
        child:TextFormField(
          validator: (value)
          {
            if(value!.isEmpty)
            {
              return _errorMassege(hint);
            }
          } ,
          onSaved: onClick,
          cursorColor: ColorManager.scandry,
          keyboardType: textInputType,
          decoration: InputDecoration(
            hintText: hint,
            suffixIcon: icon,
            hintStyle: Theme.of(context).textTheme.titleSmall,
            filled: true,
            fillColor:ColorManager.white,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(size),
                borderSide: BorderSide(
                    color: ColorManager.white
                )
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(size),
                borderSide: BorderSide(
                    color: ColorManager.white
                )
            ),
            border:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(size),
                borderSide: BorderSide(
                    color: ColorManager.white
                )
            ),
              errorBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: ColorManager.white,),
                    borderRadius: BorderRadius.all(Radius.circular(size)))

          ),

        )
    );
  }


}