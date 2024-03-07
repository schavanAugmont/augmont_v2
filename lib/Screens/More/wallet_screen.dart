import 'package:augmont_v2/controllers/wallet_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../Utils/colors.dart';
import '../../Utils/strings.dart';
import '../../controllers/editprofile_controller.dart';
import '../../widgets/text_component.dart';
import '../SignIn/Components/RoundedTextField.dart';
import '../SignIn/Components/SignInComponents.dart';
import '../SignIn/Components/TextFieldContainer.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _WalletState();
  }
}

class _WalletState extends State<WalletScreen> {
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
                  child: Text(Strings.wallets,
                      style: TextStyle(
                        color: primaryTextColor,
                        fontFamily: Strings.fontFamilyName,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ))),
            ),
            bottomNavigationBar: controller.isWalletAmout.value
                ? Container(
                    height: 55,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    // Adjust padding as needed
                    child: Row(
                      children: [
                        Expanded(
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
                          child: Text(Strings.withdraw,
                              style: TextStyle(
                                color: primaryTextColor,
                                fontFamily: Strings.fontFamilyName,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              )),
                        )),
                        SizedBox(width: 10,),
                        Expanded(
                            child: ElevatedButton(
                                onPressed: () {
                                  controller.addamoutDailog(context);
                                },
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    backgroundColor: Colors.black),
                                child: Text(Strings.addmoreFund,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: Strings.fontFamilyName,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ))))
                      ],
                    ))
                : null,
            body: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    walletAmt(),
                    SizedBox(
                      height: 10,
                    ),
                    controller.isWalletAmout.value
                        ? walletList(context, controller)
                        : emptyWallet(context, controller)
                  ],
                ),
              ),
            ),
          )));
    });
  }

  Widget walletAmt() {
    return Container(
      decoration: BoxDecoration(
        color: primaryTextColor,
        borderRadius: BorderRadius.circular(5.0),
      ),
      margin: EdgeInsets.only(bottom: 5),
      padding: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            Strings.walletAmtAvlb,
            style: TextStyle(
              color: Colors.white,
              fontFamily: Strings.fontFamilyName,
              fontWeight: FontWeight.normal,
              fontSize: 11,
            ),
          ),
          Spacer(),
          Text(
            "₹5,000",
            style: TextStyle(
              color: Colors.white,
              fontFamily: Strings.fontFamilyName,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget emptyWallet(BuildContext context, WalletController controller) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height / 1.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/empty_wallet.png"),
          SizedBox(
            height: 10,
          ),
          textComponent(
              "Your wallet is empty at the moment", 14, FontWeight.w600),
          SizedBox(
            height: 5,
          ),
          textComponent("Add fund to your wallet", 12, FontWeight.normal),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                controller.updateWallet();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text(Strings.addmoreFund,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: Strings.fontFamilyName,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  )))
        ],
      ),
    );
  }

  Widget walletList(BuildContext context, WalletController controller) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: kycProductBackgroundColor,
          ),
          margin: const EdgeInsets.only(bottom: 10),
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
          child: TextButton(
            onPressed: () {
              controller.onPersonalExpand();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textComponent("Transaction logs", 12, FontWeight.normal),
                Image.asset(
                  controller.isPersonalDetailsExpanded.value
                      ? 'assets/images/up_arrow.png'
                      : 'assets/images/down_arrow.png',
                  width: 15,
                  height: 15,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
        if (controller.isPersonalDetailsExpanded.value)
          ListView.builder(
            itemCount: 5,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                color: kycProductBackgroundColor,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textComponent("Gold SIP(Wedding)", 12, FontWeight.w600),
                        textComponent("₹52", 14, FontWeight.w600),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textComponent("Nov 27,2023", 11, FontWeight.normal),
                        textComponent("Added to wallet", 11, FontWeight.normal),
                      ],
                    )
                  ],
                ),
              );
            },
          )
      ],
    );
  }


}
