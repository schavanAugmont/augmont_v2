import 'package:augmont_v2/controllers/wallets_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../Utils/colors.dart';
import '../../../Utils/strings.dart';
import '../../../widgets/text_component.dart';

class SOGDetailsScreen extends StatefulWidget {
  const SOGDetailsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SOGDetailsState();
  }
}

class _SOGDetailsState extends State<SOGDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WalletsController>(builder: (controller) {
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
                  child: Text("Details",
                      style: TextStyle(
                        color: primaryTextColor,
                        fontFamily: Strings.fontFamilyName,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ))),
            ),
            body: SingleChildScrollView(
              child: Container(
                color: kycProductBackgroundColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      color: kycProductBackgroundColor,
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          textComponent("Order ID : CW20213987608", 13,
                              FontWeight.normal),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              height: 200,
                              width: MediaQuery.sizeOf(context).width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: shadowColor),
                                borderRadius: BorderRadius.circular(10.0),
                              )),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: 55,
                      color: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      child: textComponent(
                          Strings.jewellerDetails, 17, FontWeight.w600),
                    ),
                    Container(
                      color: kycProductBackgroundColor,
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          sellingDetailsWidget(Strings.noOrnamentsSold, "3"),
                          SizedBox(
                            height: 10,
                          ),
                          sellingDetailsWidget(
                              Strings.purityofOrnaments, "24k"),
                          SizedBox(
                            height: 10,
                          ),
                          sellingDetailsWidget(Strings.totalsoldGold, "50 gms"),
                          SizedBox(
                            height: 10,
                          ),
                          sellingDetailsWidget(
                              Strings.amountReceived, "15,600"),
                          SizedBox(
                            height: 10,
                          ),
                          sellingDetailsWidget(
                              Strings.sellingDate, "16 May,2024"),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: 55,
                      color: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      child: textComponent(
                          Strings.jewellerDetails, 17, FontWeight.w600),
                    ),
                    Container(
                      color: kycProductBackgroundColor,
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundColor: primaryTextColor,
                            child: Text("A"),
                          ),
                          SizedBox(width: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textComponent("Anand Mishra", 14, FontWeight.w600),
                              textComponent("Mobile Numner: 98989898989889", 12, FontWeight.normal),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )));
    });
  }

  Widget sellingDetailsWidget(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        textComponent(title, 13, FontWeight.normal),
        textComponent(value, 13, FontWeight.w600),
      ],
    );
  }
}
