import 'package:augmont_v2/Network/api_client.dart';
import 'package:get/get_connect/connect.dart';


class HomeProvider  extends GetConnect {
  // Get request
  Future<dynamic> getGoldRate() async {
    try {
      final response = await ApiClient().getApi("digital-gold/rates");
      print(response);
        return response;

    }catch(e){
      return Future.error(e);
    }
  }


  Future<dynamic> getProductList() async {
    try {
      final response = await ApiClient().getApi("customer/app/category/category-list",server: ServerType.EMI);
      print(response);
      return response;

    }catch(e){
      return Future.error(e);
    }
  }

  Future<dynamic> getStepupSIPList(String customerId) async {
    try {
      final response = await ApiClient().getApi("sip/sip-data/all-sip?from=1&to=25&customerId=$customerId&isStepUpSip=false");
      print(response);
      return response;

    }catch(e){
      return Future.error(e);
    }
  }


  Future<dynamic> getAppVersion() async {
    try {
      final response = await ApiClient().getApi("app-version");
      print(response);
      return response;
    }catch(e){
      return Future.error(e);
    }
  }

  Future<dynamic> getBanner() async {
    try {
      final response = await ApiClient().getApi("customer/app/new-banner/mobile");
      return response;
    }catch(e){
      return Future.error(e);
    }
  }

  Future<dynamic> getLoanList() async {
    try {
      final response = await ApiClient().getApi("customer/app/my-loan");
      return response;
    }catch(e){
      return Future.error(e);
    }
  }
}
