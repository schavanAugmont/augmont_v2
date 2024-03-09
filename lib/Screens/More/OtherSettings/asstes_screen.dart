import 'package:augmont_v2/Screens/DigitalInvestment/linechart_widget.dart';
import 'package:augmont_v2/controllers/digitalinvestment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Utils/colors.dart';
import '../../../Utils/strings.dart';
import '../../../widgets/text_component.dart';

class AssetValueScreen extends StatefulWidget {
  const AssetValueScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AssetValueState();
  }
}

class _AssetValueState extends State<AssetValueScreen> {
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
          child: SafeArea(
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
                  child: Text(Strings.assetValue,
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
                  assetsHeader(controller),
                  assetsFooter(controller),
                ],
              ),
            ),
          )));
    });
  }

  Widget assetsHeader(DigitalInvestmentController controller) {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            width: 200,
            margin: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
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
                    width: 80,
                    decoration: BoxDecoration(
                      color: controller.isGoldSelected
                          ? primaryTextColor
                          : Colors.white,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: GestureDetector(
                        onTap: () {
                          controller.onViewTap(true);
                        },
                        child: Center(
                          child: Text(
                            'Gold',
                            style: TextStyle(
                              fontFamily: Strings.fontFamilyName,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              color: controller.isGoldSelected
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                          ),
                        )),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 80,
                    height: 25,
                    decoration: BoxDecoration(
                      color: controller.isGoldSelected
                          ? Colors.white
                          : primaryTextColor,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        controller.onViewTap(false);
                      },
                      child: Center(
                          child: Text(
                        'Sliver',
                        style: TextStyle(
                          fontFamily: Strings.fontFamilyName,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: controller.isGoldSelected
                              ? Colors.grey
                              : Colors.white,
                        ),
                      )),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: kycProductBackgroundColor),
            borderRadius: BorderRadius.circular(5.0),
          ),
          margin: EdgeInsets.only(left: 10, right: 10, top: 20),
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
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
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
                              controller.selectedTime =
                              controller.listTime[index];
                            });
                          },
                          child: Container(
                              margin: EdgeInsets.only(right: 5),
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                BorderRadius.circular(5.0),
                                border: Border.all(
                                    color: controller.selectedTime ==
                                        controller.listTime[index]
                                        ? primaryTextColor
                                        : Colors.grey),
                              ),
                              child: Text(controller.listTime[index],
                                  style: TextStyle(
                                    color: controller.selectedTime ==
                                        controller.listTime[index]
                                        ? primaryTextColor
                                        : Colors.grey,
                                    fontFamily:
                                    Strings.fontFamilyName,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  ))),
                        );
                      })),
            ],
          ),
        ),

      ],
    );
  }

  Widget assetsFooter(DigitalInvestmentController controller) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            ListView.builder(
              itemCount: 2,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(bottom: 10),
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    color: kycProductBackgroundColor,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          textComponent(
                              "Gold Selling Price", 12, FontWeight.normal),
                          SizedBox(
                            height: 8,
                          ),
                          Text('₹ 6000/gm',
                              style: TextStyle(
                                color: primaryTextColor,
                                fontFamily: Strings.fontFamilyName,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
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
                      Icon(Icons.refresh)
                    ],
                  ),
                );
              },
            )
          ],
        ));
  }
}
