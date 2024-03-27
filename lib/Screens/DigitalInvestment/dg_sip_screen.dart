import 'package:augmont_v2/Screens/SignIn/Components/SignInComponents.dart';
import 'package:augmont_v2/Utils/extension_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../Utils/RateCalculator.dart';
import '../../Utils/colors.dart';
import '../../Utils/strings.dart';
import '../../controllers/dgsip_controller.dart';
import '../MetalPice/metal_price_screen.dart';
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
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          backgroundColor: Colors.white,
          centerTitle: false,
          titleSpacing: 0.0,
          title: Column(
            children: [
              10.h,
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    20.w,
                    Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 16,
                    ),
                    10.w,
                    Text(Strings.digitalGold,
                        style: TextStyle(
                          color: primaryTextColor,
                          fontFamily: Strings.fontFamilyName,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        )),
                  ],
                ),
              ),
              MetalPriceScreen(
                metalPrice: controller.currentGoldBuyRate.value,
              )
            ],
          ),
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
            margin: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            // Adjust padding as needed
            child: ElevatedButton(
                onPressed: () {
                  if (controller.isSIPSelected) {
                    controller.otgDailog(context);
                  } else {
                    controller.enableLeasingDailog(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: deliveryDescTextColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(Strings.proceed.toTitleCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: Strings.fontFamilyName,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        )),
                    Image.asset(
                      "assets/images/arrow_right.png",
                      height: 20,
                    )
                  ],
                ))),
        body: SingleChildScrollView(
          child: Column(
            children: [
              projectedGrowthView(context),
              growthCal(controller),
            ],
          ),
        ),
      );
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
              decoration: BoxDecoration(
                color: borderColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                          controller.isSwitched
                              ? Strings.goldplusEnablemsg
                              : Strings.switchgoldmsg,
                          style: TextStyle(
                            color: primaryTextColor,
                            fontFamily: Strings.fontfamilyCabinetGrotesk,
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
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
                          // setState(() {
                          //   controller.isSwitched = value;
                          //   print(controller.isSwitched);
                          // });
                          //controller.enableGoldPlusDailog(context);

                          controller.isSwitched = value;
                          controller.update();
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
                decoration: BoxDecoration(
                  border: Border.all(color: borderColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4.0,
                    horizontal: 4.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        decoration: BoxDecoration(
                          color: controller.isSIPSelected
                              ? primaryColor
                              : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            controller.onViewTap(true);
                          },
                          child: Center(
                              child: Text(
                            'SIP (Recommanded)',
                            style: TextStyle(
                              fontFamily: Strings.fontFamilyName,
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                              color: controller.isSIPSelected
                                  ? Colors.white
                                  : bottomNavigationColor,
                            ),
                          )),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: controller.isSIPSelected
                              ? Colors.white
                              : primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: GestureDetector(
                            onTap: () {
                              controller.onViewTap(false);
                            },
                            child: Center(
                              child: Text(
                                'One Time',
                                style: TextStyle(
                                  fontFamily: Strings.fontFamilyName,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12,
                                  color: controller.isSIPSelected
                                      ? bottomNavigationColor
                                      : Colors.white,
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            if (!controller.isSIPSelected) ...[
              Container(
                  color: kycProductBackgroundColor,
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Swtich to SIP for great earnings!",
                          style: TextStyle(
                            color: primaryTextColor,
                            fontFamily: Strings.fontfamilyCabinetGrotesk,
                            fontWeight: FontWeight.w600,
                            fontSize: 11,
                          )),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                          "Expert suggest invest reguraly in gold help counter the fluction for better profits ",
                          style: TextStyle(
                            color: primaryTextColor,
                            fontFamily: Strings.fontFamilyName,
                            fontWeight: FontWeight.normal,
                            fontSize: 11,
                          )),
                    ],
                  )),
            ],
            if (controller.isSIPSelected) ...[
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
              SizedBox(
                  height: 35,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.timelineList.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            controller.timeline =
                                controller.timelineList[index];

                            controller.update();
                          },
                          child: Container(
                              margin: EdgeInsets.only(right: 5),
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              decoration: BoxDecoration(
                                color: controller.timeline ==
                                        controller.timelineList[index]
                                    ? primaryColor
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                    color: controller.timeline ==
                                            controller.timelineList[index]
                                        ? primaryColor
                                        : borderColor),
                              ),
                              child: Center(
                                  child: Text(
                                      "${controller.timelineList[index]}",
                                      style: TextStyle(
                                        color: controller.timeline ==
                                                controller.timelineList[index]
                                            ? Colors.white
                                            : bottomNavigationColor,
                                        fontFamily: Strings.fontFamilyName,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                      )))),
                        );
                      })),
            ],
            SizedBox(
              height: 20,
            ),
            subtitle(
              'Enter Amount',
            ),
            SizedBox(
              height: 10,
            ),
    SizedBox(
    height: 55,
    child:  Row(
              children: [
               Expanded(child:  TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  textAlign: TextAlign.start,
                  maxLength: 10,
                  maxLines: 1,
                  controller: controller.priceTextController,
                  onChanged: (value) {

                  },
                  validator: (value) {
                    return null;
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.white,
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
                )),
                if(controller.priceTextController.text.isNotEmpty)
                Text('= ${controller.ValuesforAmt}',
                    style: TextStyle(
                      fontFamily: Strings.fontFamilyName,
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                    )),
              ],
    )  ),
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
                          controller.selectedamount =
                              controller.amountList[index];
                          controller.priceTextController.text =
                              controller.selectedamount;
                          controller.setValuesforAmt();
                          controller.update();
                        },
                        child: Container(
                            margin: EdgeInsets.only(right: 5),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: controller.selectedamount ==
                                      controller.amountList[index]
                                  ? primaryColor
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                  color: controller.selectedamount ==
                                          controller.amountList[index]
                                      ? primaryColor
                                      : borderColor),
                            ),
                            child: Text("₹ ${controller.amountList[index]}",
                                style: TextStyle(
                                  color: controller.selectedamount ==
                                          controller.amountList[index]
                                      ? Colors.white
                                      : bottomNavigationColor,
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
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Projected Growth",
                      style: TextStyle(
                        color: primaryTextColor,
                        fontFamily: Strings.fontfamilyCabinetGrotesk,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      )),
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
        ],
      ),
    );
  }
}
