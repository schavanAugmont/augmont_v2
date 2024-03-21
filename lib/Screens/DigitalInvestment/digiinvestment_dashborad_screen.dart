import 'package:augmont_v2/Screens/DigitalInvestment/linechart_widget.dart';
import 'package:augmont_v2/Screens/withdrawal/withdrawal_landing_screen.dart';
import 'package:augmont_v2/Utils/extension_util.dart';
import 'package:augmont_v2/Utils/themes.dart';
import 'package:augmont_v2/controllers/digitalinvestment_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../Utils/colors.dart';
import '../../Utils/strings.dart';
import '../Home/Components/home_components.dart';
import 'barchart_widget.dart';

class DigitalInvestmentGoldScreen extends StatefulWidget {
  const DigitalInvestmentGoldScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DigitalInvestmentGoldState();
  }
}

class _DigitalInvestmentGoldState extends State<DigitalInvestmentGoldScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DigitalInvestmentController>(builder: (controller) {
      return PopScope(
          canPop: false, //It should be false to work
          onPopInvoked: (didPop) {
            if (didPop) {
              return;
            }
            controller.onBack();
          },
          child: Scaffold(
            appBar: AppBar(
              centerTitle: false,
              titleSpacing: 0.0,
              leading: IconButton(
                onPressed: () {
                  controller.onBack();
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
                  child: Text(Strings.digitalInv,
                      style: TextStyle(
                        color: primaryTextColor,
                        fontFamily: Strings.fontFamilyName,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ))),
              flexibleSpace: new Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    colors: [
                      Colors.amber.withOpacity(0.2),
                      Colors.amber.withOpacity(0.1),
                    ],
                  ),
                ),
              ),
              systemOverlayStyle: SystemUiOverlayStyle.dark,
            ),
            bottomNavigationBar: Container(
                height: 55,
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                // Adjust padding as needed
                child: ElevatedButton(
                    onPressed: () {
                      controller.chooseInvestGrowthDailog(context);
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 55.0),
                        backgroundColor: Colors.black),
                    child: Text("Start Investing in Gold",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: Strings.fontFamilyName,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        )))),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  metalSelectionWidget(context, controller),
                  portfolioContainer(context, controller),
                  priceGRaphWidget(context, controller),
                  SizedBox(
                    height: 20,
                  ),
                  setfdView(context),
                  SizedBox(
                    height: 20,
                  ),
                  sipList(controller),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    decoration: BoxDecoration(
                      color:borderColor,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: borderColor),
                    ),
                    padding: EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/mutli_customer.png',height: 30),

                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                              "Over 10K customers have invested in Gold SIP with Augmont",
                              style: TextStyle(
                                color: primaryTextColor,
                                fontFamily: Strings.fontFamilyName,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              )),
                        ),
                      ],
                    ),
                  ),
                  growthCal(controller),
                  setWalletView(context),
                  Container(
                      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Advantages of Digital \nGold Investment",
                              style: TextStyle(
                                color: bottomNavigationColor,
                                fontFamily: Strings.fontfamilyCabinetGrotesk,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                              height: 200.0,
                              child: ListView.builder(
                                  //here your code
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5,
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return digitalInvestmentListItem();
                                  }))
                        ],
                      )),
                  Container(
                      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Gold in th News",
                              style: TextStyle(
                                color: primaryTextColor,
                                fontFamily: Strings.fontfamilyCabinetGrotesk,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                              height: 130.0,
                              child: ListView.builder(
                                  //here your code
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 5,
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return newsListItem();
                                  }))
                        ],
                      )),
                  Container(
                    decoration: BoxDecoration(
                      color: borderColor,
                      border: Border.all(color: borderColor),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    padding: EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "Use DigiGold to Purchase \nJewellery and more",
                            style: TextStyle(
                              color: bottomNavigationColor,
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
                                    Text(
                                        "Use your digital gold to pay at nearest store",
                                        maxLines: 5,
                                        style: TextStyle(
                                          color: primaryTextColor,
                                          fontFamily: Strings.fontFamilyName,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14,
                                        )),
                                    SizedBox(
                                      height: 20,
                                    ),

                                    Text(
                                        "Find stores near you",
                                        style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: bottomNavigationColor,
                                          fontFamily: Strings.fontFamilyName,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        )),

                                  ],
                                )),
                                SizedBox(
                                  width: 15,
                                ),

                                  Image.asset('assets/images/store_image.png'),


                              ],
                            ),

                      ],
                    ),
                  ),
                  safeGoldWidget(context)
                ],
              ),
            ),
          ));
    });
  }

  Widget sipList(DigitalInvestmentController controller) {
    return Container(
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("My SIP",
                style: TextStyle(
                  color: primaryTextColor,
                  fontFamily: Strings.fontFamilyName,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                )),
            SizedBox(
              height: 10,
            ),
            ListView.builder(
              itemCount: 3,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    controller.goToSIpDetails();
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(color: kycProductBackgroundColor),
                    ),
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Wedding Jewellery",
                                style: TextStyle(
                                  color: primaryTextColor,
                                  fontFamily: Strings.fontFamilyName,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                )),
                            Spacer(),
                            RichText(
                                text: TextSpan(
                              text: '₹2000',
                              style: TextStyle(
                                fontFamily: Strings.fontFamilyName,
                                fontWeight: FontWeight.w600,
                                color: primaryTextColor,
                                fontSize: 11,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: '/day',
                                  style: TextStyle(
                                    fontFamily: Strings.fontFamilyName,
                                    fontWeight: FontWeight.normal,
                                    color: primaryTextColor,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ))
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Daily SIP",
                                style: TextStyle(
                                  color: primaryTextColor,
                                  fontFamily: Strings.fontFamilyName,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12,
                                )),
                            Spacer(),
                            Text("Active",
                                style: TextStyle(
                                  color: primaryTextColor,
                                  fontFamily: Strings.fontFamilyName,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 11,
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          height: 0.2,
                          color: kycProductBackgroundColor,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Total Investment",
                                    style: TextStyle(
                                      color: primaryTextColor,
                                      fontFamily: Strings.fontFamilyName,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 11,
                                    )),
                                Text("₹17,00,000",
                                    style: TextStyle(
                                      color: primaryTextColor,
                                      fontFamily: Strings.fontFamilyName,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    )),
                              ],
                            )),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Current Value",
                                    style: TextStyle(
                                      color: primaryTextColor,
                                      fontFamily: Strings.fontFamilyName,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 11,
                                    )),
                                Text("₹24,00,00",
                                    style: TextStyle(
                                      color: primaryTextColor,
                                      fontFamily: Strings.fontFamilyName,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                    )),
                              ],
                            ))
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ));
  }

  Widget newsListItem() {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(10.0),
      ),
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                "assets/images/news_icon.png",
                height: 30,
              ),
              SizedBox(
                width: 10,
              ),
              Text("Money Control",
                  maxLines: 2,
                  style: TextStyle(
                    color: primaryTextColor,
                    fontFamily: Strings.fontFamilyName,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
              "Gold is one of the safest way to grow your money for next 30 year",
              maxLines: 2,
              style: TextStyle(
                color: primaryTextColor,
                fontFamily: Strings.fontFamilyName,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              )),
          Spacer(),
          Text("08th Oct 2023",
              maxLines: 2,
              style: TextStyle(
                color: Colors.grey,
                fontFamily: Strings.fontFamilyName,
                fontWeight: FontWeight.w600,
                fontSize: 11,
              )),
        ],
      ),
    );
  }

  Widget digitalInvestmentListItem() {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(10.0),
      ),
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
         Center(child:  Image.asset(
           "assets/images/lower_tax.png",
           height: 90,
         ),),
          SizedBox(
            width: 10,
          ),
          Text("Lower Tax",
              maxLines: 2,
              style: TextStyle(
                color: primaryTextColor,
                fontFamily: Strings.fontFamilyName,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              )),
          SizedBox(
            height: 5,
          ),
          Text(
              "Compared to Jewellery digital only charge 3% tax.",

              style: TextStyle(
                color: primaryTextColor,
                fontFamily: Strings.fontFamilyName,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              )),

        ],
      ),
    );
  }

  Widget growthCal(DigitalInvestmentController controller) {
    return Container(
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Growth Calculator",
                style: TextStyle(
                  color: primaryTextColor,
                  fontFamily: Strings.fontfamilyCabinetGrotesk,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                )),
            SizedBox(
              height: 10,
            ),
            Container(

              margin: EdgeInsets.only(top: 10),
              height: 250,
              child: BarchartWidegt(
                screen: 'dashboard',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: shadowColor),
                color: white,
                boxShadow: const [
                  BoxShadow(
                    color: shadowColor,
                    offset: Offset(0.0, 1.0),
                    blurRadius: 0.5,
                  )
                ],
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                      flex: 2,
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              controller.timeline = controller.timelineList[0];
                            });
                          },
                          child: Container(
                              height: 25,
                              decoration: BoxDecoration(
                                color: controller.timeline ==
                                        controller.timelineList[0]
                                    ? primaryTextColor
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                  child: Text(controller.timelineList[0],
                                      style: TextStyle(
                                        color: controller.timeline ==
                                                controller.timelineList[0]
                                            ? Colors.white
                                            : primaryTextColor,
                                        fontFamily: Strings.fontFamilyName,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      )))))),
                  Expanded(
                      flex: 2,
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              controller.timeline = controller.timelineList[1];
                            });
                          },
                          child: Container(
                              height: 25,
                              decoration: BoxDecoration(
                                color: controller.timeline ==
                                        controller.timelineList[1]
                                    ? primaryTextColor
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                  child: Text(controller.timelineList[1],
                                      style: TextStyle(
                                        color: controller.timeline ==
                                                controller.timelineList[1]
                                            ? Colors.white
                                            : primaryTextColor,
                                        fontFamily: Strings.fontFamilyName,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      )))))),
                  Expanded(
                      flex: 2,
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              controller.timeline = controller.timelineList[2];
                            });
                          },
                          child: Container(
                              height: 25,
                              decoration: BoxDecoration(
                                color: controller.timeline ==
                                        controller.timelineList[2]
                                    ? primaryTextColor
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                  child: Text(controller.timelineList[2],
                                      style: TextStyle(
                                        color: controller.timeline ==
                                                controller.timelineList[2]
                                            ? Colors.white
                                            : primaryTextColor,
                                        fontFamily: Strings.fontFamilyName,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      )))))),
                  Expanded(
                      flex: 2,
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              controller.timeline = controller.timelineList[3];
                            });
                          },
                          child: Container(
                              height: 25,
                              decoration: BoxDecoration(
                                color: controller.timeline ==
                                        controller.timelineList[3]
                                    ? primaryTextColor
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                  child: Text(controller.timelineList[3],
                                      style: TextStyle(
                                        color: controller.timeline ==
                                                controller.timelineList[3]
                                            ? Colors.white
                                            : primaryTextColor,
                                        fontFamily: Strings.fontFamilyName,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      )))))),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("${controller.timeline} Investment",
                          style: TextStyle(
                            color: primaryTextColor,
                            fontFamily: Strings.fontFamilyName,
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: primaryTextColor,
                            thumbColor: primaryTextColor,
                            overlayShape: SliderComponentShape.noThumb,
                            trackHeight: 2,
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 5),
                          ),
                          child: Slider(
                            value: controller.amount.toDouble(),
                            onChanged: (value) {
                              setState(() {
                                controller.amount = value.toInt();
                              });
                            },
                            min: 0,
                            max: 20000,
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("₹ 10",
                                style: TextStyle(
                                  color: primaryTextColor,
                                  fontFamily: Strings.fontFamilyName,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 10,
                                )),
                            Text("₹ 20000",
                                style: TextStyle(
                                  color: primaryTextColor,
                                  fontFamily: Strings.fontFamilyName,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 10,
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: kycProductBackgroundColor),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 45,
                    child: Row(
                      children: [
                        Text("₹",
                            style: TextStyle(
                              color: Colors.grey,
                              fontFamily: Strings.fontFamilyName,
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            )),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Time Peroid",
                          style: TextStyle(
                            color: primaryTextColor,
                            fontFamily: Strings.fontFamilyName,
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: primaryTextColor,
                            thumbColor: primaryTextColor,
                            overlayShape: SliderComponentShape.noThumb,
                            trackHeight: 2,
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 5),
                          ),
                          child: Slider(
                            value: controller.year.toDouble(),
                            onChanged: (value) {
                              setState(() {
                                controller.year = value.toInt();
                              });
                            },
                            min: 1,
                            max: 40,
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("1 Year",
                                style: TextStyle(
                                  color: primaryTextColor,
                                  fontFamily: Strings.fontFamilyName,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 10,
                                )),
                            Text("40 Year",
                                style: TextStyle(
                                  color: primaryTextColor,
                                  fontFamily: Strings.fontFamilyName,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 10,
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: kycProductBackgroundColor),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 45,
                    child: Row(
                      children: [
                        Text("Years ",
                            style: TextStyle(
                              color: Colors.grey,
                              fontFamily: Strings.fontFamilyName,
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            )),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              color: kycProductBackgroundColor,
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text("Gold+ Returns (16.0%)",
                      style: TextStyle(
                        color: primaryTextColor,
                        fontFamily: Strings.fontFamilyName,
                        fontWeight: FontWeight.w600,
                        fontSize: 11,
                      )),
                  Spacer(),
                  Transform.scale(
                      scale: 0.6,
                      child: Switch(
                        value: controller.isSwitched,
                        onChanged: (value) {
                          setState(() {
                            controller.isSwitched = value;
                            print(controller.isSwitched);
                          });
                        },
                        activeTrackColor: primaryTextColor,
                        activeColor: Colors.white,
                      )),
                ],
              ),
            )
          ],
        ));
  }

  Widget metalSelectionWidget(
      BuildContext context, DigitalInvestmentController controller) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.only(top: 15, left: 20, right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: borderColor),
          color: white,
          boxShadow: const [
            BoxShadow(
              color: borderColor,
              offset: Offset(0.0, 1.0),
              blurRadius: 0.5,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 4.0,
            horizontal: 4.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      controller.onViewTap(true);
                    },
                    child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                          color: controller.isGoldSelected
                              ? primaryColor
                              : Colors.white,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Center(
                          child: Text(
                            'Gold Investments',
                            style: TextStyle(
                              fontFamily: Strings.fontFamilyName,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              color: controller.isGoldSelected
                                  ? Colors.white
                                  : primaryTextColor,
                            ),
                          ),
                        )),
                  )),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      controller.onViewTap(false);
                    },
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: controller.isGoldSelected
                            ? Colors.white
                            : primaryColor,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Center(
                          child: Text(
                        'Sliver Investments',
                        style: TextStyle(
                          fontFamily: Strings.fontFamilyName,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: controller.isGoldSelected
                              ? primaryTextColor
                              : Colors.white,
                        ),
                      )),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget portfolioContainer(
      BuildContext context, DigitalInvestmentController controller) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          // background image and bottom contents
          Column(
            children: <Widget>[
              Container(
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                    color: borderColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      topLeft: Radius.circular(10.0),
                    )),
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Text("Gold Portfolio",
                        style: TextStyle(
                          color: bottomNavigationColor,
                          fontFamily: Strings.fontFamilyName,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    Text("₹1,03,500",
                        style: TextStyle(
                          color: primaryTextColor,
                          fontFamily: Strings.fontfamilyCabinetGrotesk,
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                        )),
                    5.h,
                    RichText(
                        text: TextSpan(
                      text: "Total Investment: ",
                      style: TextStyle(
                        color: primaryTextColor,
                        fontFamily: Strings.fontFamilyName,
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                      ),
                      children: <InlineSpan>[
                        TextSpan(
                          text: '₹ 5,60,000',
                          style: TextStyle(
                            color: primaryTextColor,
                            fontFamily: Strings.fontFamilyName,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    )),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width,
                margin: EdgeInsets.all(10),
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Divider(
                      height: 0.5,
                      color: lightColor,
                    ),
                    2.h,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              )),
                          onPressed: () {
                            Get.to(() => WithdrawalLandingScreen());
                          },
                          child: Text(
                            "Withdraw Investment",
                            style: TextStyle(
                              color: primaryTextColor,
                              fontFamily: Strings.fontFamilyName,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                        ),
                        Container(
                          width: 1,
                          height: 24,
                          color: lightColor,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              )),
                          onPressed: () {},
                          child: Text(
                            "Transaction History",
                            style: TextStyle(
                              color: primaryTextColor,
                              fontFamily: Strings.fontFamilyName,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          // Profile image
          Positioned(
            top: 105.0,
            left: 10.0,
            right: 10.0,
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: borderColor, width: 1.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  portfolioWidget("42.8g", "Total Gold"),
                  portfolioWidget("6.8g", "Gold+ (G)"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget portfolioWidget(String value, String title) {
    return RichText(
        text: TextSpan(
      text: "$value\n",
      style: TextStyle(
        fontFamily: Strings.fontFamilyName,
        fontWeight: FontWeight.w600,
        color: primaryTextColor,
        fontSize: 18,
      ),
      children: <TextSpan>[
        TextSpan(
          text: title,
          style: TextStyle(
            fontFamily: Strings.fontFamilyName,
            fontWeight: FontWeight.normal,
            color: primaryTextColor,
            fontSize: 12,
          ),
        ),
      ],
    ));
  }

  Widget priceNugets(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: borderColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.only(top: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Gold Prices at 3 Month Low,best time to buy",
                      style: TextStyle(
                        color: primaryTextColor,
                        fontFamily: Strings.fontfamilyCabinetGrotesk,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      )),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // Text(Strings.investNow,
                  //     style: TextStyle(
                  //       decoration: TextDecoration.underline,
                  //       color: bottomNavigationColor,
                  //       fontFamily: Strings.fontFamilyName,
                  //       fontWeight: FontWeight.w600,
                  //       fontSize: 12,
                  //     )),
                ],
              )),
              SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/low_price_image.png',
                    height: 60,
                  ),
                  // Text("₹6,002/gm",
                  //     maxLines: 5,
                  //     style: TextStyle(
                  //       color: bottomNavigationColor,
                  //       fontFamily: Strings.fontFamilyName,
                  //       fontWeight: FontWeight.w600,
                  //       fontSize: 17,
                  //     ))
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget priceGRaphWidget(
      BuildContext context, DigitalInvestmentController controller) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('₹ 6000/gm',
                      style: TextStyle(
                        color: primaryTextColor,
                        fontFamily: Strings.fontFamilyName,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      )),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "+124 (1.8%)",
                          style: TextStyle(
                            fontFamily: Strings.fontFamilyName,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.green,
                          ),
                        ),
                        TextSpan(
                          text: ' This  month',
                          style: TextStyle(
                              fontFamily: Strings.fontFamilyName,
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                              color: primaryTextColor),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Spacer(),
              GestureDetector(
                // <-- OutlinedButton
                onTap: () {
                  controller.priceAlertsDailog(context);
                },
                child: Text(
                  'Price Alerts',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontFamily: Strings.fontFamilyName,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: bottomNavigationColor),
                ),
              ),
            ],
          ),
          Container(
            height: 250,
            child: LinechartWidget(),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
              height: 35,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.listTime.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          controller.selectedTime = controller.listTime[index];
                        });
                      },
                      child: Container(
                          margin: EdgeInsets.only(right: 5),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: controller.selectedTime ==
                                    controller.listTime[index]
                                ? primaryColor
                                : Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                                color: controller.selectedTime ==
                                        controller.listTime[index]
                                    ? primaryColor
                                    : Colors.grey),
                          ),
                          child: Text(controller.listTime[index],
                              style: TextStyle(
                                color: controller.selectedTime ==
                                        controller.listTime[index]
                                    ? Colors.white
                                    : Colors.grey,
                                fontFamily: Strings.fontFamilyName,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ))),
                    );
                  })),
          priceNugets(context)
        ],
      ),
    );
  }

  Widget safeGoldWidget(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Your Gold is 100% \nsafe with us!",
              maxLines: 2,
              style: TextStyle(
                color: bottomNavigationColor,
                fontFamily: Strings.fontfamilyCabinetGrotesk,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              )),
          10.h,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("13.5k",
                      style: TextStyle(
                        color: bottomNavigationColor,
                        fontFamily: Strings.fontFamilyName,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      )),
                  SizedBox(
                    height: 2,
                  ),
                  Text("People have invested with augmont",
                      maxLines: 5,
                      style: TextStyle(
                        color: primaryTextColor,
                        fontFamily: Strings.fontFamilyName,
                        fontWeight: FontWeight.normal,
                        fontSize: 11,
                      )),
                ],
              )),
              SizedBox(
                width: 5,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("\$3 Bn Revenues",
                      style: TextStyle(
                        color: primaryTextColor,
                        fontFamily: Strings.fontFamilyName,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      )),
                  SizedBox(
                    height: 2,
                  ),
                  Text("Top 150 unlisted companies in India- Dun & Brandstreet",
                      maxLines: 5,
                      style: TextStyle(
                        color: primaryTextColor,
                        fontFamily: Strings.fontFamilyName,
                        fontWeight: FontWeight.normal,
                        fontSize: 11,
                      )),
                ],
              )),
              SizedBox(
                width: 5,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("10+ Award wining",
                      style: TextStyle(
                        color: primaryTextColor,
                        fontFamily: Strings.fontFamilyName,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      )),
                  SizedBox(
                    height: 2,
                  ),
                  Text("Best Gold seller award by BFGC",
                      maxLines: 5,
                      style: TextStyle(
                        color: primaryTextColor,
                        fontFamily: Strings.fontFamilyName,
                        fontWeight: FontWeight.normal,
                        fontSize: 11,
                      )),
                ],
              )),
            ],
          )
        ],
      ),
    );
  }
}
