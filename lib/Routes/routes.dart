import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../Screens/Splash/splash_screen.dart';


final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
};


final routeList = [
  GetPage(
    name: SplashScreen.routeName,
    page: () => SplashScreen(),
  ),

];