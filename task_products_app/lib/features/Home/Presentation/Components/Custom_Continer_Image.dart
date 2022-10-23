import 'package:flutter/material.dart';
import 'package:task_products_app/core/App_Method/App_Method.dart';
import 'package:task_products_app/core/Resours_Manger/Color_Manger.dart';

import '../../../../core/Resours_Manger/Values_Manger.dart';

class CustomContinerImage extends StatelessWidget {
  final double hight;
  final double width;
  final String image;
  final Color? color ;
  final double? raduis ;
  final double padding ;
  final  bool net ; // to check if image come from api or asset
 const  CustomContinerImage(
      {required this.width, required this.hight, required this.image, required this.net, required this.padding ,this.color ,  this.raduis , Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p8),
      child: Container(
        width: width,
        height: hight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(raduis??AppSize.s20)),
          boxShadow: AppMethod().boxShadow(),
          color: color??ColorManager.white,
        ),
        padding:EdgeInsets.all(padding),
        child:   net ?   Image(image: NetworkImage(image) ) : Image(image: AssetImage(image) )   ),// to check if image come from api or asset

      );

  }
}
