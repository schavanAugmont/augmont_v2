import 'package:augmont_v2/Screens/SignIn/Components/SignInComponents.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../Controllers/sing_in_controller.dart';
import '../../../Utils/Validator.dart';
import '../../../Utils/colors.dart';
import '../../../Utils/strings.dart';


class SignInMobileView extends StatefulWidget{
  const SignInMobileView({super.key});

  @override
  State<StatefulWidget> createState() {
  return _SignInMobileViewState();
  }
}

class _SignInMobileViewState extends State<SignInMobileView>{
  @override
  Widget build(BuildContext context) {
     return GetBuilder<SignInController>(builder: (controller) {
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
     });
  }
}