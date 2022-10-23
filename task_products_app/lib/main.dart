import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_products_app/core/App_Constant.dart';
import 'package:task_products_app/core/Base_UseCase/Base_UseCase.dart';
import 'package:task_products_app/core/Resours_Manger/Color_Manger.dart';
import 'package:task_products_app/core/Resours_Manger/String_Manger.dart';
import 'package:task_products_app/features/Auth/Data/Data_Sources/Remoted_Data_Source.dart';
import 'package:task_products_app/features/Auth/Data/Repository_Imp/Repository_Imp.dart';
import 'package:task_products_app/features/Auth/Domin/Base_Repository/Base_Repository.dart';
import 'package:task_products_app/features/Auth/Domin/Entities/User_Entities.dart';
import 'package:task_products_app/features/Auth/Domin/UseCases/SigIn_Uc.dart';
import 'package:task_products_app/features/Auth/Domin/UseCases/Verify_UC.dart';
import 'package:task_products_app/features/Help/Presentation/Screens/Help_Screen.dart';
import 'package:task_products_app/features/Home/Domin/UseCases/Get_Products_UC.dart';
import 'package:task_products_app/features/Home/Presentation/Screens/Details_Screen.dart';
import 'package:task_products_app/features/Home/Presentation/Screens/Home_Screen.dart';
import 'package:task_products_app/features/Splash/Presentation/Screens/Splash_Screen.dart';

import 'core/Resours_Manger/Routs_Manger.dart';
import 'core/Server_Locator/Server_Locator.dart';
import 'core/Theme_Data/Theme_Manger.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized() ;
  await ServerLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp

  ({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  SharedPreferences sharedPreferences =getIt();
    return  MaterialApp(
              title: StringManger.title,
              debugShowCheckedModeBanner: false,
              theme: getAppTheme(),
              onGenerateRoute: RoutesGenerator.getRoute,
              initialRoute:  sharedPreferences.get(StringManger.keepLogin)==null ?Routes.splashRoute: Routes.homeRoute , // to check if user login or not
            );
          }
        }
