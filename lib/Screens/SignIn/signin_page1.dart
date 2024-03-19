import 'package:augmont_v2/Controllers/sing_in_controller.dart';
import 'package:augmont_v2/Screens/SignIn/Components/signIn_mobileview.dart';
import 'package:augmont_v2/Screens/SignIn/Components/signIn_otpview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../Bindings/main_screen_binding.dart';
import '../../Network/ErrorHandling.dart';
import '../../Utils/colors.dart';
import '../../Utils/scaffold_view.dart';
import '../../Utils/strings.dart';
import '../../widgets/animated_dot.dart';
import '../Main/main_screen.dart';

class SignInPage1 extends StatefulWidget {
  const SignInPage1({super.key});

  @override
  State<StatefulWidget> createState() {
    return SignInPageState1();
  }
}

class SignInPageState1 extends State<SignInPage1> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInController>( builder: (controller) {
      return WillPopScope(
          onWillPop: () async {
            controller.clearSessionFields();
            Get.offAll(
                  () => const MainScreen(),
              binding: MainScreenBinding(),
              transition: Transition.rightToLeft,
            );
            return false;
          },child:ScaffoldView(
          child:

              Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 50,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child: Icon(
                          size: 24,
                          Icons.arrow_back_outlined,
                          color: bottomNavigationColor,
                        ),
                        onTap: () {
                          Get.offAll(
                                () => const MainScreen(),
                            binding: MainScreenBinding(),
                            transition: Transition.rightToLeft,
                          );
                        },
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(Strings.back,
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: bottomNavigationColor,
                            fontFamily: Strings.fontFamilyName,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          )),
                      Spacer(),
                      Row(
                        children: List.generate(
                          3,
                          (index) => buildDot(index: index, 0),
                        ),
                      ),
                    ],
                  ),
                ),
                // Container(
                //   height: 200,
                //   color: Colors.grey,
                //   margin: EdgeInsets.symmetric(vertical: 30),
                // ),
                // if (controller.enableMobileView.value) const SignInMobileView(),
                // if (controller.enableOtpView.value) const SignInOTPView()
                SignInMobileView(),
              ],
            ),
          ),
        Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      height: 55,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      // Adjust padding as needed
                      child:
                          // controller.enableMobileView.value ?
                          ElevatedButton(
                              onPressed: controller.enableGenrateOtpButton.value
                                  ? () {
                                      controller.startTimer(false, true);
                                    }
                                  : null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: deliveryDescTextColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.0),
                                  ),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(Strings.generateOtp,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: Strings.fontFamilyName,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      )),
                                  Image.asset(
                                    "assets/images/arrow_right.png",
                                    height: 20,
                                  )
                                ],
                              ))))
        ],
      )));
    });
  }
}
