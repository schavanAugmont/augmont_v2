import 'package:augmont_v2/Controllers/sing_in_controller.dart';
import 'package:augmont_v2/controllers/dgsip_controller.dart';
import 'package:augmont_v2/controllers/digitalinvestment_controller.dart';
import 'package:augmont_v2/controllers/forgotpin_controller.dart';
import 'package:get/get.dart';

import '../Controllers/intro_controller.dart';

class DigitalInvestmentBiding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DigitalInvestmentController>(
      () => DigitalInvestmentController(),
      fenix: true,
    );

    Get.lazyPut<DgSIPController>(
          () => DgSIPController(),
      fenix: true,
    );
  }
}
