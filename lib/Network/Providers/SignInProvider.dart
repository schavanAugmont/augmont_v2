import 'dart:convert';

import 'package:get/get_connect/connect.dart';
import '../../Utils/device_util.dart';
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

  Future<dynamic> getStateList() async {
    try {
      final response = await ApiBaseHelper().getApi("state");
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<dynamic> getCityList(String id) async {
    try {
      final response = await ApiBaseHelper().getApi("city?stateId=$id");
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<dynamic> signUp(String firstName, String lastName, String mobileNo,
      String cityId, String stateId, String otp, String referenceCode) async {
    try {
      final token = await SessionManager().getFcmToken();
      var screeName = await SessionManager().getAfterSignInScreen();
      Map<String, dynamic> toJson() => {
            "mobileNumber": mobileNo,
            "otp": otp,
            "referenceCode": referenceCode,
            "firstName": firstName,
            "lastName": lastName,
            "cityId": cityId,
            "stateId": stateId,
            "fcmToken": token,
            "isFromWeb": false,
          };
      var jsonMap = json.encode(toJson());
      PrintLogs.printData(jsonMap);
      final response =
          await ApiBaseHelper().postApi("customer/sign-up", jsonMap);
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<dynamic> setPIN(String pin) async {
    try {
      Map<String, dynamic> toJson() => {
            "pin": pin,
            "deviceId": DeviceUtil.instance.deviceId.toString(),
          };
      var jsonMap = json.encode(toJson());
      PrintLogs.printData(jsonMap);
      final response =
          await ApiBaseHelper().postApi("customer/app/add-pin", jsonMap);
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<dynamic> setValidatePIN(String pin, bool verifyByPin) async {
    try {
      Map<String, dynamic> toJson() => {
            "pin": pin,
            "deviceId": DeviceUtil.instance.deviceId.toString(),
            "verifyByPin": verifyByPin
          };
      var jsonMap = json.encode(toJson());
      PrintLogs.printData(jsonMap);
      final response = await ApiBaseHelper()
          .postApi("customer/app/validate-pin-biometric", jsonMap);
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }
}
