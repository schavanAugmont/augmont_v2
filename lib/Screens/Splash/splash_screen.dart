import 'package:augmont_v2/Bindings/main_screen_binding.dart';
import 'package:augmont_v2/Screens/AppIntro/onboard_screen.dart';
import 'package:augmont_v2/Utils/colors.dart';
import 'package:augmont_v2/Utils/scaffold_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../Bindings/signin_binding.dart';
import '../../Utils/session_manager.dart';
import '../../bindings/intro_binding.dart';
import '../../bindings/personalizedqus_binding.dart';
import '../Main/main_screen.dart';
import '../SignIn/personalise_quest_page.dart';
import '../SignIn/signin_page1.dart';
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
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
    ));

    sessionManager = SessionManager();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    animateSplash();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldView(
        child: Center(
      child: FadeTransition(
        opacity: _animation,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/new_logo.png'),
          ],
        ),
      ),
    ));
  }

  void animateSplash() {
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Future.delayed(const Duration(seconds: 2), () async {
            var isLogin = await SessionManager.isLoggedIn();
            var isPinAdded = await SessionManager.getIsPinAdded();
            var isDashSelect = await SessionManager.getIsDashSelected();
            print("isDashSelect $isDashSelect");
            print("isPinAdded $isPinAdded");
            if (isLogin && isPinAdded) {
              Get.off(
                  () => const SignInPage3(
                        isForgot: false,
                        refCode: '',
                      ),
                  binding: SignInBiding());
            } else if (isLogin && !isPinAdded) {
              Get.offAll(() => SignInPage1(), binding: SignInBiding());
            } else if (isDashSelect) {
              Get.off(() => const MainScreen(), binding: MainScreenBinding());
            } else {
              Get.off(() => const OnboardScreen(), binding: IntroBiding());
            }
          });

          //Get.off(() => const MainScreen(), binding: MainScreenBinding());

        }
      })
      ..addStatusListener((status) => print('$status'));

    _controller.forward();
  }
}
