import 'package:augmont_v2/Controllers/sing_in_controller.dart';
import 'package:augmont_v2/Network/ErrorHandling.dart';
import 'package:augmont_v2/Screens/SignIn/Components/SignInComponents.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../Utils/Validator.dart';
import '../../Utils/colors.dart';
import '../../Utils/strings.dart';
import 'Components/OtpView.dart';

class SignInPage3 extends StatefulWidget {
  final bool isForgot;
  final String refCode;

  const SignInPage3({super.key, required this.isForgot, required this.refCode});

  @override
  State<StatefulWidget> createState() {
    return SignInPageState3();
  }
}

class SignInPageState3 extends State<SignInPage3> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInController>(initState: (state) {
      if (widget.isForgot) {
        SignInController.to.setForgotData(widget.isForgot, widget.refCode);
      } else {
        SignInController.to.showAuthPopup(widget.isForgot);
      }
    }, builder: (controller) {
      return SafeArea(
          child: WillPopScope(
              onWillPop: () async => false,
              child: Scaffold(
                bottomNavigationBar: Container(
                  height: 55,
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  // Adjust padding as needed
                  child: ElevatedButton(
                      onPressed: controller.enablePINButton.value
                          ? () {
                              if (controller.isPinAdded.value &&
                                  !controller.isForgotPIN.value) {
                                controller.verifyPin(true);
                              } else {
                                if (controller.validatePINChange()) {
                                  if (controller.isForgotPIN.value) {
                                    controller.resetPin();
                                  } else {
                                    if (controller.isBiometricAvl.value) {
                                      controller.showBiomatricPopup(context);
                                    } else {
                                      controller.setPin();
                                    }
                                  }
                                }
                              }
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 55.0),
                          backgroundColor: primaryColor),
                      child: Text(Strings.proceed,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: Strings.fontFamilyName,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ))),
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
                            if (!controller.isPinAdded.value ||
                                controller.isForgotPIN.value) ...[
                              GestureDetector(
                                child: const Icon(
                                  size: 15,
                                  Icons.arrow_back_ios,
                                  color: Colors.black,
                                ),
                                onTap: () {
                                  controller.onBackPress();
                                },
                              ),
                              Spacer(),
                              Text("Step 3 0f 3",
                                  style: TextStyle(
                                    color: primaryTextColor,
                                    fontFamily: Strings.fontFamilyName,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                  ))
                            ],
                            if (controller.isPinAdded.value &&
                                !controller.isForgotPIN.value) ...[
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  controller.enableForgotPIN();
                                },
                                child: Text("Forgot PIN?",
                                    style: TextStyle(
                                      color: primaryTextColor,
                                      fontFamily: Strings.fontFamilyName,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    )),
                              )
                            ]
                          ],
                        ),
                        SingleChildScrollView(
                          child: Form(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(top: 50),
                                    margin: EdgeInsets.symmetric(vertical: 30),
                                    width: double.infinity,
                                    child: Image.asset(
                                      'assets/images/ic_lock.png',
                                      width: 60,
                                      height: 60,
                                    ),
                                  ),
                                  maintitle((controller.isPinAdded.value &&
                                          !controller.isForgotPIN.value)
                                      ? Strings.pinTitle1
                                      : Strings.pinTitle),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  mainDescp((controller.isPinAdded.value &&
                                          !controller.isForgotPIN.value)
                                      ? Strings.pinDescp1
                                      : Strings.pinDescp),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              subtitle(Strings.enterPin),
                              const SizedBox(
                                height: 10,
                              ),
                              OtpView(
                                controller: controller.pinTextController,
                                otpLength: 6,
                                isobscureText: true,
                                onChanged: (pin) async {
                                  if (Validator.validateOtp(pin)) {
                                    controller.setPINButton(true);
                                  } else {
                                    controller.setPINButton(false);
                                  }
                                },
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              if (controller.pinError.value)
                                Text(
                                  Strings.fieldRequired,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    fontFamily: Strings.fontFamilyName,
                                  ),
                                ),
                              const SizedBox(
                                height: 10,
                              ),
                              if (!controller.isPinAdded.value ||
                                  controller.isForgotPIN.value) ...[
                                subtitle(Strings.reenterPin),
                                const SizedBox(
                                  height: 10,
                                ),
                                OtpView(
                                  controller:
                                      controller.reenterpinTextController,
                                  otpLength: 6,
                                  isobscureText: true,
                                  onChanged: (pin) async {},
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                if (controller.repinError.value)
                                  Text(
                                    "PIN Didn't Match",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      fontFamily: Strings.fontFamilyName,
                                    ),
                                  ),
                              ],
                            ],
                          )),
                        )
                      ],
                    ),
                  ),
                ),
              )));
    });
  }
}
