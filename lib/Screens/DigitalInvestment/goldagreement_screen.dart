import 'package:augmont_v2/Screens/DigitalInvestment/SIP/sip_summary_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../Utils/colors.dart';
import '../../Utils/strings.dart';
import '../../bindings/digitalinvestment_binding.dart';
import '../../controllers/dgsip_controller.dart';
import 'donutchart_widget.dart';

class GoldAgreementScreen extends StatefulWidget {
  const GoldAgreementScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _GoldAgreementState();
  }
}

class _GoldAgreementState extends State<GoldAgreementScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DgSIPController>(builder: (controller) {
      return SafeArea(
          child: Scaffold(
        appBar: AppBar(
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
              child: Text(Strings.goldAgreement,
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
                  Get.back();
                  Get.to(() => SIPSummaryScreen(),
                      binding: DigitalInvestmentBiding());
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
          child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: 50,
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        Text(Strings.termCondition,
                            style: TextStyle(
                              color: primaryTextColor,
                              fontFamily: Strings.fontFamilyName,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            )),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            controller.goldAggrementDailog(context);
                          },
                          child: Text(Strings.readDetails,
                              style: TextStyle(
                                color: primaryTextColor,
                                fontFamily: Strings.fontFamilyName,
                                fontWeight: FontWeight.normal,
                                fontSize: 10,
                              )),
                        )
                      ],
                    ),
                  ),
                  aggreementList(),
                  Container(
                    color: kycProductBackgroundColor,
                    margin: EdgeInsets.only(top: 10),
                    child: CheckboxListTile(
                      title:
                          Text("I read and understand the Terms & Conditions",
                              style: TextStyle(
                                color: primaryTextColor,
                                fontFamily: Strings.fontFamilyName,
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                              )),
                      value: false,
                      onChanged: (newValue) {},
                      controlAffinity: ListTileControlAffinity
                          .leading, //  <-- leading Checkbox
                    ),
                  )
                ],
              )),
        ),
      ));
    });
  }

  aggreementList() {
    return ListView.builder(
      itemCount: 5,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return Container(
          color: kycProductBackgroundColor,
          child: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 30,
                      decoration: const ShapeDecoration(
                        color: Colors.white,
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.bedroom_child_outlined),
                        iconSize: 15,
                        onPressed: () {},
                      ),
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('No Lock-in peroid',
                            style: TextStyle(
                              color: primaryTextColor,
                              fontFamily: Strings.fontFamilyName,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            )),
                        Text(
                            'You can withdraw your lease anytime you want,selling gold takes 48 hours after buying time',
                            style: TextStyle(
                              color: primaryTextColor,
                              fontFamily: Strings.fontFamilyName,
                              fontWeight: FontWeight.normal,
                              fontSize: 11,
                            )),
                      ],
                    ))
                  ],
                ),
              ),
              Divider(
                height: 0.5,
                color: Colors.grey,
              )
            ],
          ),
        );
      },
    );
  }
}
