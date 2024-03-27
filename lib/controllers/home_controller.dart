import 'dart:async';
import 'dart:convert';

import 'package:augmont_v2/Screens/DigitalInvestment/digiinvestment_dashborad_screen.dart';
import 'package:augmont_v2/Screens/GoldGift/gold_gift_screen.dart';
import 'package:augmont_v2/Utils/RateCalculator.dart';
import 'package:augmont_v2/bindings/gifting_binding.dart';
import 'package:augmont_v2/controllers/wallet_controller.dart';
import 'package:augmont_v2/models/HomeProductModel.dart';
import 'package:augmont_v2/models/stepupsipList_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../Models/PassbookDetailsModel.dart';
import '../Network/ErrorHandling.dart';
import '../Network/Providers/SignInProvider.dart';
import '../Utils/colors.dart';
import '../Utils/dialog_helper.dart';
import '../Utils/popover.dart';
import '../Utils/print_logs.dart';
import '../Utils/session_manager.dart';
import '../Utils/strings.dart';
import '../bindings/digitalinvestment_binding.dart';
import '../models/FDPassbookDetailsModel.dart';
import '../models/GoldRateModel.dart';
import '../network/Providers/HomeProvider.dart';
import '../network/Providers/WalletProvider.dart';

class HomeController extends GetxController with StateMixin<dynamic> {
  late SessionManager sessionManager;
  var isUserLoggedIn = false.obs;

  static HomeController get to => Get.find();
  Timer? timer;

  var currentGoldBuyRate = "".obs;
  var currentSilverBuyRate = "".obs;
  var currentGoldSellRate = "".obs;
  var currentSilverSellRate = "".obs;

  var stepupListData = <StepupListData>[].obs;
  var productListData = <ProductData>[].obs;

  double goldBuyGstRate = 0.0;
  double silverBuyGstRate = 0.0;
  double goldBuyRate = 0.0;
  double silverBuyRate = 0.0;
  double goldSellRate = 0.0;
  double silverSellRate = 0.0;
  var redrawObject = Object();

  var walletGoldInGrams = "".obs;
  var walletFDGoldInGrams = "".obs;
  var walletSilverInGrams = "".obs;
  var walletAmt = 0.0.obs;
  late SessionManager _sessionManager;

  var sellableGoldBalance = 0.0.obs;
  var sellableSilverBalance = 0.0.obs;

  var goldInGrams = 0.0.obs;
  var goldFDGrams = 0.0.obs;
  var silverInGrams = 0.0.obs;

  var standardGoldRates = 0.0.obs;
  var plusGoldRates = 0.0.obs;
  var diffrenceGoldRate = 0.0.obs;
  var totalAmount=0.0.obs;
  var isVisible=true.obs;

  @override
  void onInit() {
    sessionManager = SessionManager();
    currentGoldBuyRate('₹ $goldBuyRate/gm');
    currentSilverBuyRate('₹ $silverBuyRate/gm');
    currentGoldSellRate('₹ $goldSellRate/gm');
    currentSilverSellRate('₹ $silverSellRate/gm');
    setWalletData();
    getProductList();
    fetchGoldRate();
    setTimer();
    isLoggedIn();

    super.onInit();
  }

  @override
  void onReady() {
    // WalletController.to.fetchPassbookDetails();
    // WalletController.to.getFDDetails();

   // isLoggedIn();
    super.onReady();
  }

  @override
  void onClose() {
    cancelTimer();
    super.onClose();
  }

  @override
  void dispose() {
    cancelTimer();
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

        currentGoldBuyRate('₹ $goldBuyRate/gm');
        currentSilverBuyRate('₹ $silverBuyRate/gm');

        currentGoldSellRate('₹ $goldSellRate/gm');
        currentSilverSellRate('₹ $silverSellRate/gm');

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

  Future<void> isLoggedIn() async {
    var boo = SessionManager.isLoggedIn();
    isUserLoggedIn(boo);
    update();
    if (isUserLoggedIn.value) {
      fetchPassbookDetails();
      getStepupSIPList();
    } else {
      setWalletData();
    }

    // if(boo) FirebaseUtil.login();
    // if (boo) {
    //   final token = await sessionManager.getFcmToken();
    //   sessionManager.isFcmTokenSet().then((value) {
    //     if(value == false){
    //       ApiBaseHelper().putApi('customer/app/notification/fcm-update',jsonEncode({
    //         'fcmToken':token,
    //       })).then((value){
    //         sessionManager.setIsFcmTokenSet(true);
    //       });
    //     }
    //   });
    // }
  }

  Future<void> fetchPassbookDetails({showDialog = true}) async {
    if (showDialog) DialogHelper.showLoading();
    SignInProvider().getPassbookDetails().then(
      (value) {
        if (showDialog) DialogHelper.dismissLoader();

        try {
          var jsonMap = jsonDecode(value);
          var details = PassbookDetailsModel.fromJson(jsonMap);
          walletGoldInGrams(details.result.data.goldGrms + "g");
          walletSilverInGrams(details.result.data.silverGrms + "g");

          sellableGoldBalance(
              double.parse(details.result.data.sellableGoldBalance));
          sellableSilverBalance(
              double.parse(details.result.data.sellableSilverBalance));

          goldInGrams(double.parse(details.result.data.goldGrms));
          silverInGrams(double.parse(details.result.data.silverGrms));
          getFDDetails();
          setDifferenceCal();

          update();
        } catch (e) {
          PrintLogs.printException(e);
        }
      },
      onError: (error) {
        if (showDialog) DialogHelper.dismissLoader();

        ErrorHandling.handleErrors(error);
      },
    );
  }

  Future<void> getFDDetails({showDialog = true}) async {
    if (showDialog) DialogHelper.showLoading();
    WalletProvider().getFDBalance().then(
      (value) {
        if (showDialog) DialogHelper.dismissLoader();

        try {
          var jsonMap = jsonDecode(value);
          var details = FDPassbookDetailsModel.fromJson(jsonMap);
          walletFDGoldInGrams(details.data!.result!.data!.investedGold! + "g");
          goldFDGrams(double.parse(details.data!.result!.data!.investedGold!));
          update();
        } catch (e) {
          PrintLogs.printException(e);
        }
      },
      onError: (error) {
        if (showDialog) DialogHelper.dismissLoader();

        ErrorHandling.handleErrors(error);
      },
    );
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
                        Get.to(() => GoldGiftScreen(),
                            binding: GiftingBinding());
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

  void getStepupSIPList({showDialog = true}) async {
    if (showDialog) DialogHelper.showLoading();
    var customerId = SessionManager.getCustomerId();
    HomeProvider().getStepupSIPList(customerId).then(
      (value) {
        if (showDialog) DialogHelper.dismissLoader();

        try {
          var jsonMap = jsonDecode(value);
          print("sip kls $jsonMap");
          var details = StepupSIPListModel.fromJson(jsonMap);
          stepupListData.clear();
          details.data?.forEach((it) {
            stepupListData.add(it);
          });
          update();
        } catch (e) {
          PrintLogs.printException(e);
        }
      },
      onError: (error) {
        if (showDialog) DialogHelper.dismissLoader();

        ErrorHandling.handleErrors(error);
      },
    );
  }

  void getProductList({showDialog = true}) async {
    if (showDialog) DialogHelper.showLoading();
    HomeProvider().getProductList().then(
      (value) {
        if (showDialog) DialogHelper.dismissLoader();

        try {
          var jsonMap = jsonDecode(value);
          print("productList $jsonMap");
          var details = HomeProductModel.fromJson(jsonMap);
          productListData.clear();
          details.data?.forEach((it) {
            productListData.add(it);
          });
          update();
        } catch (e) {
          PrintLogs.printException(e);
        }
      },
      onError: (error) {
        if (showDialog) DialogHelper.dismissLoader();

        ErrorHandling.handleErrors(error);
      },
    );
  }

  void setWalletData() {
    walletGoldInGrams("0.00g");
    walletFDGoldInGrams("0.00g");
    walletSilverInGrams("0.00g");
    update();
  }

  Future<void> setDifferenceCal() async {
    var totalgoldRate = goldBuyRate * goldInGrams.value;
    standardGoldRates((11 / 100) * totalgoldRate);
    plusGoldRates((16 / 100) * totalgoldRate);
    diffrenceGoldRate(plusGoldRates.value - standardGoldRates.value);

    var gold = await RateCalculator.getAmountFromCalculation(goldInGrams.toString(), goldBuyRate);
    var sliver = await RateCalculator.getAmountFromCalculation(silverInGrams.toString(), silverBuyRate);
    var fd=await RateCalculator.getAmountFromCalculation(goldFDGrams.toString(), plusGoldRates.value);

    totalAmount(gold+sliver+fd);
    update();
  }

  String replaceText(String value){
    print("word count ${value.length}");
   // var value1=value.replaceRange(1, value.length, 'x');

    List<String> words = value.split('');

    // Iterate over the words and replace those within the specified range
    for (int i = 1; i <= value.length && i < words.length; i++) {
      words[i] = 'X';
    }

    return words.join(' ');

  }
}
