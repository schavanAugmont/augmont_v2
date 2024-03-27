import 'package:get/get_connect/connect.dart';

import '../../Network/api_client.dart';

class DGProvider extends GetConnect {
  Future<dynamic> fetchDGConfig() async {
    try {
      final response = await ApiClient().getApi("customer/app/config-detail");
      return response;
    } catch (e) {
      return Future.error(e);
    }
  }
}
