import 'package:flutter/material.dart';
import 'package:task_products_app/features/Auth/Presentation/Screens/Login_Screen.dart';
import 'package:task_products_app/features/Auth/Presentation/Screens/Verify_Screen.dart';
import 'package:task_products_app/features/Help/Presentation/Screens/Help_Screen.dart';
import 'package:task_products_app/features/Home/Domin/Entities/Product_Entities.dart';
import 'package:task_products_app/features/Home/Presentation/Screens/Details_Screen.dart';
import 'package:task_products_app/features/Home/Presentation/Screens/Home_Screen.dart';

import '../../features/Splash/Presentation/Screens/Splash_Screen.dart';
import 'String_Manger.dart';

class Routes {
  static const String splashRoute = "/Splash";
  static const String loginRoute = "/login";
  static const String verfiyRoute = "/Verfiy";
  static const String helpRoute = "/Help";
  static const String homeRoute = "/Home";
  static const String detielsRoute = "/Detiels";
}

class RoutesGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.verfiyRoute:
        return MaterialPageRoute(builder: (_) => const VerifyScreen());
      case Routes.helpRoute:
        return MaterialPageRoute(builder: (_) => const HelpScreen());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.detielsRoute:
        ProductEntities productEntities = settings.arguments as ProductEntities;
        return MaterialPageRoute(
            builder: (_) => DetailsScreen(productEntities: productEntities));

      default:
        return UnFindRout();
    }
  }

  static Route<dynamic> UnFindRout() {
    return MaterialPageRoute(
        builder: (_) => const Scaffold(
              body: Center(
                child: Text(StringManger.unFindRount),
              ),
            ));
  }
}
