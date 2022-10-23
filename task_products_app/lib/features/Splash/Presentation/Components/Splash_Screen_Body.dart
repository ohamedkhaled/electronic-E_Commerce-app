



import 'package:flutter/material.dart';
import 'package:task_products_app/core/Responsive_Ui/Config_Size.dart';
import 'package:task_products_app/core/Resours_Manger/Routs_Manger.dart';
import 'package:task_products_app/core/Resours_Manger/Values_Manger.dart';
import '../../../../core/App_Constant.dart';
import '../../../../core/Resours_Manger/Assets_Path.dart';
class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({Key? key}) : super(key: key);

  @override
  _SplashScreenBodyState createState() => _SplashScreenBodyState();
}



class _SplashScreenBodyState extends State<SplashScreenBody> with SingleTickerProviderStateMixin {

  AnimationController? animationController ;
  Animation<double>? fadeAnimation ;


  @override
  void initState() {
    print("herre");
    super.initState();
    animationController=AnimationController( vsync: this,duration: const Duration(milliseconds: AppConstant.animationDlay));
    fadeAnimation =Tween<double>(begin: AppConstant.animationbegin ,end:AppConstant.animationend ).animate(animationController!);
    animationController!.repeat(reverse: true);

    goToNext() ;
  }

  @override
  void dispose() {

    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ConfigSize().init(context);
    return Stack(
    children: [

      Positioned(
        bottom:  ConfigSize.defaultSize!,
          right: AppSize.s0,
          child:Image.asset(AssetsPath.pathRectangle2) ),

      Positioned(
        top: ConfigSize.defaultSize!*AppSize.s20,
          right: AppSize.s0,
          child:Image.asset(AssetsPath.pathEposi2) ),

      Positioned(
        right: AppSize.s0,
          top: ConfigSize.defaultSize!*AppSize.s23,
          child:Image.asset(AssetsPath.pathEposi1) ),

      Positioned(
        top: ConfigSize.defaultSize!*AppSize.s3,
          child:Image.asset(AssetsPath.pathRectangle1) ),
      Positioned(
          bottom: ConfigSize.defaultSize!*AppSize.s20,
          child:Image.asset(AssetsPath.pathSubtract) ),

      Center(child: FadeTransition(
          opacity: fadeAnimation!,
          child: Image.asset(AssetsPath.pathLogoSplash)))





    ],
    );
  }


  void goToNext() {
    Future.delayed(const Duration(seconds: AppConstant.splashDlay), () {
      Navigator.pushReplacementNamed(context, Routes.loginRoute);
    });
  }

}
