import 'package:augmont_v2/controllers/wallet_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../Utils/colors.dart';
import '../../Utils/strings.dart';
import '../../widgets/text_component.dart';

class MerchantHoldingScreen extends StatefulWidget {
  const MerchantHoldingScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MerchantHoldingState();
  }
}

class _MerchantHoldingState extends State<MerchantHoldingScreen> {
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
                  child: Text(Strings.merchantHolding,
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
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(bottom: 10),
                          width: MediaQuery.sizeOf(context).width,
                          decoration: BoxDecoration(
                           color: kycProductBackgroundColor,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textComponent("Demo Merchant", 16, FontWeight.w600),
                             Padding(padding: EdgeInsets.only(top: 10),child: Row(
                               children: [
                                 Expanded(child: merchantItem("Gold", "10.11 grams")),
                                 SizedBox(width: 10,),
                                 Expanded(child: merchantItem("Sliver", "10.11 grams")),
                               ],
                             ))

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

  Widget merchantItem(String title,String descp ){
    return Container(
      padding: EdgeInsets.all(10),
      color: shadowColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          textComponent(title, 14, FontWeight.normal),
          textComponent(descp, 16, FontWeight.w600)
        ],
      ),
    );
  }
}
