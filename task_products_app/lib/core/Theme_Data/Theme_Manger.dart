import 'package:flutter/material.dart';
import '../Resours_Manger/Color_Manger.dart';
import '../Resours_Manger/Font_Manger.dart';
import '../Resours_Manger/Style_Manger.dart';
import '../Resours_Manger/Values_Manger.dart';

ThemeData getAppTheme() => ThemeData(
      //main color
      primaryColor: ColorManager.primary,
      disabledColor: ColorManager.grey,

      appBarTheme: AppBarTheme(
          centerTitle: true,
          color: ColorManager.primary,
          elevation: AppSize.s4,
          shadowColor: ColorManager.grey,
          titleTextStyle: getRegularStyle(
              fontSize: AppSize.s16, color: ColorManager.white)),

      textTheme: TextTheme(
        titleLarge: getRegularStyle(
            color: ColorManager.darkGrey, fontSize: FontSize.s25),
        titleSmall:
            getLightStyle(color: ColorManager.darkGrey, fontSize: FontSize.s14),

        bodySmall:
            getRegularStyle(color: ColorManager.white, fontSize: FontSize.s18),

        bodyMedium:
            getLightStyle(color: ColorManager.white, fontSize: FontSize.s12),
        bodyLarge:
            getRegularStyle(color: ColorManager.grey, fontSize: FontSize.s16),

        headlineMedium: getRegularStyle(
            color: ColorManager.primary, fontSize: FontSize.s20),
        headlineLarge:
            getRegularStyle(color: ColorManager.white, fontSize: FontSize.s30),
        headlineSmall:
            getBoldtStyle(color: ColorManager.white, fontSize: FontSize.s30),
        titleMedium: getLightStyle(
            color: ColorManager.grey, fontSize: FontSize.s12),

        labelLarge:
            getLightStyle(color: ColorManager.scandry, fontSize: FontSize.s12),

        displayLarge: getSemiBoldStyle(
            color: ColorManager.darkGrey, fontSize: FontSize.s16),
      ),
    );
