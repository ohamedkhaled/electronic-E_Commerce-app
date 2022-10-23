



import 'package:flutter/material.dart';

import '../../../../core/App_Method/App_Method.dart';
import '../../../../core/Resours_Manger/Color_Manger.dart';

class CustomIconBox extends StatelessWidget {
  final String path ;
  const CustomIconBox({required this.path , Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: AppMethod().boxShadow(),
          image:
          DecorationImage(image: AssetImage(path)),
        ));
  }
}
