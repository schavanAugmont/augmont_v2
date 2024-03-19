import 'package:augmont_v2/Controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controllers/main_screen_controller.dart';
import '../../../Utils/colors.dart';
import '../../../Utils/strings.dart';
import '../../../bindings/digitalinvestment_binding.dart';
import '../../DigitalInvestment/digiinvestment_dashborad_screen.dart';

Widget setfdView(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
    decoration: BoxDecoration(
      color: Color(0xffFFF7E8),
      borderRadius: BorderRadius.circular(10.0),
    ),
    padding: EdgeInsets.all(10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Earn 16% p.a. with Gold",
                style: TextStyle(
                  color: primaryTextColor,
                  fontFamily: Strings.fontfamilyCabinetGrotesk,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                )),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.info_outline,
              size: 24,
              color: primaryTextColor,
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
            "Augmont's Gold+ is here to help you to reap annual profit from invesment",
            maxLines: 5,
            style: TextStyle(
              color: primaryTextColor,
              fontFamily: Strings.fontFamilyName,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            )),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Image(image: AssetImage("assets/images/gold_plus.png")),
        ),
        GestureDetector(
            onTap: () {
              Get.to(() => DigitalInvestmentGoldScreen(),
                  binding: DigitalInvestmentBiding());
            },
            child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xffFFF7E8),
                  border: Border.all(color: bottomNavigationColor),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                margin: EdgeInsets.only(bottom: 20, top: 20),
                height: 40,
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text('Start invest in Gold+',
                        style: TextStyle(
                          color: bottomNavigationColor,
                          fontFamily: Strings.fontFamilyName,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        )),
                    Spacer(),
                    Image.asset(
                      "assets/images/arrow_right.png",
                      height: 20,
                      color: bottomNavigationColor,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                )))
      ],
    ),
  );
}

Widget setWalletView(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: borderColor,
      borderRadius: BorderRadius.circular(10.0),
    ),
    margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Invest with every spend",
            style: TextStyle(
              color: primaryTextColor,
              fontFamily: Strings.fontfamilyCabinetGrotesk,
              fontWeight: FontWeight.w700,
              fontSize: 20,
            )),
        Row(
          children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 2,
                ),
                Text("Most user saved \u{20B9} 2,00 every month",
                    maxLines: 5,
                    style: TextStyle(
                      color: primaryTextColor,
                      fontFamily: Strings.fontFamilyName,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    )),
                SizedBox(
                  height: 20,
                ),
                Text("Learn More",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: bottomNavigationColor,
                      fontFamily: Strings.fontFamilyName,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    )),
              ],
            )),
            SizedBox(
              width: 10,
            ),
            Image.asset('assets/images/locker_image.png'),
          ],
        )
      ],
    ),
  );
}

Widget silverCoin(BuildContext context, HomeController controller) {
  return GestureDetector(
    onTap: () {
      controller.goToInvestmentDashbord();
    },
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Invest in Silver",
                  style: TextStyle(
                    color: bottomNavigationColor,
                    fontFamily: Strings.fontfamilyCabinetGrotesk,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  )),
              Text("Grow your wealth by 9% p.a*",
                  maxLines: 5,
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: Strings.fontFamilyName,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  )),
              SizedBox(
                height: 20,
              ),
              Text("Start Investing",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: primaryTextColor,
                    fontFamily: Strings.fontFamilyName,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  )),
            ],
          )),
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/silver_coin.png'),
              SizedBox(
                height: 20,
              ),
              Text(controller.currentSilverBuyRate.value,
                  maxLines: 5,
                  style: TextStyle(
                    color: bottomNavigationColor,
                    fontFamily: Strings.fontFamilyName,
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                  ))
            ],
          ),
        ],
      ),
    ),
  );
}

Widget createProfile(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
    decoration: BoxDecoration(
      color: borderColor,
      borderRadius: BorderRadius.circular(10.0),
    ),
    padding: EdgeInsets.all(10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(Strings.createProfile,
            style: TextStyle(
              color: primaryTextColor,
              fontFamily: Strings.fontfamilyCabinetGrotesk,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            )),
        Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Text(Strings.createProfileDec,
                      maxLines: 5,
                      style: TextStyle(
                        color: primaryTextColor,
                        fontFamily: Strings.fontFamilyName,
                        fontWeight: FontWeight.normal,
                        fontSize: 13,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                      onTap: () {
                        MainScreenController().showSignupPopup(context);
                      },
                      child: Text(Strings.signUp.toTitleCase(),
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: primaryTextColor,
                            fontFamily: Strings.fontFamilyName,
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ))),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Image.asset('assets/images/user_image.png'),
          ],
        )
      ],
    ),
  );
}
