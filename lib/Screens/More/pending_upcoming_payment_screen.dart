import 'package:augmont_v2/controllers/wallet_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../Utils/colors.dart';
import '../../Utils/strings.dart';
import '../../widgets/text_component.dart';

class PendingUpcomingPaymentScreen extends StatefulWidget {
  const PendingUpcomingPaymentScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PendingUpcomingPaymentState();
  }
}

class _PendingUpcomingPaymentState extends State<PendingUpcomingPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WalletController>(builder: (controller) {
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
                  child: Text(Strings.pendingPayment,
                      style: TextStyle(
                        color: primaryTextColor,
                        fontFamily: Strings.fontFamilyName,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ))),
            ),
            body: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ListView.builder(
                      itemCount: 5,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 10),
                          width: MediaQuery.sizeOf(context).width,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: kycProductBackgroundColor),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 40,
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                color: kycProductBackgroundColor,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    textComponent(
                                        "SIP Amount", 12, FontWeight.w600),
                                    RichText(
                                        text: TextSpan(
                                      text: "₹ 2,000",
                                      style: TextStyle(
                                        color: primaryTextColor,
                                        fontFamily: Strings.fontFamilyName,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),
                                      children: <InlineSpan>[
                                        TextSpan(
                                          text: '/mo',
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
                              Padding(
                                padding: EdgeInsets.all(15),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          color: shadowColor),
                                      height: 50,
                                      width: 50,
                                      child:  Image.asset("assets/images/coin.png"),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        textComponent("Wedding Jewellery", 14,
                                            FontWeight.w600),
                                        SizedBox(height: 5,),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text("Monthly SIP | ",
                                                style: TextStyle(
                                                  color: primaryTextColor,
                                                  fontFamily:
                                                      Strings.fontFamilyName,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 12,
                                                )),
                                            Text(
                                              "Status:",
                                              style: TextStyle(
                                                color: primaryTextColor,
                                                fontFamily:
                                                    Strings.fontFamilyName,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12,
                                              ),
                                            ), Text(
                                              "Active",
                                              style: TextStyle(
                                                color: Colors.green,
                                                fontFamily:
                                                Strings.fontFamilyName,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),

                              Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  color: primaryTextColor,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                margin: EdgeInsets.all(10),
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Upcoming EMI Date: 08/02/24",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: Strings.fontFamilyName,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 10,
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      Strings.payNow,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: Strings.fontFamilyName,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          )));
    });
  }
}
