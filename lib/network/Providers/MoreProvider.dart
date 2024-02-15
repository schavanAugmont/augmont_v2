import 'package:augmont_v2/Network/api_client.dart';
import 'package:get/get_connect/connect.dart';



class MoreProvider extends GetConnect {

  Future<dynamic> getTrusteeCert() async {
    try {
      final response = await ApiClient().getApi("customer/app/trustee-certificate");
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<dynamic> getLiveRateList() async {
    try {
      final response = await ApiClient().getApi("digital-gold/rates/live-gold-rate");
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<dynamic> getLastRateList() async {
    try {
      final response = await ApiClient().getApi("digital-gold/rates/last-ten-gold-rate?city=Mumbai");
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }
}