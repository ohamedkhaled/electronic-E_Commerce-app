import 'package:flutter/material.dart';
import 'package:task_products_app/core/Resours_Manger/Assets_Path.dart';
import 'package:task_products_app/core/Resours_Manger/Color_Manger.dart';
import 'package:task_products_app/core/Responsive_Ui/Config_Size.dart';
import '../../../../core/Resours_Manger/Values_Manger.dart';
import 'Icon_Widget.dart';

class RowSiginWidget extends StatelessWidget {
  const RowSiginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ConfigSize.screenWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconWidget(
            path: AssetsPath.pathLogoFaceBook,
            color:  ColorManager.primary,
            size: AppSize.s6,
          ),
          IconWidget(path: AssetsPath.pathLogoIos ,size: AppSize.s6,),
          IconWidget(path: AssetsPath.pathLogoGoogle,size: AppSize.s6),
        ],
      ),
    );
  }
}
