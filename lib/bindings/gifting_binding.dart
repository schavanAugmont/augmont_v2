import 'package:augmont_v2/controllers/wallets_controller.dart';

import '../controllers/goldgift_controller.dart';
import '../controllers/shop_emi_controller.dart';
import 'package:get/get.dart';

class GiftingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GoldGiftController>(() => GoldGiftController());

  }
}
