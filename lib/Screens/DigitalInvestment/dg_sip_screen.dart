import 'package:augmont_v2/Screens/DigitalInvestment/linechart_widget.dart';
import 'package:augmont_v2/controllers/digitalinvestment_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../Utils/colors.dart';
import '../../Utils/strings.dart';
import '../../controllers/dgsip_controller.dart';
import '../Home/Components/home_components.dart';
import 'barchart_widget.dart';
import 'donutchart_widget.dart';

class DgSIPScreen extends StatefulWidget {
  const DgSIPScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DgSIPState();
  }
}

class _DgSIPState extends State<DgSIPScreen> {
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
              child: Text(Strings.digitalGold,
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
                  controller.enableLeasingDailog(context);
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
              Container(
                margin: EdgeInsets.only(bottom: 20),
                color: kycProductBackgroundColor,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Text(Strings.goldPrice,
                        style: TextStyle(
                          color: primaryTextColor,
                          fontFamily: Strings.fontFamilyName,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        )),
                    Spacer(),
                    Text('₹ 6000/gm',
                        style: TextStyle(
                          color: primaryTextColor,
                          fontFamily: Strings.fontFamilyName,
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                        )),
                    const SizedBox(
                      width: 5,
                    ),
                    Image.asset(
                      'assets/images/ic_increment.png',
                      width: 10,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
              projectedGrowthView(context),
              growthCal(controller),
            ],
          ),
        ),
      ));
    });
  }

  Widget growthCal(DgSIPController controller) {
    return Container(
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              color: kycProductBackgroundColor,
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(  controller.isSwitched
                          ? Strings.goldplusEnablemsg
                          : Strings.switchgoldmsg,
                          style: TextStyle(
                            color: primaryTextColor,
                            fontFamily: Strings.fontFamilyName,
                            fontWeight: FontWeight.w600,
                            fontSize: 11,
                          )),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                          controller.isSwitched
                              ? Strings.goldplusEnabledecp
                              : Strings.switchgolddscp,
                          style: TextStyle(
                            color: primaryTextColor,
                            fontFamily: Strings.fontFamilyName,
                            fontWeight: FontWeight.normal,
                            fontSize: 11,
                          )),
                    ],
                  )),
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
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 380,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: kycProductBackgroundColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4.0,
                    horizontal: 4.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 25,
                        width: 160,
                        decoration: BoxDecoration(
                          color: controller.isGoldSelected
                              ? Colors.white
                              : kycProductBackgroundColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: GestureDetector(
                            onTap: () {
                              controller.onViewTap(true);
                            },
                            child: Center(
                              child: Text(
                                'One Time',
                                style: TextStyle(
                                  fontFamily: Strings.fontFamilyName,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: controller.isGoldSelected
                                      ? primaryTextColor
                                      : Colors.black45,
                                ),
                              ),
                            )),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 160,
                        height: 25,
                        decoration: BoxDecoration(
                          color: controller.isGoldSelected
                              ? kycProductBackgroundColor
                              : Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            controller.onViewTap(false);
                          },
                          child: Center(
                              child: Text(
                            'SIP (Recommanded)',
                            style: TextStyle(
                              fontFamily: Strings.fontFamilyName,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: controller.isGoldSelected
                                  ? Colors.black45
                                  : primaryTextColor,
                            ),
                          )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'Investment Pattern',
              style: TextStyle(
                fontFamily: Strings.fontFamilyName,
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: primaryTextColor,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Row(
                children: <Widget>[
                  Expanded(
                      flex: 2,
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              controller.timeline = controller.timelineList[1];
                            });
                          },
                          child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    width: 1.0,
                                    color: controller.timeline ==
                                            controller.timelineList[1]
                                        ? primaryTextColor
                                        : kycProductBackgroundColor),
                              ),
                              child: Center(
                                  child: Text(controller.timelineList[1],
                                      style: TextStyle(
                                        color: controller.timeline ==
                                                controller.timelineList[1]
                                            ? primaryTextColor
                                            : shadowColor,
                                        fontFamily: Strings.fontFamilyName,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      )))))),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      flex: 2,
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              controller.timeline = controller.timelineList[2];
                            });
                          },
                          child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    width: 1.0,
                                    color: controller.timeline ==
                                            controller.timelineList[2]
                                        ? primaryTextColor
                                        : kycProductBackgroundColor),
                              ),
                              child: Center(
                                  child: Text(controller.timelineList[2],
                                      style: TextStyle(
                                        color: controller.timeline ==
                                                controller.timelineList[2]
                                            ? primaryTextColor
                                            : shadowColor,
                                        fontFamily: Strings.fontFamilyName,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      )))))),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      flex: 2,
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              controller.timeline = controller.timelineList[3];
                            });
                          },
                          child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    width: 1.0,
                                    color: controller.timeline ==
                                            controller.timelineList[3]
                                        ? primaryTextColor
                                        : kycProductBackgroundColor),
                              ),
                              child: Center(
                                  child: Text(controller.timelineList[3],
                                      style: TextStyle(
                                        color: controller.timeline ==
                                                controller.timelineList[3]
                                            ? primaryTextColor
                                            : shadowColor,
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
            Text(
              'Enter Amount',
              style: TextStyle(
                fontFamily: Strings.fontFamilyName,
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: primaryTextColor,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              textAlign: TextAlign.start,
              maxLength: 10,
              maxLines: 1,
              controller: controller.priceTextController,
              onChanged: (value) {},
              validator: (value) {
                return null;
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: kycProductBackgroundColor,
                filled: true,
                counterText: "",
                hintText: Strings.enterCustomPrice,
              ),
              style: TextStyle(
                fontFamily: Strings.fontFamilyName,
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: primaryTextColor,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
                height: 35,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.amountList.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            controller.selectedamount =
                                controller.amountList[index];
                            controller.priceTextController.text =
                                controller.selectedamount;
                          });
                        },
                        child: Container(
                            margin: EdgeInsets.only(right: 5),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                  color: controller.selectedamount ==
                                          controller.amountList[index]
                                      ? primaryTextColor
                                      : Colors.grey),
                            ),
                            child: Text("₹ ${controller.amountList[index]}",
                                style: TextStyle(
                                  color: controller.selectedamount ==
                                          controller.amountList[index]
                                      ? primaryTextColor
                                      : Colors.grey,
                                  fontFamily: Strings.fontFamilyName,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ))),
                      );
                    })),
          ],
        ));
  }

  Widget projectedGrowthView(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: kycProductBackgroundColor),
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Column(
        children: [
          Padding(padding: EdgeInsets.all(20),
          child:Column(
            children: [
              Center(
                  child: Text("Projected Growth",
                      style: TextStyle(
                        color: primaryTextColor,
                        fontFamily: Strings.fontFamilyName,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ))),
              Container(height: 200,child:  DonutChartWidget(),),
              Center(
                child: RichText(
                    text: TextSpan(
                      text: "Total Returns: ",
                      style: TextStyle(
                        color: primaryTextColor,
                        fontFamily: Strings.fontFamilyName,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                      children: <InlineSpan>[
                        TextSpan(
                          text: '₹ 5,60,000',
                          style: TextStyle(
                            color: primaryTextColor,
                            fontFamily: Strings.fontFamilyName,
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                          ),
                        ),

                      ],
                    )),)
            ],
          )),
          Container(
              width: MediaQuery.of(context).size.width,
              color: kycProductBackgroundColor,
              height: 40,
              child: Center(
                  child: RichText(
                      text: TextSpan(
                        text: "Saving with Augmont: ",
                        style: TextStyle(
                          color: primaryTextColor,
                          fontFamily: Strings.fontFamilyName,
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                        ),
                        children: <InlineSpan>[
                          TextSpan(
                            text: '₹ 1450* annually',
                            style: TextStyle(
                              color: primaryTextColor,
                              fontFamily: Strings.fontFamilyName,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),

                        ],
                      )),))
        ],
      ),
    );
  }
}
