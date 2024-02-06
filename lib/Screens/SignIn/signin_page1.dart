import 'package:augmont_v2/Controllers/sing_in_controller.dart';
import 'package:augmont_v2/Screens/SignIn/Components/signIn_mobileview.dart';
import 'package:augmont_v2/Screens/SignIn/Components/signIn_otpview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../Utils/Validator.dart';
import '../../Utils/colors.dart';
import '../../Utils/print_logs.dart';
import '../../Utils/strings.dart';
import 'Components/OtpView.dart';

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
    return GetBuilder<SignInController>(builder: (controller) {
      return SafeArea(
          child: Scaffold(
        bottomNavigationBar: Container(
          height: 55,
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          // Adjust padding as needed
          child: BottomAppBar(
            child: Row(
              children: [
                if (controller.enableMobileView.value)
                  Expanded(
                      child: ElevatedButton(
                          onPressed: controller.enableGenrateOtpButton.value
                              ? () {
                                  controller.setOTPView();
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(double.infinity, 55.0),
                              backgroundColor: primaryColor),
                          child: Text(Strings.generateOtp,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: Strings.fontFamilyName,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              )))),
                if (controller.enableOtpView.value)
                  Expanded(
                      child: ElevatedButton(
                          onPressed:
                              controller.enableOtpButton.value ? () {

                            controller.navigateToBasicDetails();
                              } : null,
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(double.infinity, 55.0),
                              backgroundColor: primaryColor),
                          child: Text(Strings.verifyOtp,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: Strings.fontFamilyName,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              )))),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      child: Icon(
                        size: 15,
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    Spacer(),
                    Text("Step 1 0f 3",
                        style: TextStyle(
                          color: primaryTextColor,
                          fontFamily: Strings.fontFamilyName,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ))
                  ],
                ),
                Container(
                  height: 200,
                  color: Colors.grey,
                  margin: EdgeInsets.symmetric(vertical: 30),
                ),
                if (controller.enableMobileView.value) const SignInMobileView(),
                if (controller.enableOtpView.value)const SignInOTPView()
              ],
            ),
          ),
        ),
      ));
    });
  }



  
}
