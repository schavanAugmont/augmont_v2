import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../Bindings/main_screen_binding.dart';
import '../Screens/Home/home_screen.dart';
import '../Screens/Main/main_screen.dart';
import '../Screens/Splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  MainScreen.routeName: (context) => const MainScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
};

final routeList = [
  GetPage(
    name: SplashScreen.routeName,
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: MainScreen.routeName,
    page: () => const MainScreen(),
    binding: MainScreenBinding(),
  ),
  GetPage(
    name: HomeScreen.routeName,
    page: () => const HomeScreen(),
  ),

];

