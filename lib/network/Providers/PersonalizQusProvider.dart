import 'package:augmont_v2/Network/api_client.dart';

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
}
