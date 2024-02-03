import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../Utils/colors.dart';
import '../../Utils/strings.dart';

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
    return SafeArea(
        child: Scaffold(
      body: Padding(
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
              color: Colors.black,
              margin: EdgeInsets.symmetric(vertical: 30),
            ),
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
            Text(
              Strings.mobileNumber,
              style: TextStyle(
                fontFamily: Strings.fontFamilyName,
                fontWeight: FontWeight.w600,
                color: primaryTextColor,
                fontSize: 13,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    Strings.countryCode,
                    style: TextStyle(
                      fontFamily: Strings.fontFamilyName,
                      fontWeight: FontWeight.w700,
                      color: primaryTextColor,
                      fontSize: 14,
                    ),
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
                      // controller: controller
                      //     .mobileTextController,
                      onChanged: (value) {
                        // if (Validator
                        //     .validateMobileNumber(
                        //     number: value)) {
                        //   controller
                        //       .setEnableOtpButton(
                        //       true);
                        // } else {
                        //   controller
                        //       .setEnableOtpButton(
                        //       false);
                        // }
                      },
                      validator: (value) {
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        fillColor: CupertinoColors.lightBackgroundGray,
                        filled: true,
                        counterText: "",
                        hintText: "",
                      ),
                      style: TextStyle(
                        fontFamily: Strings.fontFamilyName,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: primaryTextColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
