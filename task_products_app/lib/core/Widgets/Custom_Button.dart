import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_products_app/core/Resours_Manger/Color_Manger.dart';
import 'package:task_products_app/core/Resours_Manger/Values_Manger.dart';
import 'package:task_products_app/core/Responsive_Ui/Config_Size.dart';

class CustomButton extends StatelessWidget {
  final double raduis;
  final String text;
  final ValueGetter? onSavd ;
  //void Function(String?)?

  const CustomButton({required this.raduis, required this.text,this.onSavd,Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: ColorManager.error,
      splashColor: ColorManager.error,
      onTap: onSavd,
      child: Container(
        width: double.infinity,
        height: ConfigSize.defaultSize! * AppSize.s6,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0D47A1),
              Color(0xFF1976D2),
              Color(0xFF42A5F5),
            ], // red to yellow
          ),
          borderRadius: BorderRadius.all(Radius.circular(raduis)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
