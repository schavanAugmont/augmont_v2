import 'package:augmont_v2/Screens/DigitalInvestment/SIP/sip_stepup_screen.dart';
import 'package:augmont_v2/Screens/MetalPice/metal_price_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../Utils/colors.dart';
import '../../../Utils/strings.dart';
import '../../../bindings/digitalinvestment_binding.dart';
import '../../../controllers/dgsip_controller.dart';
import '../../SignIn/Components/RoundedTextField.dart';
import '../../SignIn/Components/SignInComponents.dart';
import '../donutchart_widget.dart';

class EditSIPStructureScreen extends StatefulWidget {
  const EditSIPStructureScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _EditSIPStructureState();
  }
}

class _EditSIPStructureState extends State<EditSIPStructureScreen> {
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
              child: Text("Edit SIP",
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
              projectedGrowthView(context),
              growthCal(controller),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Get.back();
                          Get.back();
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 40.0),
                          backgroundColor: primaryTextColor,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10), // <-- Radius
                          ),
                        ),
                        child: Text(Strings.saveChange,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: Strings.fontFamilyName,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ))),
                    Container(
                        width: double.infinity,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            side: const BorderSide(
                              width: 1.0,
                              color: primaryTextColor,
                            ),
                          ),
                          onPressed: () {
                            Get.back();
                          },
                          child: Text(Strings.discard,
                              style: TextStyle(
                                color: primaryTextColor,
                                fontFamily: Strings.fontFamilyName,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              )),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ));
    });
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
          Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Center(
                      child: Text("Projected Growth",
                          style: TextStyle(
                            color: primaryTextColor,
                            fontFamily: Strings.fontFamilyName,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ))),
                  Container(
                    height: 200,
                    child: DonutChartWidget(),
                  ),
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
                    )),
                  )
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
                )),
              ))
        ],
      ),
    );
  }

  Widget growthCal(DgSIPController controller) {
    return Container(
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
}
