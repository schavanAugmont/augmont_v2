import 'package:augmont_v2/Screens/DigitalInvestment/SIP/sip_stepup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../Utils/colors.dart';
import '../../../Utils/strings.dart';
import '../../../bindings/digitalinvestment_binding.dart';
import '../../../controllers/dgsip_controller.dart';
import '../../MetalPice/metal_price_screen.dart';
import '../../SignIn/Components/RoundedTextField.dart';
import '../../SignIn/Components/SignInComponents.dart';
import '../donutchart_widget.dart';

class SIPDetailsScreen extends StatefulWidget {
  const SIPDetailsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SIPDetailsState();
  }
}

class _SIPDetailsState extends State<SIPDetailsScreen> {
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
              child: Text("SIP Name",
                  style: TextStyle(
                    color: primaryTextColor,
                    fontFamily: Strings.fontFamilyName,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ))),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              MetalPriceScreen(),
              sipDetailsWidget(controller),
              partnerWidget(),
              earnWidget(),
              transactionWidget(),
            ],
          ),
        ),
      ));
    });
  }

  Widget sipDetailsWidget(DgSIPController controller) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        border: Border.all(color: kycProductBackgroundColor),
        borderRadius: BorderRadius.circular(5.0),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                border: Border.all(color: kycProductBackgroundColor),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    color: kycProductBackgroundColor,
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Spacer(),
                            GestureDetector(onTap: (){
                              controller.goToEditSIP();
                            },child:
                            Image.asset(
                              'assets/images/ic_edit.png',
                              width: 15,
                              color: primaryTextColor,
                            ) ),
                          ],
                        ),
                        Text("SIP Details",
                            style: TextStyle(
                              color: primaryTextColor,
                              fontFamily: Strings.fontFamilyName,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            )),
                        Text('(₹5000/month)',
                            style: TextStyle(
                              color: primaryTextColor,
                              fontFamily: Strings.fontFamilyName,
                              fontWeight: FontWeight.normal,
                              fontSize: 11,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Text("₹12,25,302",
                            style: TextStyle(
                              color: primaryTextColor,
                              fontFamily: Strings.fontFamilyName,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Total Investment :₹7,35,000 (42.80g)',
                            style: TextStyle(
                              color: primaryTextColor,
                              fontFamily: Strings.fontFamilyName,
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        sipDetailsItem("Growth(12%): ", '₹35,000'),
                        sipDetailsItem("Gold+(4%): ", '₹12,000')
                      ],
                    ),
                  )
                ],
              )),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text("Withdraw from Investment",
                style: TextStyle(
                  color: primaryTextColor,
                  fontFamily: Strings.fontFamilyName,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                )),
          )
        ],
      ),
    );
  }

  Widget sipDetailsItem(String key, String value) {
    return RichText(
        text: TextSpan(
      text: key,
      style: TextStyle(
        color: primaryTextColor,
        fontFamily: Strings.fontFamilyName,
        fontWeight: FontWeight.w600,
        fontSize: 12,
      ),
      children: <InlineSpan>[
        TextSpan(
          text: value,
          style: TextStyle(
            color: primaryTextColor,
            fontFamily: Strings.fontFamilyName,
            fontWeight: FontWeight.normal,
            fontSize: 12,
          ),
        ),
      ],
    ));
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
                Text(Strings.latestInvestment,
                    style: TextStyle(
                      color: primaryTextColor,
                      fontFamily: Strings.fontFamilyName,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    )),
                Text(
                  Strings.trasactionHistory,
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
                          Text('₹35,000',
                              style: TextStyle(
                                color: primaryTextColor,
                                fontFamily: Strings.fontFamilyName,
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              )),
                          Text('16th Mar,2023',
                              style: TextStyle(
                                color: primaryTextColor,
                                fontFamily: Strings.fontFamilyName,
                                fontWeight: FontWeight.normal,
                                fontSize: 10,
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Paid successfully via UPI Autopay',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: primaryTextColor,
                            fontFamily: Strings.fontFamilyName,
                            fontWeight: FontWeight.normal,
                            fontSize: 10,
                          )),
                    ],
                  ),
                );
              },
            )
          ],
        ));
  }

  Widget earnWidget() {
    return GestureDetector(onTap:(){
      Get.to(() => SIPStepupScreen(isEditable: false,),
          binding: DigitalInvestmentBiding());
    },child:Container(
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
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Earn ₹35,000 more!",
                  style: TextStyle(
                    color: primaryTextColor,
                    fontFamily: Strings.fontFamilyName,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  )),
              SizedBox(
                height: 2,
              ),
              Text(
                  "Increase your current investment by 5% annually and get higher returns",
                  style: TextStyle(
                    color: primaryTextColor,
                    fontFamily: Strings.fontFamilyName,
                    fontWeight: FontWeight.normal,
                    fontSize: 11,
                  )),
            ],
          )),
          Image.asset(
            'assets/images/ic_arrows.png',
            width: 25,
          ),
        ],
      ),
    ));
  }

  Widget partnerWidget() {
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
              Text("Gold+ with IDBI",
                  style: TextStyle(
                    color: primaryTextColor,
                    fontFamily: Strings.fontFamilyName,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  )),
              Text("Ending by 12/04/2023",
                  style: TextStyle(
                    color: primaryTextColor,
                    fontFamily: Strings.fontFamilyName,
                    fontWeight: FontWeight.normal,
                    fontSize: 10,
                  )),
            ],
          ),
          SizedBox(height: 10,),
          Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: kycProductBackgroundColor),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("16th Mar 2023",
                          style: TextStyle(
                            color: primaryTextColor,
                            fontFamily: Strings.fontFamilyName,
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                          )),
                      Text("0.253g",
                          style: TextStyle(
                            color: primaryTextColor,
                            fontFamily: Strings.fontFamilyName,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("@5% p.a on total gold og 10g",
                          style: TextStyle(
                            color: primaryTextColor,
                            fontFamily: Strings.fontFamilyName,
                            fontWeight: FontWeight.normal,
                            fontSize: 10,
                          )),
                      Text("Interest Earned",
                          style: TextStyle(
                            color: primaryTextColor,
                            fontFamily: Strings.fontFamilyName,
                            fontWeight: FontWeight.normal,
                            fontSize: 10,
                          )),
                    ],
                  )
                ],
              )),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              partnerItem("Interest:5%"),
              partnerItem("Duration: 2years"),
              Spacer(),
              Text("View Details",
                  style: TextStyle(
                    color: primaryTextColor,
                    fontFamily: Strings.fontFamilyName,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  )),
            ],
          )
        ],
      ),
    );
  }

  Widget partnerItem(String value) {
    return Container(
      padding: EdgeInsets.only(left: 10,right: 10,top: 2,bottom: 2),
        decoration: BoxDecoration(
          border: Border.all(color: kycProductBackgroundColor),
          color: kycProductBackgroundColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
      value,
      style: TextStyle(
        color: primaryTextColor,
        fontFamily: Strings.fontFamilyName,
        fontWeight: FontWeight.normal,
        fontSize: 10,
      ),
    ));
  }
}
