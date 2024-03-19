import 'package:augmont_v2/Screens/DigitalInvestment/SIP/gold_partner_screen.dart';
import 'package:augmont_v2/Screens/DigitalInvestment/SIP/managegold_summary_screen.dart';
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

class SIPManageGoldScreen extends StatefulWidget {
  const SIPManageGoldScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SIPManageGoldState();
  }
}

class _SIPManageGoldState extends State<SIPManageGoldScreen> {
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
              child: Text("Manage Gold+",
                  style: TextStyle(
                    color: primaryTextColor,
                    fontFamily: Strings.fontFamilyName,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ))),
        ),
            bottomNavigationBar: Container(
                height: 55,
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                // Adjust padding as needed
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => ManageGoldSummaryScreen(), binding: DigitalInvestmentBiding());
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 55.0),
                        backgroundColor: Colors.black),
                    child: Text(Strings.proceed,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: Strings.fontFamilyName,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        )))),
        body: SingleChildScrollView(
          child: Column(
            children: [
             MetalPriceScreen(metalPrice: "₹ 0,00/gm",),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                        child: Text("Active Gold+",
                            style: TextStyle(
                              color: primaryTextColor,
                              fontFamily: Strings.fontFamilyName,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ))),
                    Text("Un-lease Gold",
                        style: TextStyle(
                          color: primaryTextColor,
                          fontFamily: Strings.fontFamilyName,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        )),
                  ],
                ),
              ),
              sipDetailsWidget(),
              earnWidget(),
              transactionWidget()
            ],
          ),
        ),
      ));
    });
  }

  Widget sipDetailsWidget() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: kycProductBackgroundColor),
        borderRadius: BorderRadius.circular(5.0),
      ),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          detailsItem(Strings.totalQuantity, "23 grams"),
          SizedBox(
            height: 10,
          ),
          detailsItem(Strings.interestRate, "5%"),
          SizedBox(
            height: 10,
          ),
          detailsItem(Strings.interestRec, "3 grams"),
          SizedBox(
            height: 10,
          ),
          detailsItem(Strings.activeFrom, "12-04-2023"),
          SizedBox(
            height: 10,
          ),
          detailsItem(Strings.endson, "12-04-2023"),
          SizedBox(
            height: 10,
          ),
          detailsItem(Strings.galdvalidty, "2 years"),

        ],
      ),
    );
  }

  Widget earnWidget() {
    return GestureDetector(
        onTap: () {},
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            border: Border.all(color: kycProductBackgroundColor),
            borderRadius: BorderRadius.circular(5.0),
          ),
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                  child: Text("Your Gold+ with IDBI expires in 3 days",
                      style: TextStyle(
                        color: primaryTextColor,
                        fontFamily: Strings.fontFamilyName,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ))),
              Text("Renew Gold+",
                  style: TextStyle(
                    color: primaryTextColor,
                    fontFamily: Strings.fontFamilyName,
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                  )),
            ],
          ),
        ));
  }

  Widget detailsItem(String key, String value) {
    return Row(
      children: [
        Text(key,
            style: TextStyle(
              color: primaryTextColor,
              fontFamily: Strings.fontFamilyName,
              fontWeight: FontWeight.normal,
              fontSize: 12,
            )),
        Spacer(),
        Text(value,
            style: TextStyle(
              color: primaryTextColor,
              fontFamily: Strings.fontFamilyName,
              fontWeight: FontWeight.w600,
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
                Text("Please Note!",
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
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget transactionWidget() {
    return Container(
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          border: Border.all(color: kycProductBackgroundColor),
          borderRadius: BorderRadius.circular(5.0),
        ),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(Strings.goldinterestBrkdown,
                    style: TextStyle(
                      color: primaryTextColor,
                      fontFamily: Strings.fontFamilyName,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    )),
                Text(
                  "Montly",
                  style: TextStyle(
                    color: primaryTextColor,
                    fontFamily: Strings.fontFamilyName,
                    fontWeight: FontWeight.normal,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            ListView.builder(
              itemCount: 5,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 5),
                  padding: EdgeInsets.all(10),
                  color: kycProductBackgroundColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('16th Mar, 2023',
                              style: TextStyle(
                                color: primaryTextColor,
                                fontFamily: Strings.fontFamilyName,
                                fontWeight: FontWeight.normal,
                                fontSize: 11,
                              )),
                          Text('0.2 grams',
                              style: TextStyle(
                                color: primaryTextColor,
                                fontFamily: Strings.fontFamilyName,
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('for total quantity of 23 grams',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: primaryTextColor,
                                fontFamily: Strings.fontFamilyName,
                                fontWeight: FontWeight.normal,
                                fontSize: 10,
                              )),
                          Text('@5% p.a',
                              style: TextStyle(
                                color: primaryTextColor,
                                fontFamily: Strings.fontFamilyName,
                                fontWeight: FontWeight.normal,
                                fontSize: 11,
                              )),
                        ],
                      ),

                    ],
                  ),
                );
              },
            )
          ],
        ));
  }
}
