import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../Utils/colors.dart';
import '../../../Utils/strings.dart';
import '../../../controllers/dgsip_controller.dart';
import '../../SignIn/Components/RoundedTextField.dart';
import '../../SignIn/Components/SignInComponents.dart';
import '../barchart_widget.dart';
import '../donutchart_widget.dart';

class SIPStepupScreen extends StatefulWidget {
  const SIPStepupScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SIPStepupState();
  }
}

class _SIPStepupState extends State<SIPStepupScreen> {
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
              child: Text("SIP Details",
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
                onPressed: () {},
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
                margin: EdgeInsets.only(bottom: 10),
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
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: kycProductBackgroundColor),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text('Projected growth after 10 years',
                        style: TextStyle(
                          color: primaryTextColor,
                          fontFamily: Strings.fontFamilyName,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      color: shadowColor,
                      height: 200,
                      child: BarchartWidegt(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Current Instalment value ₹4,000',
                        style: TextStyle(
                          color: primaryTextColor,
                          fontFamily: Strings.fontFamilyName,
                          fontWeight: FontWeight.normal,
                          fontSize: 10,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    RichText(
                        text: TextSpan(
                      text: 'Instalment value ₹6,000',
                      style: TextStyle(
                        color: primaryTextColor,
                        fontFamily: Strings.fontFamilyName,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                      children: <InlineSpan>[
                        TextSpan(
                          text: " (+6% annually)",
                          style: TextStyle(
                            color: primaryTextColor,
                            fontFamily: Strings.fontFamilyName,
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ))
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 350,
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
                                  'Step-Up by Percentage',
                                  style: TextStyle(
                                    fontFamily: Strings.fontFamilyName,
                                    fontWeight: FontWeight.w500,
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
                              'Step-up by Amount',
                              style: TextStyle(
                                fontFamily: Strings.fontFamilyName,
                                fontWeight: FontWeight.w500,
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
              stepupView(controller)
            ],
          ),
        ),
      ));
    });
  }

  Widget stepupView(DgSIPController controller) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Text(
          //   controller.isGoldSelected
          //       ? 'Select % to Step-Up'
          //       : 'Select Amount to Step-Up',
          //   style: TextStyle(
          //     fontFamily: Strings.fontFamilyName,
          //     fontWeight: FontWeight.w500,
          //     fontSize: 13,
          //     color: primaryTextColor,
          //   ),
          // ),
          // SizedBox(
          //     height: 35,
          //     child: ListView.builder(
          //         scrollDirection: Axis.horizontal,
          //         itemCount: controller.stepupPercList.length,
          //         shrinkWrap: true,
          //         itemBuilder: (BuildContext context, int index) {
          //           return GestureDetector(
          //             onTap: () {
          //               setState(() {
          //                 controller.selectedamount =
          //                     controller.stepupPercList[index];
          //                 controller.priceTextController.text =
          //                     controller.selectedamount;
          //               });
          //             },
          //             child: Container(
          //                 margin: EdgeInsets.only(right: 5),
          //                 padding: EdgeInsets.all(8),
          //                 decoration: BoxDecoration(
          //                   color: Colors.white,
          //                   borderRadius: BorderRadius.circular(5.0),
          //                   border: Border.all(
          //                       color: controller.selectedamount ==
          //                               controller.stepupPercList[index]
          //                           ? primaryTextColor
          //                           : Colors.grey),
          //                 ),
          //                 child: Text(
          //                     controller.isGoldSelected
          //                         ? "${controller.stepupPercList[index]}"
          //                         : "₹ ${controller.stepupPercList[index]}",
          //                     style: TextStyle(
          //                       color: controller.selectedamount ==
          //                               controller.stepupPercList[index]
          //                           ? primaryTextColor
          //                           : Colors.grey,
          //                       fontFamily: Strings.fontFamilyName,
          //                       fontWeight: FontWeight.w600,
          //                       fontSize: 12,
          //                     ))),
          //           );
          //         })),
        ],
      ),
    );
  }
}
