import 'package:get/get.dart';

import '../api_base_helper.dart';

class IntroProvider extends GetConnect {
  Future<dynamic> getLoanList(String screenName) async {
    try {
      final response = await ApiBaseHelper().getApi("customer/app/screen-configuration?screen=$screenName");
      return response;
    }catch(e){
      return Future.error(e);
    }
  }

}