import 'dart:io';

import 'package:augmont_v2/Screens/SignIn/Components/SignInComponents.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../Controllers/sing_in_controller.dart';
import '../../../Utils/Validator.dart';
import '../../../Utils/colors.dart';
import '../../../Utils/strings.dart';

class SignInMobileView extends StatefulWidget {
  const SignInMobileView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SignInMobileViewState();
  }
}

class _SignInMobileViewState extends State<SignInMobileView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInController>(builder: (controller) {
      return SingleChildScrollView(
          child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  maintitleCabin("Enter Phone \nNumber"),
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
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(width: 0.5, color: primaryColor))),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          width: 60,
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
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          height: 25,
                          width: 1,
                          color: shadowColor,
                        ),
                        Expanded(
                          child: TextFormField(
                            // enabled: !controller
                            //     .isUserAuthenticated.value,
                            keyboardType: Platform.isIOS
                                ? const TextInputType.numberWithOptions(
                                    signed: true, decimal: false)
                                : TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            textAlign: TextAlign.start,
                            maxLength: 10,
                            maxLines: 1,
                            controller: controller.mobileTextController,
                            onTap: () {
                              if (Platform.isAndroid &&
                                  controller.isShowMobilePop.value) {
                                controller.openMobilePopup();
                              }
                            },
                            onChanged: (value) {
                              if (Validator.validateMobileNumber(
                                  number: value)) {
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
                              fillColor: Colors.white,
                              filled: true,
                              counterText: "",
                              hintText: Strings.enterMobileNumber,
                            ),
                            style: TextStyle(
                              fontFamily: Strings.fontFamilyName,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: primaryTextColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )));
    });
  }
}
