


import 'package:flutter/material.dart';
import 'package:task_products_app/core/Resours_Manger/Assets_Path.dart';
import 'package:task_products_app/core/Resours_Manger/Color_Manger.dart';
import 'package:task_products_app/core/Resours_Manger/Values_Manger.dart';
import 'package:task_products_app/core/Responsive_Ui/Config_Size.dart';
import 'package:task_products_app/features/Auth/Presentation/Components/Custom_Divider.dart';
import 'package:task_products_app/features/Auth/Presentation/Components/Login_Widget.dart';
import 'package:task_products_app/features/Auth/Presentation/Components/Row_Sigin_Widget.dart';

class LoginScreenBody extends StatelessWidget {


  const LoginScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListView(
      children:[
        Container(
        height: ConfigSize.screenHeight,
        width: ConfigSize.screenWidth,
        child: Stack(
          children: [

            Container(
              width:double.infinity,
              height: ConfigSize.defaultSize!*AppSize.s35,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AssetsPath.pathbackgroundAuth),
                  fit: BoxFit.fill
                )
              ),
            ),//background image
            Positioned(
              bottom: AppSize.s0,
              child: Container(
                height: ConfigSize.screenHeight!/ AppSize.s1_49 ,
                width: ConfigSize.screenWidth,
                decoration: const BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(AppSize.s60),
                    topLeft: Radius.circular(AppSize.s60)
                  )
                ),
              ),
            ), // background container
            Positioned(
                left: AppPadding.p12,
                right: AppPadding.p12,
                top: ConfigSize.defaultSize!*AppSize.s20,
                child:  LoginWidget()
            ), // login card
            Positioned(
              bottom: ConfigSize.defaultSize!* AppSize.s12,
             child:  Container(
               width: ConfigSize.screenWidth,
               child: CustomDivider(),
             ),
                  ), //divider
            Positioned(
                bottom: ConfigSize.defaultSize!*AppSize.s5,
                child: const RowSiginWidget())// option Login





          ],
        ),
      ),
    ]);
  }

}
