import 'package:augmont_v2/Bindings/intro_binding.dart';
import 'package:augmont_v2/Bindings/main_screen_binding.dart';
import 'package:augmont_v2/Bindings/signin_binding.dart';
import 'package:augmont_v2/Controllers/main_screen_controller.dart';
import 'package:augmont_v2/Controllers/sing_in_controller.dart';
import 'package:augmont_v2/Screens/AppIntro/onboard_screen.dart';
import 'package:augmont_v2/Screens/DigitalInvestment/digiinvestment_dashborad_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Utils/session_manager.dart';
import '../Main/main_screen.dart';
import '../SignIn/signin_page1.dart';
import '../SignIn/signin_page2.dart';
import '../SignIn/signin_page3.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/SplashScreen";

  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late SessionManager sessionManager;

  @override
  void initState() {
    super.initState();
    sessionManager = SessionManager();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );

//_animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    animateSplash();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/new_logo.png'),
            ],
          ),
        ),
      ),
    );
  }

  void animateSplash() {
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Future.delayed(const Duration(seconds: 2), () async {
            var bool = await SessionManager.isLoggedIn();
            if (bool) {
              Get.off(() => MainScreen(),binding: MainScreenBinding());
            } else {
              Get.off(() => OnboardScreen(), binding: IntroBiding());
            }
          });

          //Get.off(() => DigitalInvestmentGoldScreen());
        }
      })
      ..addStatusListener((status) => print('$status'));

    _controller.forward();
  }
}
