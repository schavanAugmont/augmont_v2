import 'package:augmont_v2/Controllers/sing_in_controller.dart';
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
import 'OtpView.dart';

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
                              controller.enableOtpButton.value ? () {} : null,
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
                if (controller.enableMobileView.value) mobileView(controller),
                if (controller.enableOtpView.value) otpView(controller)
              ],
            ),
          ),
        ),
      ));
    });
  }

  Widget mobileView(SignInController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(Strings.enterPhoneNo,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: primaryTextColor,
              fontFamily: Strings.fontFamilyName,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            )),
        SizedBox(
          height: 5,
        ),
        Text(Strings.enterPhoneNoDec,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: primaryTextColor,
              fontFamily: Strings.fontFamilyName,
              fontWeight: FontWeight.normal,
              fontSize: 13,
            )),
        SizedBox(
          height: 30,
        ),
        RichText(
            text: TextSpan(
          text: Strings.mobileNumber,
          style: TextStyle(
            fontFamily: Strings.fontFamilyName,
            fontWeight: FontWeight.w600,
            color: primaryTextColor,
            fontSize: 13,
          ),
          children: <TextSpan>[
            TextSpan(
              text: ' *',
              style: TextStyle(
                fontFamily: Strings.fontFamilyName,
                fontWeight: FontWeight.w600,
                color: Colors.red,
                fontSize: 13,
              ),
            ),
          ],
        )),
        const SizedBox(
          height: 10,
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 50,
                width: 60,
                color: kycProductBackgroundColor,
                child: Center(
                    child: Text(
                  "\u{1F1EE}\u{1F1F3} ${Strings.countryCode}",
                  style: TextStyle(
                    fontFamily: Strings.fontFamilyName,
                    fontWeight: FontWeight.w600,
                    color: primaryTextColor,
                    fontSize: 14,
                  ),
                )),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextFormField(
                  // enabled: !controller
                  //     .isUserAuthenticated.value,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  textAlign: TextAlign.start,
                  maxLength: 10,
                  maxLines: 1,
                  controller: controller.mobileTextController,
                  onChanged: (value) {
                    if (Validator.validateMobileNumber(number: value)) {
                      controller.setEnableGenrateOtpButton(true);
                    } else {
                      controller.setEnableGenrateOtpButton(false);
                    }
                  },
                  validator: (value) {
                    return null;
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: kycProductBackgroundColor,
                    filled: true,
                    counterText: "",
                    hintText: Strings.enterMobileNumber,
                  ),
                  style: TextStyle(
                    fontFamily: Strings.fontFamilyName,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: primaryTextColor,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  otpView(SignInController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(Strings.otpVerification,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: primaryTextColor,
              fontFamily: Strings.fontFamilyName,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            )),
        SizedBox(
          height: 5,
        ),
        RichText(
            text: TextSpan(
          text: "Enter 6-digit OTP sent to  ",
          style: TextStyle(
            color: primaryTextColor,
            fontFamily: Strings.fontFamilyName,
            fontWeight: FontWeight.normal,
            fontSize: 13,
          ),
          children: <InlineSpan>[
            TextSpan(
              text: controller.mobileTextController.text,
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: primaryTextColor,
                fontFamily: Strings.fontFamilyName,
                fontWeight: FontWeight.normal,
                fontSize: 13,
              ),
            ),
            const WidgetSpan(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: Icon(
                  size: 15,
                  Icons.edit,
                  color: primaryTextColor,
                ),
              ),
            ),
          ],
        )),
        SizedBox(
          height: 30,
        ),
        PinCodeTextField(
          enabled: true,
          enablePinAutofill: true,
          appContext: context,
          length: 6,
          obscureText: false,
          enableActiveFill: true,
          animationType: AnimationType.none,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          textStyle: TextStyle(
            fontFamily: Strings.fontFamilyName,
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: primaryTextColor,
          ),
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(5),
            fieldHeight: 50,
            fieldWidth: 40,
            activeFillColor: Colors.white,
            activeColor: divider,
            inactiveColor: divider,
            inactiveFillColor: white,
            selectedColor: divider,
            selectedFillColor: white,
          ),
          cursorColor: Colors.black,
          animationDuration: const Duration(milliseconds: 300),
          // errorAnimationController: errorController,
          controller: controller.otpTextController,
          keyboardType: TextInputType.number,
          boxShadows: const [
            BoxShadow(
              offset: Offset(0, 1),
              color: Colors.black12,
              blurRadius: 10,
            )
          ],
          onChanged: (value) {
            if (Validator.validateOtp(value)) {
              controller.setEnableOtpButton(true);
            } else {
              controller.setEnableOtpButton(false);
            }
          },
        ),

       Column(
         crossAxisAlignment: CrossAxisAlignment.end,
         mainAxisAlignment: MainAxisAlignment.end,
         children: [
           Obx(
                 () => controller.isTimeOnGoing.value
                 ? Padding(
                 padding: EdgeInsets.only(bottom: 2),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   crossAxisAlignment: CrossAxisAlignment.end,
                   children: [
                     Text(
                       Strings.otpExpiresIn,
                       style: TextStyle(
                         fontFamily: Strings.fontFamilyName,
                         fontWeight: FontWeight.w600,
                         fontSize: 12,
                         color: primaryTextColor,
                       ),
                     ),
                     CountdownTimer(
                       controller: controller.countdownTimerController,
                       widgetBuilder: (_, CurrentRemainingTime? time) {
                         if (time == null) {
                           return const SizedBox();
                         }
                         var sec = "00";
                         try {
                           if (time.sec! < 10) {
                             sec = "0${time.sec}";
                           } else {
                             sec = time.sec!.toString();
                           }
                         } catch (e) {
                           if (time.sec != null) {
                             sec = time.sec!.toString();
                           }
                           PrintLogs.printException(e);
                         }
                         return Text(
                           ' 00 : $sec',
                           style: TextStyle(
                             fontFamily: Strings.fontFamilyName,
                             fontWeight: FontWeight.bold,
                             fontSize: 12,
                             color: primaryTextColor,
                           ),
                         );
                       },
                     ),
                   ],
                 ))
                 : const SizedBox(height: 0,),
           ),
           Row(
             children: [
               Spacer(), Text.rich(
                 TextSpan(
                   children: [
                     TextSpan(
                       text: "${Strings.didntGetAnOtp} ",
                       style: TextStyle(
                         fontFamily: Strings.fontFamilyName,
                         fontWeight: FontWeight.w500,
                         fontSize: 12,
                         color: primaryTextColor,
                       ),
                     ),
                     TextSpan(
                       text: Strings.resend,
                       recognizer: TapGestureRecognizer()
                         ..onTap = () => {
                           if (!controller.isTimeOnGoing.value)
                             {controller.startTimer(context, false)}
                         },
                       style: TextStyle(
                         decoration: TextDecoration.underline,
                         fontFamily: Strings.fontFamilyName,
                         fontWeight: FontWeight.w800,
                         fontSize: 12,
                         color: controller.isTimeOnGoing.value
                             ? secondaryTextColor
                             : primaryColor,
                       ),
                     ),
                     TextSpan(
                       text: ' or ',
                       style: TextStyle(
                         fontFamily: Strings.fontFamilyName,
                         fontWeight: FontWeight.w500,
                         fontSize: 12,
                         color: primaryTextColor,
                       ),
                     ),
                     TextSpan(
                       text: Strings.getcall,
                       recognizer: TapGestureRecognizer()
                         ..onTap = () => {
                           if (!controller.isTimeOnGoing.value)
                             {controller.startTimer(context, true)}
                         },
                       style: TextStyle(
                         decoration: TextDecoration.underline,
                         fontFamily: Strings.fontFamilyName,
                         fontWeight: FontWeight.w800,
                         fontSize: 12,
                         color: controller.isTimeOnGoing.value
                             ? secondaryTextColor
                             : primaryColor,
                       ),
                     ),
                   ],
                 ),
               )
             ],
           )
         ],
       )
      ],
    );
  }
}
