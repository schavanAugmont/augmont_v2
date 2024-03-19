import 'dart:convert';

import 'package:get/get_connect/connect.dart';

import '../../Network/api_client.dart';



class WalletProvider extends GetConnect {
  // Get request
  Future<dynamic> getWalletBalance() async {
    try {
      final response = await ApiClient()
          .getApi("customer/app/customer-wallet/wallet-balance");
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<dynamic> getFDBalance() async {
    try {
      final response = await ApiClient()
          .getApi("customer/app/fd/scheme/passbook");
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<dynamic> fetchBankDetails() async {
    try {
      final response =
          await ApiClient().getApi("customer/app/augmont-bank-detail");
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<dynamic> fetchBankList() async {
    try {
      final response =
          await ApiClient().getApi("digital-gold/bank?count=200");
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<dynamic> applyCouponCode(String code) async {
    try {
      //Comment by deepak on 12 Oct 2022
      // final response = await ApiClient().postApi("customer/app/redeem-coupon", jsonEncode);
      String url = 'customer/app/coupons/check-validity?code=$code&merchantId=0&customerId=0&from=wallet';
      final response = await ApiClient().getApi(url);
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<dynamic> walletCouponBenefit(String code) async {
    try {
      Map<String,dynamic> body ={
        'couponCode':code.trim(),
      };
      final response = await ApiClient().postApi('customer/app/customer-wallet/coupon-benefit',jsonEncode(body));
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }


  Future<dynamic> coupon(String url) async {
    try {
      final response = await ApiClient().getApi(url);
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }
}
