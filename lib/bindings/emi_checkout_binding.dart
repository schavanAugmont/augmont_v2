import 'package:get/get.dart';

import '../controllers/emi_checkout_controller.dart';

class EmiCheckoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmiCheckoutController>(() => EmiCheckoutController());
  }
}