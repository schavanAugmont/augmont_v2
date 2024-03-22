import 'package:augmont_v2/Bindings/signin_binding.dart';
import 'package:augmont_v2/Screens/SignIn/forgotpin_page.dart';
import 'package:augmont_v2/Screens/SignIn/personalise_quest_page.dart';
import 'package:augmont_v2/Screens/SignIn/signin_page1.dart';
import 'package:augmont_v2/bindings/forgotpin_binding.dart';
import 'package:augmont_v2/bindings/personalizedqus_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../Bindings/main_screen_binding.dart';
import '../Screens/Home/home_screen.dart';
import '../Screens/Main/main_screen.dart';
import '../Screens/SignIn/signin_page2.dart';
import '../Screens/SignIn/signin_page3.dart';
import '../Screens/Splash/splash_screen.dart';
import '../controllers/forgotpin_controller.dart';

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
  GetPage(
    name: SignInPage1.routeName,
    page: () => const SignInPage1(),
    binding: SignInBiding()
  ),
  GetPage(
      name: SignInPage2.routeName,
      page: () => const SignInPage2(),
      binding: SignInBiding()
  ),
  GetPage(
      name: SignInPage3.routeName,
      page: () => const SignInPage3(isForgot: false,refCode: '',),
      binding: SignInBiding()
  ),
  GetPage(
      name: ForgotPinPage.routeName,
      page: () => const ForgotPinPage(),
      binding: ForgotpinBiding()
  ),
  GetPage(
      name: ForgotPinPage.routeName,
      page: () => PersonalizeQuestionScreen(),
      binding: PersonalizedQuesBiding()
  ),

];

