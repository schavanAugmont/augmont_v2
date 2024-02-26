import 'dart:async';
import 'dart:convert';

import 'package:augmont_v2/Screens/DigitalInvestment/digiinvestment_dashborad_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../Network/ErrorHandling.dart';
import '../Utils/colors.dart';
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

  void goToInvestmentDashbord(){
    Get.to(() => DigitalInvestmentGoldScreen(),binding: DigitalInvestmentBiding());
  }
}
