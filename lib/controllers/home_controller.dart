import 'dart:async';
import 'dart:convert';

import 'package:augmont_v2/Screens/DigitalInvestment/digiinvestment_dashborad_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../Network/ErrorHandling.dart';
import '../Utils/colors.dart';
import '../Utils/popover.dart';
import '../Utils/print_logs.dart';
import '../Utils/session_manager.dart';
import '../Utils/strings.dart';
import '../bindings/digitalinvestment_binding.dart';
import '../models/GoldRateModel.dart';
import '../network/Providers/HomeProvider.dart';

class HomeController extends GetxController with StateMixin<dynamic> {
  late SessionManager sessionManager;

  Timer? timer;

  var currentGoldBuyRate = "".obs;
  var currentSilverBuyRate = "".obs;
  var currentGoldSellRate = "".obs;
  var currentSilverSellRate = "".obs;

  double goldBuyGstRate = 0.0;
  double silverBuyGstRate = 0.0;
  double goldBuyRate = 0.0;
  double silverBuyRate = 0.0;
  double goldSellRate = 0.0;
  double silverSellRate = 0.0;
  var redrawObject = Object();

  @override
  void onInit() {
    sessionManager = SessionManager();
    currentGoldBuyRate('₹ $goldBuyRate  / gm');
    currentSilverBuyRate('₹ $silverBuyRate  / gm');
    currentGoldSellRate('₹ $goldSellRate  / gm');
    currentSilverSellRate('₹ $silverSellRate  / gm');
    setTimer();
    //isLoggedIn();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    cancelTimer();
    super.onClose();
  }

  @override
  void dispose() {
    super.dispose();
  }

  checkForNewRatePrice() {
    fetchGoldRate(isFromTimer: true);
  }

  void fetchGoldRate({var isFromTimer = false}) async {
    HomeProvider().getGoldRate().then((value) {
      try {
        var jsonMap = jsonDecode(value);

        var rates = GoldRateModel.fromJson(jsonMap);
        goldBuyRate = double.parse(rates.rate.rates.gBuy);
        silverBuyRate = double.parse(rates.rate.rates.sBuy);

        goldSellRate = double.parse(rates.rate.rates.gSell);
        silverSellRate = double.parse(rates.rate.rates.sSell);

        goldBuyGstRate = double.parse(rates.rate.rates.gBuyGst);
        silverBuyGstRate = double.parse(rates.rate.rates.sBuyGst);

        currentGoldBuyRate('₹ $goldBuyRate  / gm');
        currentSilverBuyRate('₹ $silverBuyRate  / gm');

        currentGoldSellRate('₹ $goldSellRate  / gm');
        currentSilverSellRate('₹ $silverSellRate  / gm');

        redrawObject = Object();

        update();
      } catch (e) {
        PrintLogs.printException(e);
      }
    }, onError: (error) {
      if (!isFromTimer) {
        ErrorHandling.handleErrors(error);
      }
    });
  }

  void setTimer() async {
    cancelTimer();

    timer = Timer.periodic(
        const Duration(seconds: 30), (Timer t) => checkForNewRatePrice());
  }

  void cancelTimer() {
    if (timer != null) {
      timer?.cancel();
    }
  }

  void goToInvestmentDashbord() {
    Get.to(() => DigitalInvestmentGoldScreen(),
        binding: DigitalInvestmentBiding());
  }

  void sendGiftDailog(BuildContext context) {
    showModalBottomSheet<int>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, StateSetter setState) {
          return Popover(
            maxheight: MediaQuery.sizeOf(context).height * 0.30,
            child: Container(
              padding: EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Text("Gift Gold with Augmont",
                          style: TextStyle(
                            color: primaryTextColor,
                            fontFamily: Strings.fontFamilyName,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ))),
                  SizedBox(
                    height: 10,
                  ),
                  giftDailogComponents("* Validity Peroid: ",
                      "Augmont Gold Gift Cards are valid for 365 days from the date of purchase and carry no fees."),
                  SizedBox(
                    height: 5,
                  ),
                  giftDailogComponents("* Restrictions: ",
                      "Augmont Gold Gift Cards can only be used for online shopping and not offline shopping."),
                  SizedBox(
                    height: 5,
                  ),
                  giftDailogComponents("* How to redeem: ",
                      "Users will have to scratch the gift card"),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 40.0),
                        backgroundColor: primaryTextColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // <-- Radius
                        ),
                      ),
                      child: Text(Strings.proccedGift,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: Strings.fontFamilyName,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ))),
                ],
              ),
            ),
          );
        });
      },
    );
  }

  Widget giftDailogComponents(String title, String descp) {
    return RichText(
        text: TextSpan(
      text: title,
      style: TextStyle(
        fontFamily: Strings.fontFamilyName,
        fontWeight: FontWeight.w600,
        color: primaryTextColor,
        fontSize: 11,
      ),
      children: <TextSpan>[
        TextSpan(
          text: descp,
          style: TextStyle(
            fontFamily: Strings.fontFamilyName,
            fontWeight: FontWeight.normal,
            color: primaryTextColor,
            fontSize: 11,
          ),
        ),
      ],
    ));
  }
}
