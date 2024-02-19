import 'package:augmont_v2/Controllers/sing_in_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../Network/ErrorHandling.dart';
import '../../Utils/Validator.dart';
import '../../Utils/colors.dart';
import '../../Utils/strings.dart';
import '../../controllers/forgotpin_controller.dart';
import 'Components/OtpView.dart';
import 'Components/SignInComponents.dart';

class ForgotPinPage extends StatefulWidget {

  const ForgotPinPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return ForgotPinPageState();
  }
}

class ForgotPinPageState extends State<ForgotPinPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotPinController>(builder: (controller) {
      return SafeArea(
          child: Scaffold(
        bottomNavigationBar: Container(
            height: 55,
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            // Adjust padding as needed
            child: controller.enableMobileView.value
                ? ElevatedButton(
                    onPressed: controller.enableGenrateOtpButton.value
                        ? () {
                            controller.startTimer(false, true);
                          }
                        : null,
                    style:
                        ElevatedButton.styleFrom(backgroundColor: primaryColor),
                    child: Text(Strings.generateOtp,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: Strings.fontFamilyName,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        )))
                : ElevatedButton(
                    onPressed: () {
                      if (controller.enableOtpButton.value) {
                        controller.verifyOTP();
                      } else {
                        ErrorHandling.showToast(Strings.enterOtp);
                      }
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: primaryColor),
                    child: Text(Strings.verifyOtp,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: Strings.fontFamilyName,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        )))),
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
                        controller.clearBackStack();
                      },
                    ),
                    Spacer(),
                    Text(
                        controller.enableMobileView.value
                            ? "Step 1 0f 3"
                            : "Step 2 0f 3",
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
                if (controller.enableMobileView.value)
                  ForgotMobileView(controller),
                if (controller.enableOtpView.value) ForgotOtpView(controller)
              ],
            ),
          ),
        ),
      ));
    });
  }

  Widget ForgotMobileView(ForgotPinController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        maintitle(Strings.enterPhoneNo),
        const SizedBox(
          height: 5,
        ),
        mainDescp(Strings.enterPhoneNoDec),
        const SizedBox(
          height: 30,
        ),
        subtitle(Strings.mobileNumber),
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
                  enabled: false,
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

  Widget ForgotOtpView(ForgotPinController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (controller.isCustomer) maintitle(Strings.otpVerification),
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
            // WidgetSpan(
            //     child: GestureDetector(
            //   child: const Padding(
            //     padding: EdgeInsets.symmetric(horizontal: 4.0),
            //     child: Icon(
            //       size: 15,
            //       Icons.edit,
            //       color: primaryTextColor,
            //     ),
            //   ),
            //   onTap: () {
            //     controller.setMobileView();
            //   },
            // )),
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
                          Text(
                            '${controller.timerValue.value < 10 ? '00:0${controller.timerValue.value}' : '00:${controller.timerValue.value}'} ',
                            style: TextStyle(
                              fontFamily: Strings.fontFamilyName,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: primaryTextColor,
                            ),
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
                                  {controller.startTimer(false, false)}
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
                                  {controller.startTimer(false, false)}
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
