import 'dart:convert';

import 'package:get/get_connect/connect.dart';
import '../../Utils/print_logs.dart';
import '../../Utils/session_manager.dart';
import '../api_base_helper.dart';

class SignInProvider extends GetConnect {
  Future<dynamic> generateOtp(String mobileNo, bool isVoice) async {
    try {
      Map<String, dynamic> toJson() =>
          {"mobileNumber": mobileNo, "isResendOtpByVoice": isVoice};
      var jsonMap = json.encode(toJson());
      PrintLogs.printData(jsonMap);
      final response =
          await ApiBaseHelper().postApi("customer/customer-sign-up", jsonMap);
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<dynamic> signIn(
      String mobileNo, String otp, String referenceCode) async {
    try {
      final token = await SessionManager().getFcmToken();
      Map<String, dynamic> toJson() => {
            "mobileNumber": mobileNo,
            "otp": otp,
            "referenceCode": referenceCode,
            "fcmToken": token,
          };
      var jsonMap = json.encode(toJson());
      PrintLogs.printData(jsonMap);
      final response =
          await ApiBaseHelper().postApi("auth/verify-customer-login", jsonMap);
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<dynamic> getPersonalDetails() async {
    try {
      final response =
          await ApiBaseHelper().getApi("customer/app/personal-info");
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<dynamic> getPassbookDetails() async {
    try {
      final response = await ApiBaseHelper()
          .getApi("digital-gold/customer/passbook-details");
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<dynamic> existentCustomer() async {
    try {
      final response = await ApiBaseHelper()
          .getApi("digital-gold/customer/create-existent-customer");
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<dynamic> getCustomerDetails() async {
    try {
      final response = await ApiBaseHelper().getApi("digital-gold/customer");
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }
}
