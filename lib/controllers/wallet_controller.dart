import 'dart:convert';

import 'package:augmont_v2/models/FDPassbookDetailsModel.dart';
import 'package:get/get.dart';
import '../Models/PassbookDetailsModel.dart';
import '../Network/Providers/SignInProvider.dart';
import '../Utils/dialog_helper.dart';
import '../Utils/print_logs.dart';
import '../Utils/session_manager.dart';
import '../Utils/utils.dart';
import '../models/WalletBalanceModel.dart';
import '../network/ErrorHandling.dart';
import '../network/Providers/WalletProvider.dart';

class WalletController extends GetxController with StateMixin<dynamic> {
  var walletAmount = "".obs;
  var freeAmount = "".obs;

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

  static WalletController get to => Get.find();

  @override
  void onInit() {
    _sessionManager = SessionManager();
    walletAmount("₹ $walletAmt");
    walletGoldInGrams("0.00g");
    walletFDGoldInGrams("0.00g");
    walletSilverInGrams("0.00g");
    fetchWalletBalance();
    super.onInit();
  }

  Future<void> fetchWalletBalance() async {
    var flag = await SessionManager.isLoggedIn();
    if (flag) {
      WalletProvider().getWalletBalance().then((value) {
        try {
          var jsonMap = jsonDecode(value);
          var balance = WalletBalanceModel.fromJson(jsonMap);
          walletAmt(double.parse(balance.currentWalletBalance));
          //walletAmount("₹ $walletAmt");
          walletAmount(Utils().toCurrency(walletAmt));
          freeAmount(balance.walletFreeBalance);
          update();
        } catch (e) {
          PrintLogs.printException(e);
        }
      }, onError: (error) {
        ErrorHandling.handleErrors(error);
      });
    }
  }

  Future<void> fetchPassbookDetails({showDialog = true}) async {

    var flag = await SessionManager.isLoggedIn();
    print("longn $flag");
    if (flag) {
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
  }


  Future<void> getFDDetails({showDialog = true}) async {

    var flag = await SessionManager.isLoggedIn();
    print("longn $flag");
    if (flag) {
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
  }
}
