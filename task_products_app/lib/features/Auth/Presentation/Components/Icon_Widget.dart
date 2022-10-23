import 'package:flutter/material.dart';

import '../../../../core/App_Method/App_Method.dart';
import '../../../../core/Resours_Manger/Color_Manger.dart';
import '../../../../core/Resours_Manger/Values_Manger.dart';
import '../../../../core/Responsive_Ui/Config_Size.dart';

class IconWidget extends StatelessWidget {
  final String path;
  final Color?  color ;
  final double size ;
  const IconWidget({required this.path, required this.size ,this.color, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ConfigSize.defaultSize! * size,
      height: ConfigSize.defaultSize! * size,
      padding: const EdgeInsets.all(AppPadding.p8),
      decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.all(
              Radius.circular(ConfigSize.defaultSize! * AppSize.s6)),
          boxShadow: AppMethod().boxShadow()),
      child: Image(
        image: AssetImage(path),
        color: color,
        fit: BoxFit.fill,
      ),
    );
  }
}
