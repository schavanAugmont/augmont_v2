import 'package:augmont_v2/Bindings/main_screen_binding.dart';
import 'package:augmont_v2/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../Utils/session_manager.dart';
import '../Main/main_screen.dart';

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
      backgroundColor: Colors.transparent,
      extendBody: true,
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                primaryColor,
                Colors.white,
                Colors.white,
                Colors.white,
                Colors.white,
                Colors.white,
                Colors.white
              ])),
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
            ),
          ),
    );
  }

  void animateSplash() {
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          // Future.delayed(const Duration(seconds: 2), () async {
          //   var isLogin = await SessionManager.isLoggedIn();
          //   var isDashSelect = await SessionManager.getIsDashSelected();
          //   print(isDashSelect);
          //   if (isLogin) {
          //     Get.off(
          //         () => const SignInPage3(
          //               isForgot: false,
          //               refCode: '',
          //             ),
          //         binding: SignInBiding());
          //
          //   // Get.off(() => PersonalizeQuestionScreen(), binding: PersonalizedQuesBiding());
          //   } else {
          //     if (isDashSelect) {
          //       Get.off(() => const SignInPage1(), binding: SignInBiding());
          //     } else {
          //       Get.off(() => const OnboardScreen(), binding: IntroBiding());
          //     }
          //   }
          // });

          Get.offAll(
                () => const MainScreen(),
            binding: MainScreenBinding(),
            transition: Transition.rightToLeft,
          );
        }
      })
      ..addStatusListener((status) => print('$status'));

    _controller.forward();
  }
}
