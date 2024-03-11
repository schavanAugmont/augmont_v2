import 'package:get/get.dart';

import '../controllers/emi_detail_controller.dart';

class EmiDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmiDetailController>(() => EmiDetailController());
  }
}