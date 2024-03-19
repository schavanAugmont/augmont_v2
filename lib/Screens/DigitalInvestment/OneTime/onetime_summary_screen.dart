import 'package:augmont_v2/Screens/DigitalInvestment/SIP/gold_partner_screen.dart';
import 'package:augmont_v2/Screens/MetalPice/metal_price_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../Bindings/main_screen_binding.dart';
import '../../../Utils/colors.dart';
import '../../../Utils/strings.dart';
import '../../../bindings/digitalinvestment_binding.dart';
import '../../../controllers/dgsip_controller.dart';
import '../../Main/main_screen.dart';
import '../../SignIn/Components/RoundedTextField.dart';
import '../../SignIn/Components/SignInComponents.dart';
import '../donutchart_widget.dart';

class OneTimeSummaryScreen extends StatefulWidget {
  const OneTimeSummaryScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _OneTimeSummaryState();
  }
}

class _OneTimeSummaryState extends State<OneTimeSummaryScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DgSIPController>(builder: (controller) {
      return SafeArea(
          child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: false,
          titleSpacing: 0.0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 16,
            ),
            //replace with our own icon data.
          ),
          title: Transform(
              // you can forcefully translate values left side using Transform
              transform: Matrix4.translationValues(-15.0, 0.0, 0.0),
              child: Text("Investment Summary",
                  style: TextStyle(
                    color: primaryTextColor,
                    fontFamily: Strings.fontFamilyName,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ))),
        ),
        bottomNavigationBar: Container(
            height: 70,
            padding: EdgeInsets.all(10),
            // Adjust padding as needed
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(Strings.totalAmtPay,
                        style: TextStyle(
                          color: primaryTextColor,
                          fontFamily: Strings.fontFamilyName,
                          fontWeight: FontWeight.normal,
                          fontSize: 13,
                        )),
                    Text('₹ 6000/gm',
                        style: TextStyle(
                          color: primaryTextColor,
                          fontFamily: Strings.fontFamilyName,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ))
                  ],
                ),
                Spacer(),SizedBox(height:40,child: ElevatedButton(
                    onPressed: () {
                      Get.offAll(
                            () => const MainScreen(),
                        binding: MainScreenBinding(),
                        transition: Transition.rightToLeft,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black),
                    child: Text(Strings.proceedtoPay,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: Strings.fontFamilyName,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ))),)
              ],
            )),
        body: SingleChildScrollView(
          child: Column(
            children: [
             MetalPriceScreen(metalPrice: "₹ 0,00/gm",),
              otgDetailsWidget(),
            ],
          ),
        ),
      ));
    });
  }

  Widget otgDetailsWidget() {
    return Container(
      padding: EdgeInsets.all(20),
      color: kycProductBackgroundColor,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                  decoration: new BoxDecoration(
                    color: shadowColor,
                    shape: BoxShape.circle,
                  ),
                  margin: EdgeInsets.only(right: 10),
                  padding: EdgeInsets.all(15),
                  child: ImageIcon(
                    AssetImage('assets/images/ic_coins.png'),
                    size: 20,
                    color: Colors.black,
                  )),
              SizedBox(
                width: 10,
              ),
              RichText(
                  text: TextSpan(
                text: "Investing ",
                style: TextStyle(
                  fontFamily: Strings.fontFamilyName,
                  fontWeight: FontWeight.w500,
                  color: primaryTextColor,
                  fontSize: 16,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '₹5,000 /',
                    style: TextStyle(
                      fontFamily: Strings.fontFamilyName,
                      fontWeight: FontWeight.w600,
                      color: primaryTextColor,
                      fontSize: 15,
                    ),
                  ),
                  TextSpan(
                      text: " month",
                      style: TextStyle(
                        fontFamily: Strings.fontFamilyName,
                        fontWeight: FontWeight.w500,
                        color: primaryTextColor,
                        fontSize: 14,
                      ))
                ],
              ))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            height: 0.2,
            color: shadowColor,
          ),
          SizedBox(
            height: 10,
          ),
          detailsItem(Strings.investmentType, "16% Gold+ Growth"),
          SizedBox(
            height: 10,
          ),
          detailsItem(Strings.purchaseAmount, "₹4839"),
          SizedBox(
            height: 10,
          ),
          detailsItem(Strings.goldQuantity, "0.5 gms"),
          SizedBox(
            height: 10,
          ),
          detailsItem(Strings.addtionalCharges, "3%"),
          SizedBox(
            height: 10,
          ),
          Divider(
            height: 0.2,
            color: shadowColor,
          ),
          SizedBox(
            height: 15,
          ),
          detailsItem(Strings.netPayAmt, "₹5,000"),
        ],
      ),
    );
  }

  Widget detailsItem(String key, String value) {
    return Row(
      children: [
        Text(key,
            style: TextStyle(
              color: primaryTextColor,
              fontFamily: Strings.fontFamilyName,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            )),
        Spacer(),
        Text(value,
            style: TextStyle(
              color: primaryTextColor,
              fontFamily: Strings.fontFamilyName,
              fontWeight: FontWeight.normal,
              fontSize: 12,
            )),
      ],
    );
  }


}
