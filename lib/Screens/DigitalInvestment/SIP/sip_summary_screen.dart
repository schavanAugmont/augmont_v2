import 'package:augmont_v2/Screens/DigitalInvestment/SIP/gold_partner_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../Bindings/main_screen_binding.dart';
import '../../../Utils/colors.dart';
import '../../../Utils/strings.dart';
import '../../../bindings/digitalinvestment_binding.dart';
import '../../../controllers/dgsip_controller.dart';
import '../../Main/main_screen.dart';
import '../../MetalPice/metal_price_screen.dart';
import '../../SignIn/Components/RoundedTextField.dart';
import '../../SignIn/Components/SignInComponents.dart';
import '../donutchart_widget.dart';

class SIPSummaryScreen extends StatefulWidget {
  const SIPSummaryScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SIPSummaryState();
  }
}

class _SIPSummaryState extends State<SIPSummaryScreen> {
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
              child: Text(Strings.sipSummary,
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
              MetalPriceScreen(),
              sipDetailsWidget(),
              sipFieldWidget(controller)
            ],
          ),
        ),
      ));
    });
  }

  Widget sipDetailsWidget() {
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
            height: 10,
          ),
          Column(
            children: [
              detailsItem(Strings.leasingTo, "Auspicious by RESBL"),
             GestureDetector(onTap: (){
               Get.to(() => GoldPartnerScreen(),
                   binding: DigitalInvestmentBiding());
             },child:  Container(
                 margin: EdgeInsets.only(top: 5),
                 width: MediaQuery.sizeOf(context).width,
                 child: Text("Switch Gold+ Partner",
                     textAlign: TextAlign.end,
                     style: TextStyle(
                       decoration: TextDecoration.underline,
                       color: primaryTextColor,
                       fontFamily: Strings.fontFamilyName,
                       fontWeight: FontWeight.normal,
                       fontSize: 10,
                     ))),)
            ],
          ),
          SizedBox(
            height: 15,
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

  Widget sipFieldWidget(DgSIPController controller) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          subtitle(Strings.investmentPurpose),
          const SizedBox(
            height: 10,
          ),
          RoundedTextField(
            onChanged: (value) {
              // controller.isFirstNameError(value.isEmpty);
              // controller.update();
            },
            keyboardType: TextInputType.text,
            validator: (value) {
              return null;
            },
            controller: controller.investmentController,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z]")),
            ],
            isEnabled: true,
            hint: Strings.investmentPurpose,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(
            height: 5,
          ),
          if (controller.isInvestError.value)
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
          subtitle(Strings.selectStartDate),
          const SizedBox(
            height: 10,
          ),
          RoundedTextField(
            onChanged: (value) {
              // controller.isFirstNameError(value.isEmpty);
              // controller.update();
            },
            keyboardType: TextInputType.text,
            validator: (value) {
              return null;
            },
            controller: controller.startDateController,
            inputFormatters: const [],
            onTap: () {
              controller.selectDate(context);
            },
            hint: Strings.selectStartDate,
            textInputAction: TextInputAction.next,
            isEnabled: true,
          ),
          const SizedBox(
            height: 5,
          ),
          if (controller.isSelectDateError.value)
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
            height: 20,
          ),

          Container(
            width: MediaQuery.sizeOf(context).width,
            padding: EdgeInsets.all(10),
            color: kycProductBackgroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Text(
                "Please Note!",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: primaryTextColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  fontFamily: Strings.fontFamilyName,
                )),
              Text(
                "Your SIP will from 27/03/2023 and the amount will be deducted 27th of every month",
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: primaryTextColor,
                  fontWeight: FontWeight.normal,
                  fontSize: 11,
                  fontFamily: Strings.fontFamilyName,
                ),
              ),
            ],),
          )
        ],
      ),
    );
  }
}
