import 'package:calcsi/utils/routes_name.dart';
import 'package:calcsi/view/home_screen.dart';
import 'package:calcsi/view/splash_screen%20.dart';
import 'package:flutter/material.dart';

class Routes {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashscreen:
        return MaterialPageRoute(builder: ((context) => SplashScreen()));
      case RoutesName.homescreen:
        return MaterialPageRoute(builder: ((context) => HomeScreen()));
      default:
        return MaterialPageRoute(
            builder: (context) => Center(
                  child: Text('OOPS SOME INTERNAL ERROR OCCURED'),
                ));
    }
  }
}
