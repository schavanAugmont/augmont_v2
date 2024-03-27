import 'dart:convert';

import 'package:augmont_v2/Network/api_client.dart';
import 'package:get/get.dart';

import '../../utils/print_logs.dart';


class SipDetailsProvider extends GetConnect {
  Future<dynamic> fetchSipList(from, to, customerId) async {
    try {
      final response = await ApiClient().getApi(
          "sip/sip-data/all-sip?from=$from&to=$to&customerId=$customerId");
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<dynamic> fetchKycData() async {
    try {
      final response =
          await ApiClient().getApi("digital-gold/customer-kyc");
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<dynamic> fetchSipRate() async {
    try {
      final response = await ApiClient().getApi("sip/sip-data/rate");
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<dynamic> fetchSipTransactions(from, to, applicationId) async {
    try {
      final response = await ApiClient().getApi(
          "sip/sip-data/transaction?from=$from&to=$to&sipApplicationId=$applicationId");
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<dynamic> transactionExport(applicationId) async {
    try {
      final response = await ApiClient().getApi(
          "sip/sip-data/transaction-export/?sipApplicationId=$applicationId");
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<dynamic> generateInvoiceSip(id) async {
    try {

      // final response = await ApiClient()
      //     .getApi("/digital-gold/buy/generate-invoice/$id");
      Map<String, dynamic> toJson() => {
        "id": id,
      };
      var jsonMap = json.encode(toJson());
      final response = await ApiClient().postApi("digital-gold/buy/generate-invoice", jsonMap);
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<dynamic> terminateSip(
      String sipApplicationId, String sipTerminationReason) async {
    try {
      Map<String, dynamic> toJson() => {
            "sipApplicationId": sipApplicationId,
            "sipTerminationReason": sipTerminationReason
          };
      var jsonMap = json.encode(toJson());
      PrintLogs.printData(jsonMap);
      final response = await ApiClient().postApi("sip/terminate", jsonMap);
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }


  Future<dynamic> reviewSip(
      String sipApplicationId) async {
    try {
      Map<String, dynamic> toJson() => {
        "sipApplicationId": sipApplicationId
      };
      var jsonMap = json.encode(toJson());
      PrintLogs.printData(jsonMap);
      final response = await ApiClient().postApi("sip/renew/review", jsonMap);
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<dynamic> fetchReview(int sipId) async {
    try {
      Map<String, dynamic> toJson() => {
            "sipApplicationId": sipId,
          };
      var jsonMap = json.encode(toJson());
      PrintLogs.printData(jsonMap);
      final response =
          await ApiClient().postApi("sip/renew/review", jsonMap);
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<dynamic> setTenureInSip(int sipId, String tenureID) async {
    try {
      Map<String, dynamic> toJson() => {
            "sipApplicationId": sipId,
            "sipInvestmentTenureId": tenureID,
          };
      var jsonMap = json.encode(toJson());
      PrintLogs.printData(jsonMap);
      final response =
          await ApiClient().postApi("sip/renew/review", jsonMap);
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<dynamic> submitRenewSip(
      int sipId, String selectedSipDurationId) async {
    try {
      Map<String, dynamic> toJson() => {
            "sipApplicationId": sipId,
            "sipInvestmentTenureId": selectedSipDurationId,
          };
      var jsonMap = json.encode(toJson());
      PrintLogs.printData(jsonMap);
      final response =
          await ApiClient().postApi("sip/renew/submit", jsonMap);
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }
}
