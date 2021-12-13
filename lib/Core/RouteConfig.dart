import 'package:flutter/material.dart';
import 'package:flutter_web_sample/Screens/HomeScreen.dart';
import 'package:flutter_web_sample/Screens/LoginScreen.dart';
import 'package:flutter_web_sample/Screens/SplashScreen.dart';

class RouteConfig {
  static late RouteSettings routeSettings;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    routeSettings = settings;
    switch (settings.name) {
      case '':
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen(),settings: settings);
      case '/login':
        return MaterialPageRoute(builder: (_) => HomeScreen(),settings: settings);
      case '/home':
        return MaterialPageRoute(builder: (_) => HomeScreen(),settings: settings);
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ),settings: settings);
    }
  }
}
