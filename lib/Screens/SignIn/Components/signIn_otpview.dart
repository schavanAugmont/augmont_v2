import 'package:augmont_v2/Screens/SignIn/Components/SignInComponents.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../Controllers/sing_in_controller.dart';
import '../../../Utils/Validator.dart';
import '../../../Utils/colors.dart';
import '../../../Utils/print_logs.dart';
import '../../../Utils/strings.dart';
import 'OtpView.dart';

class SignInOTPView extends StatefulWidget {
  const SignInOTPView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SignInOtpViewState();
  }
}

class _SignInOtpViewState extends State<SignInOTPView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInController>(builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          maintitle(Strings.otpVerification),
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
              WidgetSpan(
                  child: GestureDetector(
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  child: Icon(
                    size: 15,
                    Icons.edit,
                    color: primaryTextColor,
                  ),
                ),
                onTap: () {
                  controller.setMobileView();
                },
              )),
            ],
          )),
          SizedBox(
            height: 30,
          ),

          OtpView(
            controller: controller.otpTextController,
            otpLength: 6,
            isobscureText: false,
            onChanged: (pin) async {
              if (Validator.validateOtp(pin)) {
                controller.setEnableOtpButton(true);
              } else {
                controller.setEnableOtpButton(false);
              }
            },
            keyboardType: TextInputType.number,
            validator: (value) {
              return null;
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
                    : const SizedBox(
                        height: 0,
                      ),
              ),
              Row(
                children: [
                  Spacer(),
                  Text.rich(
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
                                    {
                                      controller.startTimer(false, false)
                                    }
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
                                    {
                                      controller.startTimer(
                                           false, false)
                                    }
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
    });
  }
}
