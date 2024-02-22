import 'dart:convert';

import 'package:augmont_v2/Network/api_client.dart';

import '../../Utils/print_logs.dart';

class PersonalizQusProvider {
  PersonalizQusProvider();

  Future<dynamic> customerInfoQuestion() async {
    try {
      final response =
          await ApiClient().getApi('customer/app/customer-info-question');
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<dynamic> customerAnsQuestion() async {
    try {
      final response =
          await ApiClient().getApi('customer/app/customer-answer-question');
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<dynamic> customeraddAns(String quesId, String answ) async {
    try {
      Map<String, dynamic> toJson() =>
          {"questionId": quesId, "answer": answ.toLowerCase()};
      var jsonMap = json.encode(toJson());
      PrintLogs.printData(jsonMap);
      final response = await ApiClient()
          .postApi("customer/app/update-personal-info", jsonMap);
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }
}
